# Chimera SoC Architecture

Chimera integrates a Cheshire host, N Snitch clusters, a shared memory island, and a HyperBus
off-chip memory controller. This document describes the RTL structure and the address map. All
paths are relative to the repo root.

## Block overview

```
                          ┌───────────────────────────────────────────────┐
                          │                 cheshire_soc                   │
                          │  CVA6 (64-bit)  ·  CLINT/PLIC/CLIC  ·  JTAG dbg │
                          │  UART/I2C/SPI/GPIO  ·  AXI LLC  ·  crossbar     │
                          └───┬───────────────┬───────────────┬────────────┘
                 ext AXI mst/slv       ext reg demux      LLC AXI (async)
                              │               │               │
             ┌────────────────┼───────┐   ┌───┴─────────┐  ┌──┴───────────────┐
             │  chimera_clu_domain    │   │ ext cfg regs│  │  hyperbus_wrap    │
             │  5× chimera_cluster    │   │ ┌─────────┐ │  │  axi_cdc + pulp   │
             │   (Snitch, 9 cores)    │   │ │reg->apb │ │  │  hyperbus PHY     │
             │  + cluster_adapter     │   │ │apb_dump │ │  └──────► HyperRAM   │
             └───────┬────────────────┘   │ └─────────┘ │        0x8000_0000  │
                     │ wide (mem) port     │ chimera_reg │
             ┌───────┴────────────────┐    │ _top (SoC   │   + reg->mem +
             │ chimera_memisland_domain│   │ ctrl regs)  │     snitch_bootrom
             │ atomics+cut+mem_island  │   └─────────────┘
             │  0x4800_0000 (1 MiB)    │
             └─────────────────────────┘
```

The host exposes external AXI master/slave ports and external register-demux ports. Chimera
attaches the clusters, memory island, HyperBus, and four external register slaves (Snitch
bootrom, top-level SoC-control regs, external cfg regs → APB, HyperBus cfg regs) to those ports.

> Cluster count and type are set in `hw/chimera_pkg.sv` (`ExtClusters`, `ChimeraClusterCfg`).
> This build instantiates **5 clusters**, all of `ClusterType = SNITCH`, 9 cores each. `chimera.mk`
> core counts (`CLINTCORES`/`PLICCORES`/`PLIC_NUM_INTRS`) must be kept in sync with this.

## HW module map (`hw/`)

| File | Role |
|------|------|
| `chimera_pkg.sv` | Central config package. `ExtClusters=5`, per-cluster `ChimeraClusterCfg` (`NrCores=9`, `ClusterType`, `hasWideMasterPort`, `EnAxiCdc`), `gen_chimera_cfg()` builds the Cheshire config (48-bit addr, 64-bit AXI, LLC 64 KiB 8-way, CLIC). Holds the **address map** localparams and `ChimeraCfg[0]` (default) / `[1]` (isolation). |
| `chimera_top_wrapper.sv` | Top RTL. Instantiates `cheshire_soc`, the reg→apb + `apb_dump_msg` path, `chimera_reg_top`, reg→mem + `snitch_bootrom`, `chimera_clu_domain`, `chimera_memisland_domain`, AXI CDC + `hyperbus_wrap`. Fans reg2hw out to per-cluster clock-gate/reset/wide-bypass; builds the cluster reset AND-tree. |
| `chimera_clu_domain.sv` | Instantiates the 5 clusters in a genloop; optional `axi_isolate` per port when `IsolateClusters==1` (power gating); slices flat interrupt/debug vectors per cluster. |
| `clusters/chimera_cluster.sv` | Single Snitch cluster wrapper: `tc_clk_gating`, optional `narrow_adapter`, `chimera_cluster_adapter`, and `snitch_cluster` (TCDM 128 KiB = 1024×16 banks, 2 I$ ways, boot addr = Snitch bootrom `0x3000_0000`, one `Xdma` DMA core). PMA cached = HyperBus + memory island. |
| `chimera_cluster_adapter.sv` | Per-cluster AXI glue: ID-width conversion, wide-request demux (to memory island, or wide→narrow when outside mem-island range / in bypass mode), optional per-port `axi_cdc`. Includes SVA on bypass routing. |
| `narrow_adapter.sv` | AXI **data-width** converters between cluster narrow (64b) and SoC narrow width. |
| `chimera_memisland_domain.sv` | `axi_riscv_atomics_structs` (AMO) → `axi_cut` → `axi_memory_island_wrap`. NarrowToWide=16, 2 wide banks, 1024 words/bank. |
| `hyperbus_wrap.sv` | `axi_cdc_dst` + pulp `hyperbus` IP → HyperBus PHY pads. `NumPhys=1`, `NumChips=2`. |
| `apb_dump_msg.sv` | Sim-only: snoops APB writes to `0x3000_4ffc` and prints them as a UART-like console (`$write`). Pass-through under `SYNTHESIS`. |
| `regs/` | SoC-control register block, **generated from SystemRDL** (`cfg/rdl/chimera_soc_regs.rdl`) via peakrdl (`make chim-rdl-regblock`) into `chimera_reg_pkg.sv` + `chimera_reg_top.sv`. Replaces the retired lowRISC reggen/`chimera_regs.hjson` flow. |
| `bootrom/snitch/` | Snitch cluster boot code (rv32im): `snitch_bootrom.S`, `snitch_startup.c`, `.ld` (ORIGIN `0x3000_0000`), generated `snitch_bootrom.sv`. |
| `include/chimera/typedef.svh` | `CHIMERA_TYPEDEF_*` macros deriving wide/narrow AXI struct types (exported via Bender `export_include_dirs`). |
| `rv_plic.cfg.hjson` | PLIC config template patched by `update_plic`. |

