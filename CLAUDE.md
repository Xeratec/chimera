# CLAUDE.md

Guidance for Claude Code (claude.ai/code) when working in this repository.

## What Chimera is

Chimera is an open-source, configurable heterogeneous SoC template (PULP Platform, ETH Zurich /
University of Bologna). It integrates:

- a **Cheshire** host SoC (64-bit CVA6, CLINT/PLIC/CLIC, JTAG debug, UART/I²C/SPI/GPIO, AXI LLC),
- up to **5 Snitch clusters** (9 cores each) as compute accelerators — count and type are set in
  `hw/chimera_pkg.sv` `ExtClusters`/`ChimeraClusterCfg` (this build: 5× `SNITCH`),
- a shared multi-banked **memory island** (`0x4800_0000`),
- a **HyperBus** controller for off-chip HyperRAM (`0x8000_0000`).

This repo is the *integration layer*: almost all leaf IP comes from Bender git dependencies
(cheshire, snitch_cluster, idma, memory_island, hyperbus, axi, common_cells, …). The RTL here
wires those together and adds SoC-control registers, a Snitch bootrom, and the cluster/memory
adapters. The SoC **software** is the `chimera-sdk` submodule (`sw/deps/chimera-sdk`).

## Documentation map

Detailed docs live in `docs/`:

- `docs/architecture.md` — SoC block diagram, HW module map, address map.
- `docs/build-system.md` — HW (Bender+Make), SW (chimera-sdk CMake), SystemRDL, and test targets.
- `docs/software.md` — SW/SDK layout, the cluster-offload model, snitch bootrom.
- `docs/verification.md` — the ctest+pytest RTL-sim test flow and test inventory.
- `docs/sdk-integration.md` — how `chimera-sdk` is integrated (submodule, `chimera-gen` target, container).
- `docs/rdl-support.md`, `docs/addressmap.md`, `docs/memory-map.md` — SystemRDL flow + generated map.

`TODO.md` (repo root) tracks the active cleanup / verification-framework initiative.

## Environment

IIS members: `source iis-env.sh` (pins bender-0.31.0, questa-2022.3, RISC-V GCC 32/64, Snitch
LLVM, python3.11; auto-creates `.venv`). Non-IIS: `make python-venv` (uv), install Bender, and a
RISC-V GCC toolchain (`RISCV_GCC_BINROOT`) for the HW-side bootroms. The **SoC software** uses the
SDK's own LLVM+picolibc toolchain inside a container (Singularity/Docker). See `README.md`.

## Build

Hardware (Bender + Make wrapping Cheshire), software (chimera-sdk CMake in a container), and the
memory-map artifacts (SystemRDL/peakrdl) are three separate flows.

```sh
bender checkout
make chim-all        # = HW (chs-hw-init sn-hw-all chim-bootrom-init) + SW (chim-rdl chim-sw) + sim (chim-sim)
```

Selective:
```sh
make chs-hw-init         # patch PLIC, gen iDMA, then Cheshire chs-hw-all
make sn-hw-all           # generate Snitch cluster RTL
make chim-rdl            # generate memory-map/register artifacts from SystemRDL (cfg/rdl)
make chim-bootrom-init   # generate the SoC bootroms
make snitch_bootrom      # regenerate hw/bootrom/snitch/snitch_bootrom.sv (rv32im)
make chim-sim            # fetch HyperRAM model + compile RTL in Questa
make chim-sw-init        # init the chimera-sdk submodule
make chim-sw             # build the SoC software (chimera-sdk, in the container)
make help                # list all targets
```

Key gotchas:
- **SW builds in a container** (`scripts/sdk_container.sh`, Singularity/Docker; LLVM 18.1.4-pulp +
  picolibc). It targets `TARGET_PLATFORM=chimera-gen` and emits one **unified ELF** per test.
- Host domain is 64-bit (`rv64gc`/`lp64d`); the Snitch cluster device domain is RV32; the
  Snitch bootrom is **rv32im**.
- Registers/address map are **single-sourced from SystemRDL** (`cfg/rdl/*.rdl`); regenerate with
  `make chim-rdl` (or `regenerate_soc_regs` = `chim-rdl-regblock`). The old lowRISC reggen
  (`chimera_regs.hjson`) and hand-kept `sw/include/*` headers are retired. The snitch bootrom
  `#include`s the generated `.generated` headers, so run `chim-rdl-raw-header`/`chim-rdl-sw-headers`
  before `make snitch_bootrom`.
- Core counts are hardcoded in `chimera.mk` (`CLINTCORES=46/PLICCORES=92/PLIC_NUM_INTRS=59` for 5
  clusters) and must track `ExtClusters`/`NrCores` in `hw/chimera_pkg.sv`.

## Running / writing tests

A "test" is a chimera-sdk test (`sw/deps/chimera-sdk/tests/`) with host (`src_host/`) and optional
device (`src_cluster/`) code; offload uses a shared-memory function-pointer + CLINT MSIP mechanism.
The SDK registers one **ctest** case per test (`TEST_MODE=simulation`), and a **pytest** front-end
(`test/`) discovers and runs them in the chimera-top Questa testbench via `scripts/sim_runner.sh`.
Pass/fail = the transcript printed `] SUCCESS` with `Errors: 0` and no `Fatal:`.

```sh
make chim-test                       # configure(sim) + build + run the whole suite (pytest)
make chim-test VERBOSE=1 JOBS=4      # live output; 4 parallel sims
make chim-test PYTEST_EXTRA="-m host"          # markers: host / cluster
SIM_TIMEOUT=600 ctest --test-dir sw/deps/chimera-sdk/build -R '^test_host_returnZero$' -V  # one case
```

See `docs/verification.md` (flow + test inventory) and `docs/software.md` (offload model). Per-test
run dirs (`target/sim/vsim/runs/<test>/`) hold the transcript and cluster instruction traces
(`logs/trace_hart_*.dasm`) — an **empty** cluster trace means the cluster never executed (e.g. left
clock-gated/in-reset before offload). The CI YAML still runs the old `.memisl.elf` matrix; migrating
it to `make chim-test` is a tracked TODO.

## Formatting

```sh
verible-verilog-format --flagfile .verilog_format --inplace hw/*.sv target/sim/src/*.sv
python scripts/run_clang_format.py -ir sw/    # llvm-12; on IIS pass --clang-format-executable=<pulp-llvm>/bin/clang-format
```

## Conventions

- Every source file carries an SPDX header (SHL-0.51 for HW/scripts, Apache-2.0 for SW and
  generated register RTL).
- Do not commit build artifacts. Most are gitignored; note `build/` is currently a gap.
