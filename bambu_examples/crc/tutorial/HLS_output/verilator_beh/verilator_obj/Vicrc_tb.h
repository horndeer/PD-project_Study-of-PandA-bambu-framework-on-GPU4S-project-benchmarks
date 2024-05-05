// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vicrc_tb_H_
#define _Vicrc_tb_H_

#include "verilated_heavy.h"

class Vicrc_tb__Syms;

//----------

VL_MODULE(Vicrc_tb) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clock,0,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(icrc_tb__DOT__compare_outputs,0,0);
    VL_SIG8(icrc_tb__DOT__success,0,0);
    VL_SIG8(icrc_tb__DOT___bambu_databyte_,7,0);
    VL_SIG8(icrc_tb__DOT_____05Fstate,3,0);
    VL_SIG8(icrc_tb__DOT_____05Fnext_state,3,0);
    VL_SIG8(icrc_tb__DOT__start_results_comparison,0,0);
    VL_SIG8(icrc_tb__DOT__next_start_port,0,0);
    VL_SIG8(icrc_tb__DOT__reset,0,0);
    VL_SIG8(icrc_tb__DOT__start_port,0,0);
    VL_SIG8(icrc_tb__DOT__ex_lin,7,0);
    VL_SIG8(icrc_tb__DOT__Mout_we_ram_queue_curr,1,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_207_reg_29_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_214_reg_35_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_10,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_11,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_12,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_13,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_14,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_15,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_16,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_17,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_18,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_23,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_24,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_25,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_26,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_27,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_31,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_32,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_36,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_37,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_38,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_6,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_7,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_8,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_9,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write,1,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a,1,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write,1,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write,1,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_11__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_14__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_17__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_23__DOT__reg_out1,3,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_27__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_30__DOT__reg_out1,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_32__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_36__DOT__reg_out1,7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_38__DOT__reg_out1,0,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1,0,0);
    VL_SIG16(icrc_tb__DOT__crc,15,0);
    VL_SIG16(icrc_tb__DOT__jinit,15,0);
    VL_SIG16(icrc_tb__DOT__ex_return_port,15,0);
    VL_SIG16(icrc_tb__DOT__registered_return_port,15,0);
    VL_SIG16(icrc_tb__DOT__Mout_data_ram_size,9,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_199_reg_21_0_0_0,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_206_reg_28_0_0_0,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_213_reg_34_0_0_0,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_0__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_19__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_24__DOT__reg_out1,11,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_29__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_31__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_35__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_37__DOT__reg_out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1,15,0);
    VL_SIG(icrc_tb__DOT__res_file,31,0);
    VL_SIG(icrc_tb__DOT__file,31,0);
    VL_SIG(icrc_tb__DOT___r_,31,0);
    VL_SIG(icrc_tb__DOT___n_,31,0);
    VL_SIG(icrc_tb__DOT___i_,31,0);
    VL_SIG(icrc_tb__DOT___addr_i_,31,0);
    VL_SIG(icrc_tb__DOT___ch_,31,0);
    VL_SIGW(icrc_tb__DOT__line,8000,0,251);
    VL_SIG(icrc_tb__DOT__addr,31,0);
    VL_SIG(icrc_tb__DOT__base_addr,31,0);
    VL_SIG(icrc_tb__DOT__currTime,31,0);
    VL_SIG(icrc_tb__DOT__lin,31,0);
    VL_SIG(icrc_tb__DOT__len,31,0);
    VL_SIG(icrc_tb__DOT__jrev,31,0);
    VL_SIG(icrc_tb__DOT__M_Rdata_ram,31,0);
    VL_SIG(icrc_tb__DOT__Mout_Wdata_ram,31,0);
    VL_SIG(icrc_tb__DOT__mask,31,0);
    VL_SIG(icrc_tb__DOT__M_Rdata_ram_temp,31,0);
    VL_SIGW(icrc_tb__DOT__Mout_addr_ram_queue_next,127,0,4);
    VL_SIGW(icrc_tb__DOT__Mout_addr_ram_queue_curr,127,0,4);
    VL_SIG(icrc_tb__DOT__Mout_Wdata_ram_queue_curr,31,0);
    VL_SIG(icrc_tb__DOT__Mout_data_ram_size_queue_next,19,0);
    VL_SIG(icrc_tb__DOT__Mout_data_ram_size_queue_curr,19,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state,21,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state,21,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_198_reg_20_0_0_0,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_200_reg_22_0_0_0,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_10__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_12__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_13__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_2__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_25__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_26__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_3__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_33__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_39__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_4__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_5__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_6__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_7__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_8__DOT__reg_out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_9__DOT__reg_out1,31,0);
    VL_SIG64(icrc_tb__DOT__startTime,63,0);
    VL_SIG64(icrc_tb__DOT__endTime,63,0);
    VL_SIG64(icrc_tb__DOT__sim_time,63,0);
    VL_SIG64(icrc_tb__DOT__Mout_addr_ram,63,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr,63,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr,63,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr,63,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr,63,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr,63,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr,63,0);
    VL_SIG8(icrc_tb__DOT___bambu_testbench_mem_[1024],7,0);
    VL_SIG(icrc_tb__DOT__reg_DataReady[2],31,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory[1],15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[256],15,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[256],7,0);
    VL_SIG8(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory[16],7,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    VL_SIG8(__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0,0,0);
    VL_SIG8(__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1,0,0);
    VL_SIG8(__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0,7,0);
    VL_SIG8(__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0,0,0);
    VL_SIG8(__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1,7,0);
    VL_SIG8(__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1,0,0);
    VL_SIG8(__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0,7,0);
    VL_SIG8(__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0,7,0);
    VL_SIG8(__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0,0,0);
    VL_SIG8(__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1,7,0);
    VL_SIG8(__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1,7,0);
    VL_SIG8(__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1,0,0);
    VL_SIG8(__Vclklast__TOP__clock,0,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound1,15,0);
    VL_SIG16(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound2,15,0);
    VL_SIG16(__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0,15,0);
    VL_SIG16(__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1,15,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1,31,0);
    VL_SIG(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1,31,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2,63,0);
    VL_SIG64(icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2,63,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vicrc_tb__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    Vicrc_tb& operator= (const Vicrc_tb&);  ///< Copying not allowed
    Vicrc_tb(const Vicrc_tb&);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Vicrc_tb(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vicrc_tb();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vicrc_tb__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vicrc_tb__Syms* symsp, bool first);
  private:
    static QData _change_request(Vicrc_tb__Syms* __restrict vlSymsp);
    static QData _change_request_1(Vicrc_tb__Syms* __restrict vlSymsp);
    void _ctor_var_reset();
  public:
    static void _eval(Vicrc_tb__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Vicrc_tb__Syms* __restrict vlSymsp);
    static void _eval_settle(Vicrc_tb__Syms* __restrict vlSymsp);
    static void _initial__TOP__1(Vicrc_tb__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(Vicrc_tb__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(Vicrc_tb__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(Vicrc_tb__Syms* __restrict vlSymsp);
    static void _settle__TOP__2(Vicrc_tb__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif // guard
