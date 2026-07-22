# Software

The SoC software lives in the **chimera-sdk** submodule (`sw/deps/chimera-sdk`), built with its own
CMake flow (LLVM + picolibc) inside a toolchain container. The top-level `sw/` tree is now thin: it
holds only the Cheshire/bootrom linker fragments, the generated Chimera address `.ldh`, the SDK
submodule, and the SW make fragment. The hand-written `sw/lib`, `sw/include`, and `sw/tests` were
retired when the SDK was adopted (see `sdk-integration.md`).

## Layout

```
sw/
├── sw.mk                       # chimera-sdk build + test make fragment
├── deps/
│   └── chimera-sdk/            # the SoC SW SDK (submodule): HAL, drivers, runtime, tests, targets
└── link/
    ├── cheshire_bootrom.ld     # Cheshire bootrom linker script (repointed via CHS_SW_LD_DIR)
    ├── cheshire_common.ldh     # shared MEMORY regions / peripheral base symbols for the bootrom
    ├── cheshire_addrs.ldh      # Cheshire address defines
    └── chimera_addrs.ldh       # generated (peakrdl raw-header) Chimera address defines
```

The one device binary still built by *this* repo is the **Snitch cluster bootrom**
(`hw/bootrom/snitch/`): compiled **rv32im_zicsr** (`-mabi=ilp32`), objcopy'd to binary, converted to
`snitch_bootrom.sv`. It `#include`s the SystemRDL-generated headers from `.generated` directly
(so run `chim-rdl-raw-header`/`chim-rdl-sw-headers` first) and addresses the SoC-control block with
absolute constants — the bootrom sits inside the cluster, so PC-relative addressing of the SoC block
is not possible. It overrides the generic upstream `snitch_bootrom` (which reads a cluster-local
scratch register instead of the SoC-control `SNITCH_BOOT_ADDR`).

## Building the SW

See `build-system.md`/`sdk-integration.md`:

```sh
make chim-sw          # configure + build the SDK (TARGET_PLATFORM=chimera-gen) in the container
```

The SDK emits, per test, one ELF per execution domain (host + each device) and — with
`CHIMERA_UNIFIED_ELF=ON` — a merged **unified ELF** used by the RTL sim, under
`sw/deps/chimera-sdk/build/tests/<suite>/<test>/…_unified.elf`.

## The offload model (how "device" code runs)

"Device" code is ordinary functions compiled into the cluster (device) domain; the host offloads to
a cluster via shared-memory pointers + interrupts. The mechanism (implemented in the SDK's
`host/drivers/cluster/` HAL and the Snitch bootrom) is:

1. Host writes the target function pointer into the SoC-control `SNITCH_BOOT_ADDR`.
2. Host raises a CLINT software interrupt (MSIP) on the target cluster's hart
   (`hartId = 1 + Σ preceding cores`; hart 0 is CVA6).
3. The cluster's rv32 bootrom reads `SNITCH_BOOT_ADDR` and `jalr`s into it.
4. Host busy-polls `SNITCH_CLUSTER_n_RETURN` for the result (set by the cluster on return).

The host and device domains share a `.common` section (`chimera_shared_data_t`) placed in the
memory island (`0x4800_0000`), which is addressable by both CVA6 and the Snitch clusters. For
simulation the unified ELF merges the domains so the fast-debug preload path can write everything in
one shot.

## Tests

Tests live in `sw/deps/chimera-sdk/tests/` (per-test `src_host/` + optional `src_cluster/` +
`CMakeLists.txt`). Return code 0 = pass; the testbench prints `] SUCCESS`. See `verification.md`
for the full inventory (`host` and generic `snitchCluster` suites) and how they are run
(`make chim-test`).

## Toolchain notes

- Host domain: LLVM/picolibc, `rv64imafdc`/`lp64d`.
- Snitch cluster device domain: `rv32imafd_xdma`/`ilp32d` (per the SDK target's ISA/ABI); the
  bootrom is `rv32im`.
- The old GCC/newlib `rv64gc` common-denominator build and the objcopy-into-array device embedding
  are gone — the SDK's per-domain compilation replaces both.
