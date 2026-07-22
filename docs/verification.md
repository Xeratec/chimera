# Verification

This document describes the simulation/test flow: a `chimera-sdk` CMake/ctest build whose cases are
discovered and run by a thin **pytest** front-end, with the RTL simulation driven by QuestaSim. The
goal is that the *same* `make chim-test` runs locally and in CI (the CI YAML migration is still
pending — see *CI* below).

## Overview

```
make chim-test
   │  (re-configures the SDK in sim mode, rebuilds the ELFs, then:)
   └─ pytest  test/                         test/{conftest.py,test_soc.py}
        │  discovers ctest cases via `ctest --show-only=json-v1`
        └─ ctest -R <case>                  sw/deps/chimera-sdk/build/CTestTestfile.cmake
             │  each case = SOC_MODEL_BINARY on one unified ELF
             └─ scripts/sim_runner.sh +BINARY=<unified.elf> +PRELMODE=3
                  └─ make chim-run-batch    → QuestaSim (vsim -c) on tb_chimera_soc
```

Simulator: **QuestaSim/vsim only** (`iis-env.sh` pins questa-2022.3; compilation is Bender-driven
via `bender script vsim`). `sim_runner.sh` sources `iis-env.sh` itself if `vsim` is not already on
the path.

## Building the software and registering the tests

The SoC software is the `chimera-sdk` submodule (`sw/deps/chimera-sdk`), built with LLVM +
picolibc inside a toolchain container (`scripts/sdk_container.sh`, Singularity or Docker). Test
ELFs are produced by the SDK's CMake flow, one **unified ELF** per test (host + device domains
merged), landing in `sw/deps/chimera-sdk/build/tests/<suite>/<test>/…_unified.elf`.

```sh
make chim-sw               # configure + build the SDK (chimera-gen target)
make chim-test-configure   # re-configure with TEST_MODE=simulation → registers one ctest case/test
```

`chim-test-configure` sets `SOC_MODEL_BINARY=scripts/sim_runner.sh` and `PRELOAD_MODE=3`, so each
`add_test()` becomes a case that runs its unified ELF in the chimera-top testbench.

## Running the tests

```sh
make chim-test                       # configure(sim) + build + pytest over all cases
make chim-test VERBOSE=1             # -v -s, live vsim streaming
make chim-test JOBS=4                # pytest-xdist: 4 sims in parallel
make chim-test PYTEST_EXTRA="-m host"        # only host cases  (marker: host)
make chim-test PYTEST_EXTRA="-k snitchCluster"
make chim-test-ctest                 # run the suite directly via ctest (no pytest layer)
make chim-test SIM_TIMEOUT=300       # override the default per-test wall-clock timeout (s)
```

Run a single case directly with ctest (useful while debugging one test):

```sh
SIM_TIMEOUT=600 ctest --test-dir sw/deps/chimera-sdk/build \
    -R '^test_host_returnZero$' --output-on-failure -V
```

### Markers and per-test timeouts

`test/conftest.py` assigns `host` / `cluster` markers by name (`snitchCluster` → `cluster`,
otherwise `host`) and holds a `SIM_TIMEOUT_OVERRIDES` map for the legitimately-slow tests
(`snitchCluster/snrt` 3600 s — host-forwarded syscall printf; `snitchCluster/matmul` and
`snitchCluster/offloadAll` 1800 s; `host/uartSimple` 1800 s). Tests not in the map use
`--sim-timeout` (default 300 s). The runner enforces the timeout as a wall-clock watchdog
(`SIM_TIMEOUT` in `sim_runner.sh`): it kills the sim and reaps any orphaned `vsim` if a run never
reaches end-of-computation.

## Result contract

`scripts/sim_runner.sh` decides pass/fail from the transcript. A test passes **iff** the testbench

- printed `] SUCCESS`,
- hit no `Fatal:`, and
- reported `Errors: 0`.

Per-test run directories (`target/sim/vsim/runs/<test>/`) isolate the tracer output
(`trace_hart_*`, `dma_trace_*`, `transcript`), which is what makes parallel runs (`JOBS=`/`-j`)
safe — `chim-run-batch` uses a read-only optimized snapshot.

## Test inventory

Tests live in `sw/deps/chimera-sdk/tests/`. Which suites/tests are enabled depends on the
configured `TARGET_PLATFORM` (`chimera-gen`). The registered ctest cases are:

| Suite | Cases |
|-------|-------|
| `host` (CVA6 only) | `returnZero`, `printf`, `alloc`, `picolibc`, `uartSimple`, `hyperbus` |
| `snitchCluster` (generic) | `simpleOffload`, `offloadAll`, `clusterMemory`, `memoryIsland`, `bootAddrConfig`, `clusterGating`, `idma`, `hyperbus`, `matmul`, `snrt` |

## CI

The design intent is that the CI test stage is a single `make chim-test` (one `pytest` invocation
emitting JUnit/HTML), identical to the locally-run command. **This migration is not yet done:** the
current `.gitlab-ci.yml` still runs the retired `vsim-test` `parallel:matrix` over the old
`sw/tests/*.memisl.elf` binaries and greps the transcript with `scripts/vsim_ret_error.sh`. Those
binaries were removed with the SDK adoption, so replacing the CI matrix (and `vsim_ret_error.sh`)
with `make chim-test` is a tracked TODO (see `../TODO.md`).

## Limitations / future work

- Pass/fail is transcript-driven (`] SUCCESS` / `Errors: 0`); there is no per-assertion reporting
  and no golden-model data verification for compute kernels yet.
- Single simulator (Questa); a GVSoC backend is available in the SDK (`HARDWARE_BACKEND=GVSoC`)
  but not yet wired behind the same pytest `backend` param.
- Replace the CI `vsim-test` matrix + `scripts/vsim_ret_error.sh` with one `make chim-test`.
