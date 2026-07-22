# chimera-sdk Integration

The SoC software is provided by **chimera-sdk**, added as a git submodule at
`sw/deps/chimera-sdk`. It replaces the retired hand-written `sw/` layer (the old
`sw/lib/offload.c`, `sw/include/*`, `sw/link/*`, and the `sw/tests/*.c`). chimera-top keeps its
Bender/Make **hardware** flow; the SDK owns **all software** via its own CMake build.

## What chimera-sdk is

A **CMake-first** bare-metal SW platform for Chimera-architecture SoCs (LLVM 18.1.4-pulp +
picolibc, *not* GCC/newlib). Its headline feature is a **multi-binary compilation flow**: one ELF
per execution domain (host + each device), so RV64 host and RV32 Snitch code no longer share a
common-denominator ISA. For simulation the domains are merged into one **unified ELF** per test
(`CHIMERA_UNIFIED_ELF=ON`), which the fast-debug preload path force-writes into the memory island.

Key pieces:

- `cmake/Chimera.cmake` — the API: `add_device_binary()` (compile a Snitch ELF, emit
  absolute-address symbol stubs + a placement `.ldh`) and `add_host_binary()` (compile the host
  ELF, link the device symbol stubs, chain placement, optionally merge into one unified ELF).
- `targets/<platform>/` — per-SoC config: `config.cmake` (ISA/ABI), linker templates, crt0,
  register maps, and the `chimera_shared_data_t` `.common` layout.
- `host/` — HAL (`device_api`, `interrupt_api`), drivers (cluster offload, uart_apb, clint32,
  hyperbus), runtime (alloc/clint/fll/uart/log), OpenTitan peripherals.
- `devices/snitch_cluster/` — cluster runtime + the `snitch-sdk` (SNRT) submodule.
- `tests/` — per-test dirs (`src_host/` + optional `src_cluster/` + `CMakeLists.txt`).
- Build flavors via `HARDWARE_BACKEND` = `RTL` | `GVSoC` | `ASIC`.

## Target platform: `chimera-gen`

chimera-top builds against the **`chimera-gen`** target (`CHIM_SDK_TARGET_PLATFORM` in `sw/sw.mk`),
which matches this SoC's config (5 clusters × 9 cores, `SNITCH` cluster type, host
`rv64imafdc/lp64d`, cluster `rv32imafd_xdma/ilp32d`, memisl at `0x4800_0000`). The `chimera-gen`
target consumes the SystemRDL-generated address/register headers (see `chim-rdl-sdk-headers`),
which is why `chim-sw-configure` has an order-only dependency on `chim-rdl`. The SDK also ships
`chimera-open` and `chimera-convolve` targets.

## How the offload model maps

| old chimera-top `sw/` | chimera-sdk |
|-----------------------|-------------|
| Host + "device" functions in one memisl ELF, offloaded by function pointer | Separate host + device ELFs, chained by placement `.ldh`, sharing a `.common` section (merged to a unified ELF for sim) |
| `sw/lib/offload.c` HAL | `host/drivers/cluster/offload_snitchCluster.c` |
| `sw/include/soc_addr_map.h`, `regs/soc_ctrl.h` | `targets/chimera-gen/shared/inc/*` + SystemRDL-generated headers (see `chim-rdl-sdk-headers`) |
| `sw/link/memisl.ld`, `common.ldh` | `targets/chimera-gen/{host,devices}/link.ld.in`, `shared/common.ldh` |
| GCC/newlib, rv64gc | LLVM/picolibc, per-domain ISA/ABI |

## Build flow (from the top repo)

The Make wrapper (`sw/sw.mk`) runs the SDK's CMake inside the toolchain container via
`scripts/sdk_container.sh`:

```sh
make chim-sw-init        # git submodule update --init --recursive sw/deps/chimera-sdk
make chim-sw             # = chim-sw-configure + chim-sw-build (in the container)
make chim-sw-shell       # interactive shell in the container (debugging)
```

`chim-sw-configure` depends (order-only) on `chim-rdl`, so the SystemRDL-generated register/address
headers the SDK consumes are refreshed first. The CMake args are assembled in `sw/sw.mk`
(`CHIM_SDK_CMAKE_ARGS`): `TARGET_PLATFORM=chimera-gen`, `TOOLCHAIN_DIR`, `PICOLIBC_DIR`,
`HARDWARE_BACKEND=RTL`, `CHIMERA_UNIFIED_ELF=ON`.

## Containerized build (Singularity / Docker)

`scripts/sdk_container.sh` runs any command inside the SDK toolchain container (LLVM +
compiler-rt multilib + picolibc + Python deps). It auto-selects **Singularity/Apptainer** (IIS
workstations) or **Docker**, pulling the image on first use.

- `CHIM_SDK_IMAGE` — docker image ref (default `ghcr.io/xeratec/chimera`).
- `CHIM_SDK_SIF` — cached `.sif` (default `<repo>/.cache/containers/chimera_latest.sif`).
- `CHIM_SDK_CACHE_DIR` — writable uv/ccache root (default `<repo>/.cache`), kept on the
  bind-mounted scratch (IIS `$HOME` quota is too small). A container-specific venv
  (`.venv-container`) is used, separate from the host `.venv`.
- `CONTAINER_RUNTIME=auto|singularity|docker` to force a runtime.

The repo (and any external cache dir) is bind-mounted at the **same path** inside the container so
build artifacts and their baked-in absolute paths are identical on host and in the container.

## Testing

See `verification.md`: `make chim-test-configure` re-runs CMake with `TEST_MODE=simulation` (adds
`SOC_MODEL_BINARY=scripts/sim_runner.sh`, `PRELOAD_MODE=3`), registering one ctest case per test;
`make chim-test` builds and runs them through the pytest front-end.
