#!/usr/bin/env bash
# Copyright 2025 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Extract the Chimera AXI infrastructure (crossbars, data-width & ID-width
# converters, CDCs, atomics) with per-port AXI widths from the compiled
# QuestaSim snapshot, and emit a table + graphviz figure.
#
#   scripts/axi_tree.sh [--outdir DIR] [--tb NAME] [--build]
#
#   --outdir DIR   where to write outputs (default: build/axi_tree)
#   --tb NAME      optimized top to load (default: tb_chimera_soc_opt)
#   --build        run `make chim-sim` first (recompile the snapshot)
#
# Outputs in DIR: axi_tree.{csv,md,dot,svg,png}. Needs a snapshot compiled with
# the *same* QuestaSim as iis-env pins (questa-2022.3); use --build if unsure.
set -euo pipefail

# --- locate the repo root (this script lives in <root>/scripts) --------------
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CHIM_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

OUTDIR="$CHIM_ROOT/build/axi_tree"
TB="tb_chimera_soc_opt"
DO_BUILD=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --outdir) OUTDIR="$2"; shift 2 ;;
    --tb)     TB="$2";     shift 2 ;;
    --build)  DO_BUILD=1;  shift ;;
    -h|--help) sed -n '2,20p' "$0"; exit 0 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

cd "$CHIM_ROOT"

# --- environment (questa-2022.3, .venv python, bender) -----------------------
if [[ -f iis-env.sh ]]; then
  # shellcheck disable=SC1091
  source iis-env.sh >/dev/null 2>&1 || source iis-env.sh
fi
VSIM_CMD="${VSIM:-questa-2022.3 vsim}"          # two words on IIS; used unquoted
PYTHON="$CHIM_ROOT/.venv/bin/python"
[[ -x "$PYTHON" ]] || PYTHON="python3"
VSIM_WORK="$CHIM_ROOT/target/sim/vsim/work"

# --- optionally (re)compile the snapshot -------------------------------------
if [[ "$DO_BUILD" == 1 ]]; then
  echo ">> make chim-sim (recompiling the QuestaSim snapshot)…"
  make chim-sim
fi

if [[ ! -d "$VSIM_WORK/$TB" ]]; then
  echo "ERROR: optimized snapshot '$TB' not found in $VSIM_WORK." >&2
  echo "       Run 'make chim-sim' (or pass --build) to compile it first." >&2
  exit 1
fi

mkdir -p "$OUTDIR"
CSV="$OUTDIR/axi_tree.csv"
RUNDIR="$OUTDIR/vsim_run"; mkdir -p "$RUNDIR"   # keep transcript/junk out of the way

echo ">> extracting AXI tree from $TB …"
( cd "$RUNDIR" && $VSIM_CMD -c -work "$VSIM_WORK" -suppress 8386 \
    -modelsimini "$CHIM_ROOT/modelsim.ini" "$TB" \
    -do "set AXI_OUT $CSV; source $CHIM_ROOT/scripts/axi_tree.tcl" )

[[ -s "$CSV" ]] || { echo "ERROR: extraction produced no CSV ($CSV)." >&2; exit 1; }

echo ">> generating table + hierarchy figure …"
"$PYTHON" "$CHIM_ROOT/scripts/axi_tree_report.py" --csv "$CSV" --outdir "$OUTDIR"

echo ">> generating master↔slave connectivity diagram …"
"$PYTHON" "$CHIM_ROOT/scripts/axi_connectivity.py" --csv "$CSV" --outdir "$OUTDIR"

echo
echo "Done. Outputs in $OUTDIR:"
for f in axi_tree.csv axi_tree.md axi_tree.dot axi_tree.svg axi_tree.png \
         axi_connectivity.dot axi_connectivity.svg axi_connectivity.png; do
  [[ -f "$OUTDIR/$f" ]] && echo "  - $OUTDIR/$f"
done