## Address map

> The address map and SoC-control registers are now **single-sourced from SystemRDL**
> (`cfg/rdl/chimera_addrmap.rdl`, `cfg/rdl/chimera_soc_regs.rdl`) and generated with peakrdl
> (`make chim-rdl`): the SV register block (`hw/regs`), the C/SV base-address headers, the Snitch
> cluster + SDK SW headers, and the Markdown map (`docs/addressmap.md`). See `rdl-support.md`.
> The `hw/chimera_pkg.sv` localparams remain a separate (hand-kept) source — keep them consistent
> with the RDL. The old hand-maintained `sw/include/soc_addr_map.h` / reggen offsets are gone.
>
> The table below is a summary for orientation; **`docs/addressmap.md` (generated) is authoritative**.

| Region | Base | Size |
|--------|------|------|
| CLINT | `0x0204_0000` | — |
| Cheshire regs | `0x0300_0000` | — |
| Snitch bootrom | `0x3000_0000` | 4 KiB |
| SoC-control (top-level) regs | `0x3000_1000` | 4 KiB |
| External cfg regs (PADs/FLLs/PMU → APB) | `0x3000_2000` | 12 KiB |
| HyperBus cfg regs | `0x3000_5000` | 4 KiB |
| Cluster 0..N-1 | `0x4000_0000` + n·`0x20_0000` | 2 MiB each (N = `ExtClusters`, here 5) |
| Memory island | `0x4800_0000` | 1 MiB |
| HyperRAM | `0x8000_0000` | 4 GiB |

### SoC-control register block (`0x3000_1000`, 32-bit regs)

Generated from `cfg/rdl/chimera_soc_regs.rdl` via peakrdl. The per-cluster arrays have one entry per
instantiated cluster, so exact offsets are **config-dependent — see the generated `docs/addressmap.md`
/ the generated C header for authoritative offsets**. The register groups:

| Register | Notes |
|----------|-------|
| `SNITCH_BOOT_ADDR` | resval `0xBADCAB1E` |
| `SNITCH_CONFIGURABLE_BOOT_ADDR` | resval `0x3000_0000` |
| `SNITCH_INTR_HANDLER_ADDR` | |
| `SNITCH_CLUSTER_{0..N-1}_RETURN` | offload return value per cluster |
| `RESET_CLUSTER_{0..N-1}` | resval 1 |
| `CLUSTER_{0..N-1}_CLK_GATE_EN` | resval 1 |
| `WIDE_MEM_CLUSTER_{0..N-1}_BYPASS` | wide→narrow bypass select |
| `CLUSTER_{0..N-1}_BUSY` | busy flag written by the cluster |

## Notable structural risks (for verification / refactor)

- **Config duplication**: `hw/chimera_pkg.sv` (`ChimeraCfg`) vs `target/sim/src/tb_chimera_pkg.sv`
  (a separate, Cheshire-flavored config array) can drift.
- **Cluster count in two places**: `hw/chimera_pkg.sv` localparams vs the SystemRDL sources
  (`cfg/rdl`) — both describe the same map and must stay consistent.
- **Hardcoded core counts** in `chimera.mk` (`CLINTCORES`/`PLICCORES`/`PLIC_NUM_INTRS`) must track
  the package.
- **Fast-debug preload** force-writes memory-island SRAM via hierarchical paths
  (`target/sim/src/tb_chimera_soc.sv`), which is brittle against RTL refactors of the mem island.
