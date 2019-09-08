vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_iic_v2_0_21
vlib questa_lib/msim/xlconstant_v1_1_5
vlib questa_lib/msim/microblaze_v11_0_0
vlib questa_lib/msim/lmb_v10_v3_0_9
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_15
vlib questa_lib/msim/blk_mem_gen_v8_4_2
vlib questa_lib/msim/mdm_v3_2_15
vlib questa_lib/msim/proc_sys_reset_v5_0_13

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_iic_v2_0_21 questa_lib/msim/axi_iic_v2_0_21
vmap xlconstant_v1_1_5 questa_lib/msim/xlconstant_v1_1_5
vmap microblaze_v11_0_0 questa_lib/msim/microblaze_v11_0_0
vmap lmb_v10_v3_0_9 questa_lib/msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_15 questa_lib/msim/lmb_bram_if_cntlr_v4_0_15
vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2
vmap mdm_v3_2_15 questa_lib/msim/mdm_v3_2_15
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_axi_iic_0_0/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_axi_iic_0_0/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_axi_iic_0_0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_axi_iic_0_0/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_iic_v2_0_21 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_axi_iic_0_0/hdl/axi_iic_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_axi_iic_0_0/sim/PmodTMP3_axi_iic_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_pmod_bridge_0_0/src/pmod_concat.v" \
"../../../bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_pmod_bridge_0_0/sim/PmodTMP3_pmod_bridge_0_0.v" \

vlog -work xlconstant_v1_1_5 -64 "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_xlconstant_0_0/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"../../../bd/Block_design/ip/Block_design_PmodTMP3_0_0/src/PmodTMP3_xlconstant_0_0/sim/PmodTMP3_xlconstant_0_0.v" \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/2ce6/src/PmodTMP3.v" \
"../../../bd/Block_design/ip/Block_design_PmodTMP3_0_0/sim/Block_design_PmodTMP3_0_0.v" \

vcom -work microblaze_v11_0_0 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/2ed1/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Block_design/ip/Block_design_microblaze_0_0/sim/Block_design_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Block_design/ip/Block_design_dlmb_v10_0/sim/Block_design_dlmb_v10_0.vhd" \
"../../../bd/Block_design/ip/Block_design_ilmb_v10_0/sim/Block_design_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_15 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/92fd/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Block_design/ip/Block_design_dlmb_bram_if_cntlr_0/sim/Block_design_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/Block_design/ip/Block_design_ilmb_bram_if_cntlr_0/sim/Block_design_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_2 -64 "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"../../../bd/Block_design/ip/Block_design_lmb_bram_0/sim/Block_design_lmb_bram_0.v" \

vcom -work mdm_v3_2_15 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/41ef/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Block_design/ip/Block_design_mdm_1_0/sim/Block_design_mdm_1_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"../../../bd/Block_design/ip/Block_design_clk_wiz_1_0/Block_design_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/Block_design/ip/Block_design_clk_wiz_1_0/Block_design_clk_wiz_1_0.v" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/Block_design/ip/Block_design_rst_clk_wiz_1_100M_0/sim/Block_design_rst_clk_wiz_1_100M_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../I2C_ip.srcs/sources_1/bd/Block_design/ipshared/85a3" \
"../../../bd/Block_design/sim/Block_design.v" \

vlog -work xil_defaultlib \
"glbl.v"

