onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group Global /tb_chimera_soc/fix/dut/soc_clk_i
add wave -noupdate -group Global /tb_chimera_soc/fix/dut/clu_clk_i
add wave -noupdate -group Global /tb_chimera_soc/fix/dut/rtc_i
add wave -noupdate -group Global /tb_chimera_soc/fix/dut/rst_ni
add wave -noupdate -group Global /tb_chimera_soc/fix/dut/uart_tx_o
add wave -noupdate -group Global /tb_chimera_soc/fix/dut/uart_rx_i
add wave -noupdate -expand -group CVA6 {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/pc_commit}
add wave -noupdate -expand -group CVA6 -expand {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/resolved_branch}
add wave -noupdate -expand -group CVA6 {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/boot_addr_i}
add wave -noupdate -expand -group CVA6 {/tb_chimera_soc/fix/dut/i_cheshire/gen_cva6_cores[0]/i_core_cva6/hart_id_i}
add wave -noupdate -group {Cluster Register} /tb_chimera_soc/fix/dut/i_reg_top/reg2hw
add wave -noupdate -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/clk_i
add wave -noupdate -group {Cluster 0 (TUEDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -group {Cluster 0 (TUEDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 0 (TUEDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 0 (TUEDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -group {Cluster 0 (TUEDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 0 (TUEDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 0 (TUEDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuedcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/clk_i
add wave -noupdate -group {Cluster 1 (TUEMEGA)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -group {Cluster 1 (TUEMEGA)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 1 (TUEMEGA)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 1 (TUEMEGA)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -group {Cluster 1 (TUEMEGA)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 1 (TUEMEGA)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 1 (TUEMEGA)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuemega/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/clk_i
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 3 (KULCLUSTER)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_kulcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/clk_i
add wave -noupdate -group {Cluster 2 (TUDDCIM)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -group {Cluster 2 (TUDDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 2 (TUDDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 2 (TUDDCIM)} -expand -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -group {Cluster 2 (TUDDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -group {Cluster 2 (TUDDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -group {Cluster 2 (TUDDCIM)} -expand -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_tuddcim/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/cluster_base_addr_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/boot_addr_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/clk_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/rst_ni
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_barrier/barrier_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_barrier/arrival_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_barrier/barrier_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/clk_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/clk_d2_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/rst_ni}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/hive_req_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/hive_rsp_o}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/ptw_data_req_o}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/ptw_data_rsp_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/axi_req_o}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/axi_rsp_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/icache_prefetch_enable_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/sram_cfgs_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/icache_events_o}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/inst_addr}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/inst_cacheable}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/inst_data}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/inst_valid}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/inst_ready}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/inst_error}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/flush_valid}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/flush_ready}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_req_sfu}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_req_sfu_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_req_sfu_valid}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_req_sfu_valid_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_req_sfu_ready}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_req_sfu_ready_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_resp_sfu}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_resp_sfu_valid}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_resp_sfu_ready}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_req_ext}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_qvalid}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_qready}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_pvalid}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/acc_pready}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group iChache {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_hive[0]/i_snitch_hive/resp_sel}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 0} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 1} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[1]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 2} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[2]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 2} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[2]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 2} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[2]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 3} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[3]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 3} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[3]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 3} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[3]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 4} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[4]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 4} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[4]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 4} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[4]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 5} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[5]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 5} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[5]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 5} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[5]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 6} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[6]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 6} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[6]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 6} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[6]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 7} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[7]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 7} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[7]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {Core 7} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[7]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -expand -group {Core 8} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/hart_id_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -expand -group {Core 8} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -expand -group {Core 8} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/i_snitch/inst_ready_i}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -expand -group {Core 8} {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/i_snitch/wfi_q}
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_ctrl/i_slave/i_regfile/regfile_latch_mem
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_ctrl/reg_file
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_ctrl/i_slave/running_state
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_ctrl/i_slave/counter_pending
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_ctrl/i_slave/context_state
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_ctrl/i_slave/regfile_flags
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_cluster_peripheral/reg2hw
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_cluster_peripheral/hw2reg
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/engine_flags
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/engine_ctrl
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/streamer_ctrl
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group HWPE /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/streamer_flags
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/clk_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/rst_ni
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/ctrl_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/inp_valid_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/inp_ready_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/weight_valid_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/weight_ready_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/bias_valid_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/bias_ready_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/oup_valid_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/oup_ready_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/pop_softmax_fifo_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/step_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/soft_addr_div_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/softmax_done_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/calc_en_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/first_inner_tile_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/last_inner_tile_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/busy_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/step_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/step_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/count_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/count_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/tile_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/tile_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/inner_tile_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/inner_tile_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/softmax_tile_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/softmax_tile_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/ongoing_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/ongoing_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/ongoing_soft_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/ongoing_soft_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/softmax_fifo
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/softmax_div
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/softmax_div_done_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/softmax_div_done_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/busy_d
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group Controller /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/busy_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/clk_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/rst_ni
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/ctrl_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_valid_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_ready_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_weight_valid_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_weight_ready_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_bias_valid_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_bias_ready_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/valid_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/ready_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/busy_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_weight_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_bias_i
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/oup_o
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step_q1
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step_q2
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step_q3
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step_q4
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step_q5
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step_q6
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q1
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q2
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q3
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q4
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q5
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q6
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q7
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q8
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q9
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/calc_en_q10
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/first_inner_tile
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/first_inner_tile_q1
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/first_inner_tile_q2
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/first_inner_tile_q3
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q1
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q2
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q3
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q4
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q5
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q6
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q7
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q8
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q9
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/last_inner_tile_q10
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/weight_valid
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/weight_ready
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_stream_soft
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp1
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp1_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp2
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp2_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_bias
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_bias_q1
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/inp_bias_q2
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/oup
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/oup_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/accumulator_oup
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/requant_mult
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/requant_shift
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_requant_mult
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_requant_shift
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/requant_oup
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/requant_add
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_requant_add
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/requant_mode
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_requant_mode
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/post_activation
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/fifo_full
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/fifo_empty
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/push_to_fifo
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/pop_from_fifo
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/data_to_fifo
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/data_from_fifo
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/fifo_usage
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/pop_softmax_fifo
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/soft_addr_div
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/softmax_done
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/read_en
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/read_addr
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/write_en
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/write_addr
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/read_data
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/write_data
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/write_select
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q1
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q2
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q3
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q4
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q5
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q6
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q7
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q8
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q9
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/activation_q10
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/fifo_usage_max
add wave -noupdate -expand -group {Cluster 4 (ETH)} -group {HWPE ITA} -expand -group ITA /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/step_q
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/axi_soc_req
add wave -noupdate -expand -group {Cluster 4 (ETH)} /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/axi_soc_rsp
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::N
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::M
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::S
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::P
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::E
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::H
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::WI
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::WO
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::EMS
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::Latency
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::GELU_CONSTANTS_WIDTH
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::GELU_OUT_WIDTH
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::N_ATTENTION_STEPS
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::N_FEEDFORWARD_STEPS
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::N_STATES
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::N_REQUANT_CONSTS
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::InputAddrWidth
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::MAddrWidth
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::M3AddrWidth
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::NumReadPorts
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::MNumReadPorts
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::FifoDepth
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::SplitFactor
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::N_WRITE_EN
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::SoftmaxScalar
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::SoftmaxShift
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::SoftmaxAccDataWidth
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::SoftFifoDepth
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::DividerWidth
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::NumDiv
add wave -noupdate -group {ITA Package} -radix decimal /ETHCluster_ita_package::REQUANT_MODE
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::N_CORES
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::N_CONTEXT
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ID_WIDTH
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_IO_REGS
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_TCDM_DW
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_INPUT_DW
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_WEIGHT_DW
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_BIAS_DW
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_OUTPUT_DW
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_INPUT_PTR
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_WEIGHT_PTR0
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_WEIGHT_PTR1
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_BIAS_PTR
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_OUTPUT_PTR
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_SEQ_LENGTH
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_TILES
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_EPS_MULT0
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_EPS_MULT1
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_RIGHT_SHIFT0
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_RIGHT_SHIFT1
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_ADD0
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_ADD1
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_CTRL_ENGINE
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_CTRL_STREAM
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_GELU_B_C
add wave -noupdate -group {ITA HWPE Package} -radix decimal /ETHCluster_ita_hwpe_package::ITA_REG_ACTIVATION_REQUANT
add wave -noupdate -expand -group Runtime {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group Runtime {/tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/gen_core[8]/i_snitch_cc/i_snitch/inst_ready_i}
add wave -noupdate -expand -group Runtime -label start /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/engine_ctrl.start
add wave -noupdate -expand -group Runtime /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/step_o
add wave -noupdate -expand -group Runtime /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_hwpe_subsystem/i_ita/i_ita/i_engine/i_ita/i_controller/busy_o
add wave -noupdate -expand -group Runtime /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_cluster_peripheral/core_events_i
add wave -noupdate -expand -group Runtime /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_cluster_peripheral/tcdm_events_i
add wave -noupdate -expand -group Runtime /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_cluster_peripheral/dma_events_i
add wave -noupdate -expand -group Runtime /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_cluster_peripheral/icache_events_i
add wave -noupdate -expand -group Runtime /tb_chimera_soc/fix/dut/i_cluster_domain/i_chimera_cluster_ethcluster/i_test_cluster/i_cluster/i_snitch_cluster_peripheral/hwpe_evt_i
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_addr
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_gnt
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_rdata
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_req
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_rvalid
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_strb
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_wdata
add wave -noupdate -group {Memory Island} /tb_chimera_soc/fix/dut/i_memisland_domain/i_memory_island/narrow_we
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {90615958 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 181
configure wave -valuecolwidth 110
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {288089085 ps} {447233821 ps}
