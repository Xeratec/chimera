# Build System

Chimera splits its build in two: **hardware** is driven by **Bender** (dependency + compile-script
management) wrapping a layered **Make** flow over Cheshire's own machinery; **software** is built by
the **chimera-sdk** submodule with its own **CMake** flow inside a toolchain container. Register and
address-map artifacts are generated from **SystemRDL** (peakrdl).

## Entry points

- `Makefile` (root) — sets `CHIM_ROOT`, defines `BENDER = bender -d $(CHIM_ROOT)`, resolves
  dependency roots via `bender path <dep>` (only if `.bender/` exists), then `-include`s
  **`cheshire.mk` from the cheshire dependency** and **`chimera.mk`**. Also defines `python-venv`
  and the `help` target.
- `chimera.mk` — the SoC-level HW targets (below), and includes the sub-makefiles.
- `bender.mk` — Bender target flags:
  `COMMON_TARGS = -t snitch_cluster -t snitch_cluster_wrapper -t cv64a6_imafdchsclic_sv39_wb
  -t cva6 -t rtl`; `SIM_TARGS = $(COMMON_TARGS) -t test -t sim`.
- `sw/sw.mk` — chimera-sdk build + test targets (`chim-sw*`, `chim-test*`).
- `rdl.mk` — SystemRDL (peakrdl) generation of the memory map, register block, and headers.
- `target/sim/sim.mk`, `utils/utils.mk` — further sub-makefiles included from `chimera.mk`.
- `iis-env.sh` — IIS environment (bender-0.31.0, questa-2022.3, RISC-V GCC 32/64, Snitch LLVM,
  python3.11; auto-creates/sources `.venv` via uv).

## Relationship to Cheshire

Chimera does not reimplement the HW/bootrom/sim machinery — it **wraps** Cheshire's phonies and
reuses its variables (`CHS_SW_CC`, `CHS_SW_INCLUDES`, `CHS_SW_LD_DIR`, `gen_bootrom.py`,
`elfloader.cpp`):

| Chimera target | wraps Cheshire |
|----------------|----------------|
| `chs-hw-init`  | `chs-hw-all` (after `update_plic`, `gen_idma_hw`) |
| `chim-bootrom-init` | `chs-bootrom-all` |
| `chim-sim` | `chs-sim-all` |

Cheshire is pinned via `Bender.local` to a local clone at `working_dir/cheshire`, which is where
`cheshire.mk` comes from.

## Hardware targets

| Target | What it does |
|--------|--------------|
| `chim-all` | `CHIM_HW_ALL` (`chs-hw-init sn-hw-all chim-bootrom-init`) + `CHIM_SW_ALL` (`chim-rdl chim-sw`) + `chim-sim` |
| `chs-hw-init` | `update_plic` (sed-patch `rv_plic.cfg.hjson` counts) + `gen_idma_hw` (`make -C idma idma_hw_all`), then `chs-hw-all` |
| `sn-hw-all` | `sn-rtl` — generate Snitch cluster RTL |
| `snitch_bootrom` | compile `hw/bootrom/snitch/snitch_bootrom.S` (rv32im_zicsr) → elf → bin → `snitch_bootrom.sv` via `gen_bootrom.py`. Includes the SystemRDL-generated headers from `.generated` (regenerate with `chim-rdl-raw-header`/`chim-rdl-sw-headers` first). |
| `chim-bootrom-init` | build the Cheshire bootrom (depends on `chs-hw-init`; no longer needs the SW) |
| `chim-sim` | `chim-hyperram-model` (fetch s27ks0641 VIP) + `chs-sim-all` + compile (`bender script vsim` → `compile.tcl`, then `vsim -c`) |
| `chim-run` / `chim-run-batch` | GUI / batch sim of `tb_chimera_soc` |

## Software targets (chimera-sdk, `sw/sw.mk`)

SW builds inside the SDK toolchain container (`scripts/sdk_container.sh`, Singularity/Docker;
LLVM 18.1.4-pulp + picolibc). See `sdk-integration.md`.

