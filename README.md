<h1 align="center">Chimera: A Flexible Multi-Accelerator Framework for Heterogeneous SoC Integration</h1>

<a href="https://pulp-platform.org">
<img src="docs/img/pulp_logo_icon.svg" alt="Logo" width="100" align="right">
</a>

Chimera is an open-source, highly configurable microcontroller System-on-Chip (SoC) template designed for multi-cluster, heterogeneous computing systems. Its primary objective is to provide a modular platform for seamlessly integrating and managing hardware accelerators, offering developers and researchers an intuitive and extensible foundation.\
Chimera is developed as part of the [PULP (Parallel Ultra-Low Power) Platform](https://pulp-platform.org/), a joint effort between ETH Zurich and the University of Bologna.

<div align="center">

[![CI status](https://github.com/pulp-platform/chimera/actions/workflows/gitlab-ci.yml/badge.svg?branch=main)](https://github.com/pulp-platform/chimera/actions/workflows/gitlab-ci.yml?query=branch%3Main)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/pulp-platform/chimera?color=blue&label=current&sort=semver)](CHANGELOG.md)
[![License](https://img.shields.io/badge/license-Apache--2.0-red)](LICENSE-APACHE)
[![License](https://img.shields.io/badge/license-SHL--0.51-red)](LICENSE-SHL)

[Getting started](#-getting-started)
[Build RTL](#️-build-rtl)
[Platform Simulation](#platform-simulation)
[Formatting](#-formatting)
</div>

## 📜 License
Unless specified otherwise in the respective file headers, all code in this repository is released under permissive licenses.
- Hardware sources and tool scripts are licensed under the Solderpad Hardware License 0.51 (see [LICENSE-SHL](LICENSE-SHL)) or compatible licenses.
- Register file and address-map code (e.g. [hw/regs/*.sv](hw/regs/)) is generated from SystemRDL ([cfg/rdl](cfg/rdl/)) with [peakrdl](https://github.com/SystemRDL/PeakRDL) and is licensed under Apache 2.0 (see [LICENSE-APACHE](LICENSE-APACHE)).
- All software sources are licensed under Apache 2.0.

## 🚀 Getting started
### Environment setup for IIS-members
For IIS members, set up the environment by sourcing the `iis-env.sh` script:
```sh
source iis-env.sh
```

### Environment for non IIS-members
Non-IIS users need to follow a few more steps to set up the environment properly.

#### Bender
Chimera uses [Bender](https://github.com/pulp-platform/bender) to manage hardware dependencies and automatically generate compilation scripts.

#### Python environment
Python 3.11 or later is required. The environment is managed with [uv](https://docs.astral.sh/uv/)
(dependencies in `pyproject.toml`, pinned in `uv.lock`):
```sh
make python-venv          # uv sync -> .venv
source .venv/bin/activate
```

#### Toolchain
Chimera requires a RISC-V GCC toolchain for building the **hardware-side** bootroms (64-bit host,
`rv64gc`; the Snitch bootrom is `rv32im`). Follow the _Installation (Newlib)_ instructions from
[pulp-platform/riscv-gnu-toolchain](https://github.com/pulp-platform/riscv-gnu-toolchain) and export
its path:
```shell
export RISCV_GCC_BINROOT=/path/to/gcc/bin
export PATH=$PATH:$RISCV_GCC_BINROOT
```
The **SoC software** (chimera-sdk) uses its own LLVM + picolibc toolchain shipped in a container —
no host RISC-V GCC needed for it (see [docs/sdk-integration.md](docs/sdk-integration.md)).

### 🛠️ Build RTL
If you have all needed dependencies and you want to build the full Chimera SoC (RTL + SW + sim), run:
``` sh
bender checkout
make chim-all
```
Or for more selective builds:
```sh
make chs-hw-init          # generate Cheshire RTL
make sn-hw-all            # generate Snitch cluster RTL
make chim-rdl             # generate memory-map / register artifacts from SystemRDL (cfg/rdl)
make chim-bootrom-init    # generate the SoC bootroms
make chim-sim             # compile the RTL in QuestaSim
```

### 💾 Build the software (chimera-sdk)
The SoC software is the [chimera-sdk](sw/deps/chimera-sdk) submodule, built with LLVM + picolibc
**inside a toolchain container** (Singularity/Apptainer on IIS, Docker elsewhere; handled by
`scripts/sdk_container.sh`). Initialise and build it with:
```sh
make chim-sw-init         # git submodule update --init --recursive sw/deps/chimera-sdk
make chim-sw              # configure + build the SDK (TARGET_PLATFORM=chimera-gen) in the container
```
See [docs/sdk-integration.md](docs/sdk-integration.md) for container/toolchain details.

### ✅ Run the test suite
Tests are registered as `ctest` cases by the SDK and driven by a pytest front-end; the RTL
simulation runs in QuestaSim (`which vsim`):
```sh
make chim-test                                   # build + run the whole suite (pytest)
make chim-test VERBOSE=1                          # live vsim streaming
make chim-test JOBS=4                             # run 4 sims in parallel
make chim-test PYTEST_EXTRA="-m host"            # only host tests (markers: host / cluster)
make chim-test PYTEST_EXTRA="-k snitchCluster"   # select by name
```
Run a single case directly with ctest while debugging:
```sh
SIM_TIMEOUT=600 ctest --test-dir sw/deps/chimera-sdk/build \
    -R '^test_host_returnZero$' --output-on-failure -V
```
See [docs/verification.md](docs/verification.md) for the full flow and test inventory.

### Platform simulation (manual)
`make chim-sim` compiles the design. To run a single ELF outside the test harness use
`chim-run` (GUI) / `chim-run-batch` (batch), passing the unified ELF via `BINARY`:
```sh
make chim-run-batch BINARY=path/to/<test>_unified.elf
```

### Additional Help
To list all available make targets and their descriptions:
```sh
make help
```

## 🧼 Formatting

### Verilog Formatting
To format all hardware source files:

```sh
verible-verilog-format --flagfile .verilog_format --inplace --verbose hw/*.sv target/sim/src/*.sv
```

### CXX Formatting
To format all files in the `sw/` directory, run
```sh
python scripts/run_clang_format.py -ir sw/
```

Our CI uses llvm-12 for clang-format. On IIS machines, run:
```sh
python scripts/run_clang_format.py -ir sw/ --clang-format-executable=/usr/pack/riscv-1.0-kgf/pulp-llvm-0.12.0/bin/clang-format

python scripts/run_clang_format.py -ir hw/ --clang-format-executable=/usr/pack/riscv-1.0-kgf/pulp-llvm-0.12.0/bin/clang-format
```
If you're not using the IIS setup, specify a valid `clang-format-12` binary instead.
