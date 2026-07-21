#!/usr/bin/env python3
# Copyright 2025 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
"""Master -> converter -> slave AXI connectivity diagram for the Chimera SoC,
with the Snitch cluster's internal AXI (narrow + wide/DMA crossbars, their
managers and subordinates) expanded.

Topology is the known Chimera / snitch_cluster structure; edge labels
(A=addr D=data U=user I=id, bits) are looked up from the CSV produced by
scripts/axi_tree.tcl, so they track the elaborated design. The 5 identical
Snitch clusters are drawn once (x5).

Usage: scripts/axi_connectivity.py --csv build/axi_tree/axi_tree.csv \
                                   --outdir build/axi_tree
"""
import argparse
import csv
import os
import re
import shutil
import subprocess
import sys


def subsys(path):
    m = re.search(r"gen_clusters\[(\d+)\]", path)
    if m:
        return f"cluster{m.group(1)}"
    if "i_cheshire" in path:
        return "cheshire"
    if re.search(r"mem_?isl|memory_island", path, re.I):
        return "mem_island"
    return "soc"


def load(p):
    with open(p) as f:
        return list(csv.DictReader(f))


def find(rows, sub, module_sub, name_sub=None):
    for r in rows:
        if subsys(r["path"]) != sub or module_sub not in r["module"]:
            continue
        if name_sub and name_sub not in r["path"]:
            continue
        return r
    return None


def W(row, s):
    if not row:
        return None
    a, d, u, i = row[f"{s}_addr"], row[f"{s}_data"], row[f"{s}_user"], row[f"{s}_id"]
    return (a, d, u, i) if any((a, d, u, i)) else None