| Target | What it does |
|--------|--------------|
| `chim-sw-init` | `git submodule update --init --recursive sw/deps/chimera-sdk` |
| `chim-sw-configure` | `cmake … -B build` in the container (order-only dep on `chim-rdl`) |
| `chim-sw-build` | `cmake --build build -j` in the container |
| `chim-sw` | configure + build |
| `chim-sw-shell` | interactive shell in the container |

Key CMake args (`CHIM_SDK_CMAKE_ARGS`): `TARGET_PLATFORM=chimera-gen`, `TOOLCHAIN_DIR`,
`PICOLIBC_DIR`, `HARDWARE_BACKEND=RTL`, `CHIMERA_UNIFIED_ELF=ON`.

## Testing targets (`sw/sw.mk`)

See `verification.md` for the full flow.

| Target | What it does |
|--------|--------------|
| `chim-test-configure` | re-configure the SDK with `TEST_MODE=simulation` (`SOC_MODEL_BINARY=scripts/sim_runner.sh`, `PRELOAD_MODE=3`) → registers one ctest case per test |
| `chim-test` | configure(sim) + build + `pytest test/` (`VERBOSE=1`, `JOBS=<n>`, `PYTEST_EXTRA=…`, `SIM_TIMEOUT=<s>`) |
| `chim-test-ctest` | run the suite directly via `ctest` (no pytest layer) |

## SystemRDL targets (`rdl.mk`)

The memory map and SoC-control registers are single-sourced from `cfg/rdl/*.rdl` and generated with
peakrdl:

| Target | What it does |
|--------|--------------|
| `chim-rdl-markdown` | global address-map Markdown (`docs/addressmap.md`) |
| `chim-rdl-c-header` | SoC address-map + register C headers |
| `chim-rdl-raw-header` | SV + C address-map base-address headers |
| `chim-rdl-regblock` | SoC-control **SV register block** into `hw/regs` (replaces the retired lowRISC reggen) |
| `chim-rdl-sw-headers` | Snitch cluster SW headers (cfg + addrmap) |
| `chim-rdl-sdk-headers` | dependency register headers (cheshire, clint, snitch) for the SDK |
| `chim-rdl` | all of the above (`regenerate_soc_regs` = `chim-rdl-regblock`) |
| `chim-rdl-clean` | remove generated SystemRDL artifacts |

## Key variables

- `CHS_XLEN ?= 64` — host is 64-bit.
- `CLINTCORES=46`, `PLICCORES=92`, `PLIC_NUM_INTRS=59` (`chimera.mk`) — **hand-computed** from
  5 clusters × 9 cores + host; must track `ExtClusters`/`NrCores` in `hw/chimera_pkg.sv`.
- `CHS_SW_LD_DIR = $(CHIM_ROOT)/sw/link` — repoints the Cheshire/bootrom linker scripts to
  Chimera's.
- `CHIM_SDK_TARGET_PLATFORM ?= chimera-gen` (`sw/sw.mk`).

## Dependencies (Bender)

From `Bender.yml` / `Bender.lock` (see also `Bender.local` overrides). Snapshot — check the lockfile
for exact pins:

| Dep | Notes |
|-----|-------|
| cheshire | `rev wiesep/chimera-main` (local clone `working_dir/cheshire` via `Bender.local`) |
| snitch_cluster | `rev wiesep/chimera-main` (Snitch cluster IP) |
| axi | `colluca/axi` (`bd1abff…`) |
| idma | `0.6.5` |
| memory_island | `main` |
| hyperbus | `0.0.9` |
| common_cells | `1.39.0` |
| register_interface | `0.4.7` |
| apb | `0.2.4` |
| tech_cells_generic | `0.2.12` |

`Bender.yml` also declares `workspace.package_links` (symlinks `deps/cheshire`,
`deps/snitch_cluster`, `deps/cva6`) and a `vendor_package` importing lowRISC **reggen** into
`utils/reggen/`.

## Cleanup opportunities

- `build/` is not gitignored (other artifacts are).
