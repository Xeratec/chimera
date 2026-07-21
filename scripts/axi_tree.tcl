# Copyright 2025 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Extract the Chimera AXI infrastructure (crossbars, data-width & ID-width
# converters, clock-domain crossings, atomics adapters) with the per-port AXI
# widths (addr / data / id / user) from an *elaborated* QuestaSim design, and
# dump it as a CSV. Post-process with scripts/axi_tree_report.py to get a table
# + a graphviz figure.
#
# Widths are read from the actual elaborated port signals (examine -radix
# binary; the bit-string length is the width), so no +acc / parameter access is
# required -- the read-only batch snapshot works.
#
# Usage (match the flags chim-run-batch uses so the design loads):
#   cd target/sim/vsim
#   questa-2022.3 vsim -c -work work -suppress 8386 \
#       -modelsimini <repo>/modelsim.ini tb_chimera_soc_opt \
#       -do "set AXI_OUT <repo>/axi_tree.csv; source <repo>/scripts/axi_tree.tcl"

if {![info exists AXI_OUT]} { set AXI_OUT "axi_tree.csv" }

# design-unit name -> role. Plumbing that only fans out inside muxes/xbars
# (axi_id_prepend, axi_multicut, axi_cdc_dst) is intentionally omitted; the
# meaningful nodes are the converters, crossbars, CDC sources and atomics.
set MODS {
  axi_xbar                  xbar
  axi_mcast_xbar            xbar
  axi_dw_converter          dw_conv
  axi_dw_downsizer          dw_conv
  axi_dw_upsizer            dw_conv
  axi_iw_converter          id_conv
  axi_id_remap              id_conv
  axi_id_serialize          id_conv
  axi_cdc_src               cdc
  axi_riscv_atomics_structs atomics
  axi_to_detailed_mem       to_mem
}

# candidate slave-side / master-side AXI request signal names (module-agnostic)
set SLV_CANDS {slv_req_i src_req_i slv_ports_req_i axi_slv_req_i mst_req_i in_req_i req_i axi_req_i}
set MST_CANDS {mst_req_o dst_req_o mst_ports_req_o axi_mst_req_o out_req_o}

# Bit width of an AXI channel field via binary-examine length ("" if absent).
proc fieldw {base field} {
  if {[catch {examine -radix binary ${base}.${field}} b]} { return "" }
  regsub {^[0-9]+'[bBhHoOdD]} $b "" b            ;# strip an optional radix prefix
  set b [string map {_ ""} $b]
  return [string length $b]
}

# First existing request signal among candidates (also tries array element [0]).
proc find_req {inst cands} {
  foreach c $cands {
    foreach probe [list $c "${c}\[0\]"] {
      if {![catch {examine -radix binary ${inst}/${probe}.aw.addr} v]} {
        return ${inst}/${probe}
      }
    }
  }
  return ""
}

# "addr data id user" for a request signal.
proc widths {req} {
  return [list [fieldw $req aw.addr] [fieldw $req w.data] [fieldw $req aw.id] [fieldw $req aw.user]]
}

set fh [open $AXI_OUT w]
puts $fh "path,module,role,slv_addr,slv_data,slv_id,slv_user,mst_addr,mst_data,mst_id,mst_user"

set total 0
foreach {mod role} $MODS {
  if {[catch {set L [find instances -recursive -bydu $mod]} e]} { echo "@@skip $mod ($e)"; continue }
  set n 0
  foreach e $L {
    # find returns elements formatted "{<path>} (<designunit>)"
    set path [string trim [lindex [split $e "()"] 0]]
    set path [string trim $path "\{\} "]
    if {$path eq ""} continue
    set sreq [find_req $path $SLV_CANDS]
    set mreq [find_req $path $MST_CANDS]
    set s {{} {} {} {}}; if {$sreq ne ""} { set s [widths $sreq] }
    set m {{} {} {} {}}; if {$mreq ne ""} { set m [widths $mreq] }
    puts $fh "$path,$mod,$role,[join $s ,],[join $m ,]"
    incr n; incr total
  }
  echo "@@$role $mod : $n"
}
close $fh
echo "@@WROTE $AXI_OUT : $total rows"
quit -f