def lbl(t):
    if t is None:
        return ""
    a, d, u, i = t
    return f"A{a or '?'} D{d or '?'} U{u or '?'} I{i or '?'}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--csv", default="build/axi_tree/axi_tree.csv")
    ap.add_argument("--outdir", default="build/axi_tree")
    a = ap.parse_args()
    rows = load(a.csv)
    C = "cluster0"     # representative cluster

    # --- widths from the extraction --------------------------------------
    chs_xbar = find(rows, "cheshire", "axi_xbar")
    nxbar = find(rows, C, "axi_xbar", "i_cluster_xbar")          # narrow cluster xbar
    # wide/DMA xbar: axi_mcast_xbar with multicast enabled, plain axi_xbar otherwise
    wxbar = (find(rows, C, "axi_mcast_xbar", "i_axi_dma_xbar")
             or find(rows, C, "axi_xbar", "i_axi_dma_xbar"))
    dw = find(rows, C, "axi_dw_converter", "wide_to_narrow_dw")
    iw_nslv = find(rows, C, "axi_iw_converter", "narrow_slv_to_narrow_mst")
    iw_nmst = find(rows, C, "axi_iw_converter", "/narrow_mst_iw_converter")
    iw_wmst = find(rows, C, "axi_iw_converter", "/wide_mst_iw_converter")
    iw_w2n = find(rows, C, "axi_iw_converter", "wide_to_narrow_mst_iw")
    zeromem = find(rows, C, "axi_to_detailed_mem", "i_axi_zeromem")
    cwxbar = find(rows, "soc", "axi_xbar", "cluster_wide_xbar")   # cluster<->cluster wide xbar
    cw_iw = find(rows, "soc", "axi_iw_converter", "cluster_wide_in_iw")  # inbound id 5->2

    xin = W(chs_xbar, "slv")       # masters -> cheshire xbar        (I2 U2)
    xout = W(chs_xbar, "mst")      # cheshire xbar -> slaves         (I6 U2)
    nx_m = W(nxbar, "slv")         # cluster narrow managers  -> nxbar (I2 U50)
    nx_s = W(nxbar, "mst")         # nxbar -> narrow subordinates      (I4 U50)
    wx_s = W(wxbar, "mst")         # wide xbar -> wide subordinates    (I3 U48)
    # managers enter the cluster wide xbar at WideIdWidthIn (= the SoC wide id the
    # wide-mst adapter converts to), not the xbar's widened output id.
    wx_m = (wx_s[0], wx_s[1], wx_s[2], W(iw_wmst, "mst")[3]) if (wx_s and iw_wmst) else None
    zm = W(zeromem, "slv")         # wide subordinate view             (I3 U48)
    cwx_m = W(cwxbar, "slv")       # cluster -> cluster<->cluster wide xbar (id 2)
    cwx_s = W(cwxbar, "mst")       # cluster xbar -> inbound iw             (id 5)
    has_cwx = cwxbar is not None   # is the cluster-to-cluster wide xbar present in this design?
    # number of identical clusters (from the extraction) for the "xN" boundary labels
    ncl = len({m.group(1) for r in rows
               if (m := re.search(r"gen_clusters\[(\d+)\]", r["path"]))}) or 5

    def cid(r):    # ID-width conversion "slv->mst" of an id converter (from the CSV)
        return f"{r['slv_id']}->{r['mst_id']}" if r else "?"
    def cdw(r):    # data-width conversion "slv->mst" of a dw converter (from the CSV)
        return f"{r['slv_data']}->{r['mst_data']}" if r else "?"

    nodes, edges = [], []

    def N(nid, label, kind, sub):
        nodes.append((nid, label, kind, sub))

    def E(s, d, t, extra=""):
        edges.append((s, d, lbl(t) if not isinstance(t, str) else t, extra))

    # ---------------- SoC level ----------------
    for m, d in [("cva6", "CVA6 core"), ("dbg", "JTAG debug"), ("chsdma", "Cheshire iDMA")]:
        N(m, d, "master", "soc")
    N("chs_xbar", "Cheshire\\nAXI xbar", "hub", "soc")
    N("llc", "Cheshire LLC", "conv", "soc")
    N("reg", "axi_to_reg", "conv", "soc")
    N("hyper", "HyperBus /\\nHyperRAM", "slave", "soc")
    N("memisl", f"Memory island\\n(1 narrow + {ncl} parallel wide ports)", "slave", "soc")
    if has_cwx:
        N("cwxbar", f"cluster<->cluster\\nwide xbar ({ncl}x{ncl})", "hub", "soc")
    for s, d in [("bootrom", "Snitch bootrom"), ("socctrl", "SoC ctrl regs"),
                 ("extcfg", "ext cfg regs"), ("hypcfg", "HyperBus cfg regs")]:
        N(s, d, "slave", "soc")

    # ---------------- cluster boundary converters ----------------
    N("a_nslv", f"narrow-slv adapter\\ncdc + iw ({cid(iw_nslv)})", "conv", "clus")
    N("a_nmst", f"narrow-mst adapter\\niw ({cid(iw_nmst)}) + cdc", "conv", "clus")
    N("a_wmst", f"wide-mst adapter\\niw ({cid(iw_wmst)}) + cdc", "conv", "clus")
    N("a_w2n", f"wide->narrow\\niw ({cid(iw_w2n)}) + dw ({cdw(dw)})", "conv", "clus")
    if has_cwx:
        N("a_win", f"wide-in path\\niw ({cid(cw_iw)}) + cdc", "conv", "clus")

    # ---------------- cluster narrow domain ----------------
    N("cores", "Snitch cores\\n(data)", "master", "cnar")
    N("ptw", "PTW", "master", "cnar")
    N("nxbar", "cluster narrow\\nxbar", "hub", "cnar")
    N("tcdm_n", "TCDM\\n(narrow port)", "slave", "cnar")
    N("periph", "cluster\\nperipheral regs", "slave", "cnar")
    N("extslv", "ext narrow slave", "slave", "cnar")

    # ---------------- cluster wide/DMA domain ----------------
    N("idma", "iDMA", "master", "cwide")
    N("icache", "I-cache refill\\n(hive)", "master", "cwide")
    N("socwin", ("SoC wide-in\\n(from cluster xbar)" if has_cwx
                 else "SoC wide-in\\n(tied off in Chimera)"), "master", "cwide")
    N("wxbar", "cluster wide/DMA\\nxbar" + (" (mcast)" if wxbar and "mcast" in wxbar["module"]
                                            else ""), "hub", "cwide")
    N("tcdm_w", "TCDM\\n(wide superbanks)", "slave", "cwide")
    N("zeromem", "zero-memory", "slave", "cwide")

    # ---------------- edges ----------------
    # SoC masters -> cheshire xbar
    for m in ("cva6", "dbg", "chsdma"):
        E(m, "chs_xbar", xin)
    # cheshire xbar -> reg blocks / LLC / mem island
    E("chs_xbar", "reg", xout)
    for s in ("bootrom", "socctrl", "extcfg", "hypcfg"):
        E("reg", s, ("48", "32", "-", "-"))
    E("chs_xbar", "llc", xout)
    E("llc", "hyper", ("48", "64", "2", "7"))
    E("chs_xbar", "memisl", xout)

    # cheshire xbar <-> cluster narrow (through adapters)
    E("chs_xbar", "a_nslv", xout)                 # SoC -> cluster (slave path)
    E("a_nslv", "nxbar", nx_m)                    # enters narrow xbar as SoC manager
    E("a_nmst", "chs_xbar", W(iw_nmst, "mst"))    # cluster -> SoC (master path)
    E("nxbar", "a_nmst", nx_s)                    # narrow xbar SoC-out subordinate
    # cluster stray wide -> narrow -> cheshire (branches off AFTER wide-mst iw 3->1)
    E("a_wmst", "a_w2n", W(iw_wmst, "mst"))       # id 1 (post 3->1)
    E("a_w2n", "chs_xbar", W(dw, "mst"))          # id 2, data 64 (narrow to Cheshire)

    # cluster narrow domain
    E("cores", "nxbar", nx_m)
    E("ptw", "nxbar", nx_m)
    E("nxbar", "tcdm_n", nx_s)
    E("nxbar", "periph", nx_s)
    E("nxbar", "extslv", nx_s)

    # cluster wide domain
    E("idma", "wxbar", wx_m)
    E("icache", "wxbar", wx_m)
    E("socwin", "wxbar", wx_m, "" if has_cwx else "style=dashed")
    E("wxbar", "tcdm_w", wx_s)
    E("wxbar", "zeromem", zm)
    # wide xbar SoC-out -> adapter -> memory island
    E("wxbar", "a_wmst", wx_s)
    E("a_wmst", "memisl", W(iw_wmst, "mst"))
    # cluster-to-cluster wide path (only when the cluster<->cluster xbar exists)
    if has_cwx:
        E("a_wmst", "cwxbar", cwx_m)              # out to another cluster
        E("cwxbar", "a_win", cwx_s)               # xbar mst (widened id)
        E("a_win", "socwin", W(cw_iw, "mst"))     # inbound iw + cdc into SoCDMAIn master

    # ---------------- emit graphviz ----------------
    fill = {"master": "#cfe8ff", "slave": "#d7f5d7", "conv": "#ffe0b3", "hub": "#f3d0ff"}
    sub_of = {nid: sub for nid, _lbl, _k, sub in nodes}
    CLU = {"clus", "cnar", "cwide"}   # everything inside one Snitch cluster instance

    def emit_box(key, title, bg, indent):
        pad = " " * indent
        box = [f'{pad}subgraph cluster_{key} {{ label="{title}"; style=filled; '
               f'color="#cccccc"; fillcolor="{bg}";']
        for nid, label, kind, sub in nodes:
            if sub == key:
                box.append(f'{pad}  {nid} [label="{label}", fillcolor="{fill[kind]}"];')
        box.append(f"{pad}}}")
        return box

    out = ['digraph axi {', '  rankdir=LR; compound=true; nodesep=0.3; ranksep=0.9;',
           '  node [shape=box, style="rounded,filled", fontname="Helvetica", fontsize=10];',
           '  edge [fontname="Helvetica", fontsize=8, color="#555555"];',
           '  labelloc=t; fontsize=13; label="Chimera SoC AXI connectivity — Snitch cluster '
           f'internals expanded\\nedges: A=addr D=data U=user I=id (bits); '
           f'x{ncl} marks arrows crossing to/from each of the {ncl} identical clusters";']
    # shared SoC resources
    out += emit_box("soc", "SoC (Cheshire host + shared resources)", "#f7f7f7", 2)
    # one Snitch cluster instance: adapter boundary + narrow domain + wide/DMA domain nested inside
    out.append(f'  subgraph cluster_snitch {{ label="Snitch cluster  (x{ncl}, identical)"; '
               'style=filled; color="#8a8ab5"; fillcolor="#e8eaf6"; penwidth=2;')
    out += emit_box("clus", "adapter boundary (CDC + ID/width conv)", "#eef2ff", 4)
    out += emit_box("cnar", "narrow domain (control)", "#eefaee", 4)
    out += emit_box("cwide", "wide / DMA domain", "#fff6ea", 4)
    out.append("  }")

    for s, d, label, extra in edges:
        # arrows crossing the cluster boundary (cluster-internal <-> shared SoC) occur once
        # per cluster -> mark them "xN"
        crosses = (sub_of.get(s) in CLU) ^ (sub_of.get(d) in CLU)
        if crosses:
            label = f"x{ncl}  {label}".rstrip()
            extra = (extra + ", " if extra else "") + 'penwidth=1.8, color="#3355aa"'
        ex = f", {extra}" if extra else ""
        out.append(f'  {s} -> {d} [label="{label}"{ex}];')
    out.append("}")
    os.makedirs(a.outdir, exist_ok=True)
    dot = os.path.join(a.outdir, "axi_connectivity.dot")
    with open(dot, "w") as f:
        f.write("\n".join(out) + "\n")
    print("wrote", dot)
    if shutil.which("dot"):
        for fmt in ("svg", "png"):
            o = os.path.join(a.outdir, f"axi_connectivity.{fmt}")
            subprocess.run(["dot", f"-T{fmt}", dot, "-o", o], check=True)
            print("wrote", o)
    else:
        print("graphviz 'dot' not on PATH; .dot only", file=sys.stderr)


if __name__ == "__main__":
    main()
