# Copyright 2025 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Global} /tb_chimera_soc/fix/dut/soc_clk_i
add wave -noupdate -expand -group {Global} /tb_chimera_soc/fix/dut/clu_clk_i
add wave -noupdate -expand -group {Global} /tb_chimera_soc/fix/dut/rtc_i
add wave -noupdate -expand -group {Global} /tb_chimera_soc/fix/dut/rst_ni
add wave -noupdate -expand -group {Global} /tb_chimera_soc/fix/dut/uart_tx_o
add wave -noupdate -expand -group {Global} /tb_chimera_soc/fix/dut/uart_rx_i

add wave -noupdate -expand -group CVA6 {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/pc_commit}
add wave -noupdate -expand -group CVA6 -expand {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/resolved_branch}
add wave -noupdate -expand -group CVA6 {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/boot_addr_i}
add wave -noupdate -expand -group CVA6 {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/hart_id_i}

add wave -noupdate -expand -group {Cluster Register} tb_chimera_soc/fix/dut/i_reg_top/reg2hw

add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/clk_i
add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 0 (TUEDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}


add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/clk_i
add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 1 (TUEMEGA)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}


add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/clk_i
add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 2 (TUDDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}


add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/clk_i
add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}


add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/clk_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {iChache} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/*}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/*}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 2} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[2]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 2} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[2]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 3} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[3]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 3} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[3]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 4} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[4]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 4} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[4]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 5} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[5]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 5} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[5]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 6} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[6]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 6} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[6]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 7} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[7]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 7} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[7]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 8} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 8} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/engine_ctrl
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/streamer_ctrl
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/*

