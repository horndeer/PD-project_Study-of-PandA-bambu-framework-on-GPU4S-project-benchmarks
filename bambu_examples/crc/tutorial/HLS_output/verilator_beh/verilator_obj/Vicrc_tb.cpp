// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vicrc_tb.h for the primary calling header

#include "Vicrc_tb.h"          // For This
#include "Vicrc_tb__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Vicrc_tb) {
    Vicrc_tb__Syms* __restrict vlSymsp = __VlSymsp = new Vicrc_tb__Syms(this, name());
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vicrc_tb::__Vconfigure(Vicrc_tb__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vicrc_tb::~Vicrc_tb() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vicrc_tb::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vicrc_tb::eval\n"); );
    Vicrc_tb__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    while (VL_LIKELY(__Vchange)) {
	VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
    }
}

void Vicrc_tb::_eval_initial_loop(Vicrc_tb__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    int __VclockLoop = 0;
    QData __Vchange = 1;
    while (VL_LIKELY(__Vchange)) {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
    }
}

//--------------------
// Internal Methods

void Vicrc_tb::_initial__TOP__1(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_initial__TOP__1\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIGW(__Vtemp1,543,0,17);
    VL_SIGW(__Vtemp2,543,0,17);
    VL_SIGW(__Vtemp3,543,0,17);
    VL_SIGW(__Vtemp4,543,0,17);
    VL_SIGW(__Vtemp5,639,0,20);
    VL_SIGW(__Vtemp6,479,0,15);
    // Body
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_31__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_37__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_4__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:106
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_30__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_8__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:447
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:240
    __Vtemp1[0U] = 0x2e6d656dU;
    __Vtemp1[1U] = 0x33393635U;
    __Vtemp1[2U] = 0x65665f33U;
    __Vtemp1[3U] = 0x61795f72U;
    __Vtemp1[4U] = 0x2f617272U;
    __Vtemp1[5U] = 0x7269616cU;
    __Vtemp1[6U] = 0x7475746fU;
    __Vtemp1[7U] = 0x6372632fU;
    __Vtemp1[8U] = 0x6c65732fU;
    __Vtemp1[9U] = 0x78616d70U;
    __Vtemp1[0xaU] = 0x2e312f65U;
    __Vtemp1[0xbU] = 0x32303233U;
    __Vtemp1[0xcU] = 0x6d62752dU;
    __Vtemp1[0xdU] = 0x412d6261U;
    __Vtemp1[0xeU] = 0x50616e64U;
    __Vtemp1[0xfU] = 0x6f6f742fU;
    __Vtemp1[0x10U] = 0x2f72U;
    VL_READMEM_W (false,8,16, 0,17, __Vtemp1, vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory
		  ,0U,0xfU);
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_25__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:106
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_33__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_12__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_13__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_26__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:106
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_39__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_6__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_7__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_10__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_36__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:447
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_29__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_35__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:3865
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state = 1U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_11__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_14__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_17__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_27__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_32__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_38__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_2__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_23__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_24__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_3__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:240
    __Vtemp2[0U] = 0x2e6d656dU;
    __Vtemp2[1U] = 0x33383237U;
    __Vtemp2[2U] = 0x65665f33U;
    __Vtemp2[3U] = 0x61795f72U;
    __Vtemp2[4U] = 0x2f617272U;
    __Vtemp2[5U] = 0x7269616cU;
    __Vtemp2[6U] = 0x7475746fU;
    __Vtemp2[7U] = 0x6372632fU;
    __Vtemp2[8U] = 0x6c65732fU;
    __Vtemp2[9U] = 0x78616d70U;
    __Vtemp2[0xaU] = 0x2e312f65U;
    __Vtemp2[0xbU] = 0x32303233U;
    __Vtemp2[0xcU] = 0x6d62752dU;
    __Vtemp2[0xdU] = 0x412d6261U;
    __Vtemp2[0xeU] = 0x50616e64U;
    __Vtemp2[0xfU] = 0x6f6f742fU;
    __Vtemp2[0x10U] = 0x2f72U;
    VL_READMEM_W (false,16,1, 0,17, __Vtemp2, vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory
		  ,0U,0U);
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:4366
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:457
    __Vtemp3[0U] = 0x2e6d656dU;
    __Vtemp3[1U] = 0x33383534U;
    __Vtemp3[2U] = 0x65665f33U;
    __Vtemp3[3U] = 0x61795f72U;
    __Vtemp3[4U] = 0x2f617272U;
    __Vtemp3[5U] = 0x7269616cU;
    __Vtemp3[6U] = 0x7475746fU;
    __Vtemp3[7U] = 0x6372632fU;
    __Vtemp3[8U] = 0x6c65732fU;
    __Vtemp3[9U] = 0x78616d70U;
    __Vtemp3[0xaU] = 0x2e312f65U;
    __Vtemp3[0xbU] = 0x32303233U;
    __Vtemp3[0xcU] = 0x6d62752dU;
    __Vtemp3[0xdU] = 0x412d6261U;
    __Vtemp3[0xeU] = 0x50616e64U;
    __Vtemp3[0xfU] = 0x6f6f742fU;
    __Vtemp3[0x10U] = 0x2f72U;
    VL_READMEM_W (false,16,256, 0,17, __Vtemp3, vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory
		  ,0U,0xffU);
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:457
    __Vtemp4[0U] = 0x2e6d656dU;
    __Vtemp4[1U] = 0x33393335U;
    __Vtemp4[2U] = 0x65665f33U;
    __Vtemp4[3U] = 0x61795f72U;
    __Vtemp4[4U] = 0x2f617272U;
    __Vtemp4[5U] = 0x7269616cU;
    __Vtemp4[6U] = 0x7475746fU;
    __Vtemp4[7U] = 0x6372632fU;
    __Vtemp4[8U] = 0x6c65732fU;
    __Vtemp4[9U] = 0x78616d70U;
    __Vtemp4[0xaU] = 0x2e312f65U;
    __Vtemp4[0xbU] = 0x32303233U;
    __Vtemp4[0xcU] = 0x6d62752dU;
    __Vtemp4[0xdU] = 0x412d6261U;
    __Vtemp4[0xeU] = 0x50616e64U;
    __Vtemp4[0xfU] = 0x6f6f742fU;
    __Vtemp4[0x10U] = 0x2f72U;
    VL_READMEM_W (false,8,256, 0,17, __Vtemp4, vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory
		  ,0U,0xffU);
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_19__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_5__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_9__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:164
    vlTOPp->icrc_tb__DOT__Mout_we_ram_queue_curr = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[0U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[1U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[2U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[3U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U] = 0U;
    vlTOPp->icrc_tb__DOT__Mout_Wdata_ram_queue_curr = 0U;
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_next = 0U;
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr = 0U;
    vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp = 0U;
    vlTOPp->icrc_tb__DOT__base_addr = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:80
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_0__DOT__reg_out1 = 0U;
    // INITIAL at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:188
    __Vtemp5[0U] = 0x2e747874U;
    __Vtemp5[1U] = 0x6c756573U;
    __Vtemp5[2U] = 0x6e2f7661U;
    __Vtemp5[3U] = 0x6174696fU;
    __Vtemp5[4U] = 0x696d756cU;
    __Vtemp5[5U] = 0x742f2f73U;
    __Vtemp5[6U] = 0x75747075U;
    __Vtemp5[7U] = 0x4c535f6fU;
    __Vtemp5[8U] = 0x616c2f48U;
    __Vtemp5[9U] = 0x746f7269U;
    __Vtemp5[0xaU] = 0x632f7475U;
    __Vtemp5[0xbU] = 0x732f6372U;
    __Vtemp5[0xcU] = 0x6d706c65U;
    __Vtemp5[0xdU] = 0x2f657861U;
    __Vtemp5[0xeU] = 0x32332e31U;
    __Vtemp5[0xfU] = 0x752d3230U;
    __Vtemp5[0x10U] = 0x62616d62U;
    __Vtemp5[0x11U] = 0x6e64412dU;
    __Vtemp5[0x12U] = 0x742f5061U;
    __Vtemp5[0x13U] = 0x2f726f6fU;
    vlTOPp->icrc_tb__DOT__file = VL_FOPEN_WI(20, __Vtemp5
					     , 0x72U);
    if (VL_UNLIKELY((0U == vlTOPp->icrc_tb__DOT__file))) {
	VL_WRITEF("ERROR - Error opening the file\n");
	VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",196,"");
    }
    __Vtemp6[0U] = 0x2e747874U;
    __Vtemp6[1U] = 0x756c7473U;
    __Vtemp6[2U] = 0x2f726573U;
    __Vtemp6[3U] = 0x7269616cU;
    __Vtemp6[4U] = 0x7475746fU;
    __Vtemp6[5U] = 0x6372632fU;
    __Vtemp6[6U] = 0x6c65732fU;
    __Vtemp6[7U] = 0x78616d70U;
    __Vtemp6[8U] = 0x2e312f65U;
    __Vtemp6[9U] = 0x32303233U;
    __Vtemp6[0xaU] = 0x6d62752dU;
    __Vtemp6[0xbU] = 0x412d6261U;
    __Vtemp6[0xcU] = 0x50616e64U;
    __Vtemp6[0xdU] = 0x6f6f742fU;
    __Vtemp6[0xeU] = 0x2f72U;
    vlTOPp->icrc_tb__DOT__res_file = VL_FOPEN_WI(15
						 , __Vtemp6
						 , 0x77U);
    if (VL_UNLIKELY((0U == vlTOPp->icrc_tb__DOT__res_file))) {
	VL_WRITEF("ERROR - Error opening the res_file\n");
	VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
	VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",206,"");
    }
    vlTOPp->icrc_tb__DOT__sim_time = VL_ULL(0);
    vlTOPp->icrc_tb__DOT__startTime = VL_ULL(0);
    vlTOPp->icrc_tb__DOT__endTime = VL_ULL(0);
    vlTOPp->icrc_tb__DOT___ch_ = 0U;
    vlTOPp->icrc_tb__DOT___n_ = 0U;
    vlTOPp->icrc_tb__DOT___r_ = 0U;
    vlTOPp->icrc_tb__DOT__line[0U] = 0U;
    vlTOPp->icrc_tb__DOT__line[1U] = 0U;
    vlTOPp->icrc_tb__DOT__line[2U] = 0U;
    vlTOPp->icrc_tb__DOT__line[3U] = 0U;
    vlTOPp->icrc_tb__DOT__line[4U] = 0U;
    vlTOPp->icrc_tb__DOT__line[5U] = 0U;
    vlTOPp->icrc_tb__DOT__line[6U] = 0U;
    vlTOPp->icrc_tb__DOT__line[7U] = 0U;
    vlTOPp->icrc_tb__DOT__line[8U] = 0U;
    vlTOPp->icrc_tb__DOT__line[9U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xaU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xbU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xcU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xdU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xeU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xfU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x10U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x11U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x12U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x13U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x14U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x15U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x16U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x17U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x18U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x19U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x1aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x1bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x1cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x1dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x1eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x1fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x20U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x21U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x22U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x23U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x24U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x25U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x26U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x27U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x28U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x29U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x2aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x2bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x2cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x2dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x2eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x2fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x30U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x31U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x32U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x33U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x34U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x35U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x36U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x37U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x38U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x39U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x3aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x3bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x3cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x3dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x3eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x3fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x40U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x41U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x42U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x43U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x44U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x45U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x46U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x47U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x48U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x49U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x4aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x4bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x4cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x4dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x4eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x4fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x50U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x51U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x52U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x53U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x54U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x55U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x56U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x57U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x58U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x59U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x5aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x5bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x5cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x5dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x5eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x5fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x60U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x61U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x62U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x63U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x64U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x65U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x66U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x67U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x68U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x69U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x6aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x6bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x6cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x6dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x6eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x6fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x70U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x71U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x72U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x73U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x74U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x75U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x76U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x77U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x78U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x79U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x7aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x7bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x7cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x7dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x7eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x7fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x80U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x81U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x82U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x83U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x84U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x85U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x86U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x87U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x88U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x89U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x8aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x8bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x8cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x8dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x8eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x8fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x90U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x91U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x92U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x93U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x94U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x95U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x96U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x97U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x98U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x99U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x9aU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x9bU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x9cU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x9dU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x9eU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0x9fU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa0U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa1U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa2U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa3U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa4U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa5U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa6U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa7U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa8U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xa9U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xaaU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xabU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xacU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xadU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xaeU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xafU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb0U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb1U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb2U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb3U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb4U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb5U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb6U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb7U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb8U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xb9U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xbaU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xbbU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xbcU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xbdU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xbeU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xbfU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc0U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc1U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc2U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc3U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc4U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc5U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc6U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc7U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc8U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xc9U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xcaU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xcbU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xccU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xcdU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xceU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xcfU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd0U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd1U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd2U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd3U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd4U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd5U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd6U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd7U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd8U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xd9U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xdaU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xdbU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xdcU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xddU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xdeU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xdfU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe0U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe1U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe2U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe3U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe4U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe5U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe6U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe7U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe8U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xe9U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xeaU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xebU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xecU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xedU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xeeU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xefU] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf0U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf1U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf2U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf3U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf4U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf5U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf6U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf7U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf8U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xf9U] = 0U;
    vlTOPp->icrc_tb__DOT__line[0xfaU] = 0U;
    vlTOPp->icrc_tb__DOT___i_ = 0U;
    vlTOPp->icrc_tb__DOT___addr_i_ = 0U;
    vlTOPp->icrc_tb__DOT__compare_outputs = 0U;
    vlTOPp->icrc_tb__DOT_____05Fnext_state = 0U;
    vlTOPp->icrc_tb__DOT__reset = 0U;
    vlTOPp->icrc_tb__DOT__next_start_port = 0U;
    vlTOPp->icrc_tb__DOT__success = 1U;
    vlTOPp->icrc_tb__DOT__crc = 0U;
    vlTOPp->icrc_tb__DOT__lin = 0U;
    vlTOPp->icrc_tb__DOT__ex_lin = 0U;
    vlTOPp->icrc_tb__DOT__len = 0U;
    vlTOPp->icrc_tb__DOT__jinit = 0U;
    vlTOPp->icrc_tb__DOT__jrev = 0U;
    vlTOPp->icrc_tb__DOT__ex_return_port = 0U;
    vlTOPp->icrc_tb__DOT__registered_return_port = 0U;
    vlTOPp->icrc_tb__DOT__reg_DataReady[0U] = 0U;
    vlTOPp->icrc_tb__DOT__reg_DataReady[1U] = 0U;
    vlTOPp->icrc_tb__DOT__addr = 0U;
    while ((0x400U > vlTOPp->icrc_tb__DOT__addr)) {
	vlTOPp->icrc_tb__DOT___bambu_testbench_mem_[(0x3ffU 
						     & vlTOPp->icrc_tb__DOT__addr)] = 0U;
	vlTOPp->icrc_tb__DOT__addr = ((IData)(1U) + vlTOPp->icrc_tb__DOT__addr);
    }
}

void Vicrc_tb::_settle__TOP__2(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_settle__TOP__2\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->icrc_tb__DOT__Mout_Wdata_ram = (0xffff0000U 
					    & vlTOPp->icrc_tb__DOT__Mout_Wdata_ram);
    vlTOPp->icrc_tb__DOT__Mout_Wdata_ram = (0xffffU 
					    & vlTOPp->icrc_tb__DOT__Mout_Wdata_ram);
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size = (0x1fU 
						& (IData)(vlTOPp->icrc_tb__DOT__Mout_data_ram_size));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:513
    vlTOPp->icrc_tb__DOT__Mout_we_ram_queue_curr = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated 
	= (1U | (0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated 
	= (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated);
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
	= (0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write 
	= (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a 
	= (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a 
	= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated) 
	   | (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated) 
	   | (0xffff0000U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1) 
	   | (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1) 
	   | (0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)) 
	   | (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)) 
	   | (0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2 
	= (((QData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_3__DOT__reg_out1 
			     + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_24__DOT__reg_out1)))) 
	    << 0x20U) | (QData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_2__DOT__reg_out1 
					 + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_23__DOT__reg_out1)))));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:811
    vlTOPp->icrc_tb__DOT__start_results_comparison = 0U;
    vlTOPp->icrc_tb__DOT__reset = 1U;
    vlTOPp->icrc_tb__DOT__next_start_port = 0U;
    if ((0U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
	vlTOPp->icrc_tb__DOT__reset = 0U;
	vlTOPp->icrc_tb__DOT_____05Fnext_state = 1U;
    } else {
	if ((1U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
	    vlTOPp->icrc_tb__DOT__reset = 0U;
	    vlTOPp->icrc_tb__DOT_____05Fnext_state = 2U;
	} else {
	    if ((2U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
		if (VL_LTS_III(1,32,32, 0x64U, vlTOPp->icrc_tb__DOT__currTime)) {
		    vlTOPp->icrc_tb__DOT__next_start_port = 1U;
		    vlTOPp->icrc_tb__DOT_____05Fnext_state 
			= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1)
			    ? 4U : 3U);
		} else {
		    vlTOPp->icrc_tb__DOT_____05Fnext_state = 2U;
		}
	    } else {
		if ((3U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
		    vlTOPp->icrc_tb__DOT_____05Fnext_state 
			= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1)
			    ? 4U : 3U);
		} else {
		    if ((4U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
			vlTOPp->icrc_tb__DOT__start_results_comparison = 1U;
			vlTOPp->icrc_tb__DOT_____05Fnext_state = 5U;
		    } else {
			vlTOPp->icrc_tb__DOT_____05Fnext_state 
			    = ((5U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))
			        ? 2U : 0U);
		    }
		}
	    }
	}
    }
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372 
	= (0xfffffffeU & (((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_4__DOT__reg_out1 
			    >> 1U) + (0x7fffffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1)) 
			  << 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0 
	= (((0U != vlTOPp->icrc_tb__DOT__len) << 1U) 
	   | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0 
	= ((4U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		  << 2U)) | (((0U != vlTOPp->icrc_tb__DOT__len) 
			      << 1U) | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0 
	= ((4U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		  << 2U)) | (((0U != vlTOPp->icrc_tb__DOT__len) 
			      << 1U) | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0 
	= ((0x10U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		     << 4U)) | (((0U != vlTOPp->icrc_tb__DOT__len) 
				 << 3U) | (((0U != vlTOPp->icrc_tb__DOT__len) 
					    << 2U) 
					   | ((2U & 
					       (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
						<< 1U)) 
					      | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit))))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0 
	= ((2U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		  << 1U)) | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043 
	= (0xffffU & ((VL_EXTENDS_II(16,9, (0xffU & (IData)(vlTOPp->icrc_tb__DOT__jinit))) 
		       << 8U) | VL_EXTENDS_II(16,9, 
					      (0xffU 
					       & (IData)(vlTOPp->icrc_tb__DOT__jinit)))));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:557
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:557
    vlTOPp->icrc_tb__DOT__Mout_Wdata_ram_queue_curr 
	= vlTOPp->icrc_tb__DOT__Mout_Wdata_ram;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a) 
	   | ((0U >= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a)))
	       ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory
	      [(1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a))]
	       : 0U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a) 
	   | (((0U >= (1U & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a) 
			     >> 1U))) ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory
	       [(1U & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a) 
		       >> 1U))] : 0U) << 0x10U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132 
	= (0xffffU & (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
		      ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_31__DOT__reg_out1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197 
	= (0xffffU & (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
		      ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_37__DOT__reg_out1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473 
	= (0xfffffffeU & (((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_10__DOT__reg_out1 
			    >> 1U) + (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_36__DOT__reg_out1) 
					       ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)))) 
			  << 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081 
	= (0xffffU & ((VL_EXTENDS_II(16,9, (0xffU & 
					    ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1) 
					     >> 8U))) 
		       << 8U) | VL_EXTENDS_II(16,9, 
					      (0xffU 
					       & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2 
				       >> 0x20U)))) 
	      << 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1) 
	   | (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1) 
	   | (0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr 
				       >> 0x20U)))) 
	      << 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:3952
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_207_reg_29_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_214_reg_35_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_10 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_11 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_12 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_13 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_14 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_15 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_16 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_17 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_18 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_23 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_24 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_25 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_26 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_27 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_31 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_32 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_36 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_37 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_38 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_6 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_7 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_8 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_9 = 0U;
    if (((((((((1U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state) 
	       | (4U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	      | (8U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	     | (0x10U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	    | (0x20U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	   | (2U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	  | (0x200000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	 | (0x100U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state))) {
	if ((1U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
	    if (vlTOPp->icrc_tb__DOT__start_port) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_10 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_11 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_12 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_13 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_14 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_15 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_16 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_17 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_18 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_6 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_7 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_8 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_9 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5 = 1U;
		if ((0U == (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1))) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 4U;
		} else {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 2U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2 = 0U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3 = 0U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4 = 0U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5 = 0U;
		}
	    } else {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
	    }
	} else {
	    if ((4U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 8U;
	    } else {
		if ((8U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_23 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_24 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_25 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_26 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_27 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x10U;
		} else {
		    if ((0x10U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 1U;
			if ((8U != ((IData)(1U) + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1))) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x10U;
			} else {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 0U;
			}
		    } else {
			if ((0x20U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state 
				= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_27__DOT__reg_out1)
				    ? 8U : 2U);
			} else {
			    if ((2U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
				if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_17__DOT__reg_out1) {
				    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1) {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    } else {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x1000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    }
				} else {
				    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1) {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    } else {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x200000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 1U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    }
				}
			    } else {
				if ((0x200000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_207_reg_29_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_31 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_32 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x200U;
				}
			    }
			}
		    }
		}
	    }
	}
    } else {
	if (((((((((0x200U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state) 
		   | (0x400U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
		  | (0x800U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
		 | (0x40U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
		| (0x80U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	       | (0x1000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	      | (0x2000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	     | (0x4000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state))) {
	    if ((0x200U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x400U;
	    } else {
		if ((0x400U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x800U;
		} else {
		    if ((0x800U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
			if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_32__DOT__reg_out1) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
			} else {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0 = 0U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 0U;
			}
		    } else {
			if ((0x40U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x80U;
			} else {
			    if ((0x80U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
				if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_14__DOT__reg_out1) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x1000U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40000U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
				}
			    } else {
				if ((0x1000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_214_reg_35_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_36 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_37 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_38 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x2000U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state 
					= ((0x2000U 
					    == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)
					    ? 0x4000U
					    : 0x8000U);
				}
			    }
			}
		    }
		}
	    }
	} else {
	    if ((0x8000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x10000U;
	    } else {
		if ((0x10000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
		    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_38__DOT__reg_out1) {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x1000U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
		    } else {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0 = 0U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 0U;
		    }
		} else {
		    if ((0x20000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_11__DOT__reg_out1) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100000U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 1U;
			} else {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40000U;
			}
		    } else {
			if ((0x100000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_0 = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
			} else {
			    if ((0x40000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x80000U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 1U;
			    } else {
				if ((0x80000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_1 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
				}
			    }
			}
		    }
		}
	    }
	}
    }
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a 
	= ((0xf0U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a)) 
	   | (0xfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a 
	= ((0xfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a)) 
	   | (0xf0U & ((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr 
				>> 0x20U)) << 4U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_198_reg_20_0_0_0 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0)
	    ? ((IData)(1U) + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1)
	    : 0U);
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_200_reg_22_0_0_0 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0)
	    ? 0U : ((IData)(1U) + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_206_reg_28_0_0_0 
	= (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0)
		       ? ((IData)(1U) + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1))
		       : 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_213_reg_34_0_0_0 
	= (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0)
		       ? ((IData)(1U) + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1))
		       : 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write 
	= ((1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write)) 
	   | ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE) 
	      << 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_199_reg_21_0_0_0 
	= (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0)
		       ? ((0x8000U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1))
			   ? (0x1021U ^ ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1) 
					 << 1U)) : 
			  ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1) 
			   << 1U)) : (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1 
				      << 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write 
	= ((2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write)) 
	   | (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write 
	= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write 
	= ((2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write)) 
	   | (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write 
	= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1)
	    ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473
	    : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0)
	        ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_33__DOT__reg_out1
	        : vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_25__DOT__reg_out1));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2 
	= (((QData)((IData)(((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1)
			      ? (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_13__DOT__reg_out1 
				 + (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1)))
			      : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0)
				  ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_7__DOT__reg_out1
				  : vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_26__DOT__reg_out1)))) 
	    << 0x20U) | (QData)((IData)(((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1)
					  ? (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_12__DOT__reg_out1 
					     + (0xffU 
						& ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1) 
						   >> 8U)))
					  : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0)
					      ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_6__DOT__reg_out1
					      : vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_39__DOT__reg_out1)))));
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size = ((0x3e0U 
						 & (IData)(vlTOPp->icrc_tb__DOT__Mout_data_ram_size)) 
						| ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD)
						    ? 8U
						    : 0U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0)
	    ? (vlTOPp->icrc_tb__DOT__lin + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_29__DOT__reg_out1))
	    : (vlTOPp->icrc_tb__DOT__lin + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_35__DOT__reg_out1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)) 
	   | vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory
	   [(0xfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a))]);
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)) 
	   | (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory
	      [(0xfU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a) 
			>> 4U))] << 8U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | ((QData)((IData)((IData)(((QData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1)) 
				       >> 0x20U)))) 
	      << 0x20U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2 
				       >> 0x20U)))) 
	      << 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:571
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr 
	= ((0x3ffU & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr) 
	   | (0xffc00U & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_next));
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr 
	= ((0xffc00U & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr) 
	   | (IData)(vlTOPp->icrc_tb__DOT__Mout_data_ram_size));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram = ((VL_ULL(0xffffffff00000000) 
					    & vlTOPp->icrc_tb__DOT__Mout_addr_ram) 
					   | (IData)((IData)(
							     ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD)
							       ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0
							       : 0U))));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram = (VL_ULL(0xffffffff) 
					   & vlTOPp->icrc_tb__DOT__Mout_addr_ram);
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1)) 
	   | (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1)) 
	   | (0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
				       >> 0x20U)))) 
	      << 0x20U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
				       >> 0x20U)))) 
	      << 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:586
    vlTOPp->icrc_tb__DOT__mask = (0xffff0000U & vlTOPp->icrc_tb__DOT__mask);
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:598
    vlTOPp->icrc_tb__DOT__mask = (0xffffU & vlTOPp->icrc_tb__DOT__mask);
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:527
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U] 
	= (IData)((((QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[3U])) 
		    << 0x20U) | (QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[2U]))));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U] 
	= (IData)(((((QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[3U])) 
		     << 0x20U) | (QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[2U]))) 
		   >> 0x20U));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U] 
	= (IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram);
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U] 
	= (IData)((vlTOPp->icrc_tb__DOT__Mout_addr_ram 
		   >> 0x20U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945 
	= (0xffU & (((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1) 
		     << 4U) | ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1) 
			       >> 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xffU & (IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
			       >> 1U))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xff00U & ((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
				  >> 0x21U)) << 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xff00U & ((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
				  >> 0x20U)) << 8U)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:623
    vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp = ((0xffff0000U 
					       & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp) 
					      | (((vlTOPp->icrc_tb__DOT__base_addr 
						   <= 
						   vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U]) 
						  & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U] 
						     < 
						     ((IData)(0x400U) 
						      + vlTOPp->icrc_tb__DOT__base_addr)))
						  ? 
						 ((vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						   [
						   (0x3ffU 
						    & (((IData)(1U) 
							+ 
							vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U]) 
						       - vlTOPp->icrc_tb__DOT__base_addr))] 
						   << 8U) 
						  | vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						  [
						  (0x3ffU 
						   & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U] 
						      - vlTOPp->icrc_tb__DOT__base_addr))])
						  : 0U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:629
    vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp = ((0xffffU 
					       & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp) 
					      | ((((vlTOPp->icrc_tb__DOT__base_addr 
						    <= 
						    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U]) 
						   & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U] 
						      < 
						      ((IData)(0x400U) 
						       + vlTOPp->icrc_tb__DOT__base_addr)))
						   ? 
						  ((vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						    [
						    (0x3ffU 
						     & (((IData)(1U) 
							 + 
							 vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U]) 
							- vlTOPp->icrc_tb__DOT__base_addr))] 
						    << 8U) 
						   | vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						   [
						   (0x3ffU 
						    & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U] 
						       - vlTOPp->icrc_tb__DOT__base_addr))])
						   : 0U) 
						 << 0x10U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated)) 
	   | ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945) 
	      << 8U));
    vlTOPp->icrc_tb__DOT__M_Rdata_ram = ((0xffff0000U 
					  & vlTOPp->icrc_tb__DOT__M_Rdata_ram) 
					 | (0xffffU 
					    & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp));
    vlTOPp->icrc_tb__DOT__M_Rdata_ram = ((0xffffU & vlTOPp->icrc_tb__DOT__M_Rdata_ram) 
					 | (0xffff0000U 
					    & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1)) 
	   | (0xffU & vlTOPp->icrc_tb__DOT__M_Rdata_ram));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1)) 
	   | (0xff00U & (vlTOPp->icrc_tb__DOT__M_Rdata_ram 
			 >> 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441 
	= (0xfffffffeU & (((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_8__DOT__reg_out1 
			    >> 1U) + (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_30__DOT__reg_out1) 
					       ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1)))) 
			  << 1U));
}

VL_INLINE_OPT void Vicrc_tb::_sequent__TOP__3(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_sequent__TOP__3\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIG8(icrc_tb__DOT____Vconcswap1,7,0);
    VL_SIG8(icrc_tb__DOT____Vconcswap2,7,0);
    VL_SIG8(icrc_tb__DOT____Vconcswap3,7,0);
    VL_SIG8(icrc_tb__DOT____Vconcswap4,7,0);
    // Body
    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0U;
    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0U;
    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0U;
    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0U;
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:663
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:883
    vlTOPp->icrc_tb__DOT__currTime = (IData)(VL_TIME_Q());
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:611
    if ((((IData)(vlTOPp->icrc_tb__DOT__Mout_we_ram_queue_curr) 
	  & (vlTOPp->icrc_tb__DOT__base_addr <= vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U])) 
	 & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U] 
	    < ((IData)(0x400U) + vlTOPp->icrc_tb__DOT__base_addr)))) {
	icrc_tb__DOT____Vconcswap1 = (0xffU & (((vlTOPp->icrc_tb__DOT__Mout_Wdata_ram_queue_curr 
						 & vlTOPp->icrc_tb__DOT__mask) 
						>> 8U) 
					       | (((0xffffffU 
						    & vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						    [
						    (0x3ffU 
						     & (((IData)(1U) 
							 + 
							 vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U]) 
							- vlTOPp->icrc_tb__DOT__base_addr))]) 
						   | (vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						      [
						      (0x3ffU 
						       & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U] 
							  - vlTOPp->icrc_tb__DOT__base_addr))] 
						      >> 8U)) 
						  & ((~ vlTOPp->icrc_tb__DOT__mask) 
						     >> 8U))));
	icrc_tb__DOT____Vconcswap2 = (0xffU & ((vlTOPp->icrc_tb__DOT__Mout_Wdata_ram_queue_curr 
						& vlTOPp->icrc_tb__DOT__mask) 
					       | (vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						  [
						  (0x3ffU 
						   & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U] 
						      - vlTOPp->icrc_tb__DOT__base_addr))] 
						  & (~ vlTOPp->icrc_tb__DOT__mask))));
	vlTOPp->icrc_tb__DOT___bambu_testbench_mem_[(0x3ffU 
						     & (((IData)(1U) 
							 + 
							 vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U]) 
							- vlTOPp->icrc_tb__DOT__base_addr))] 
	    = icrc_tb__DOT____Vconcswap1;
	vlTOPp->icrc_tb__DOT___bambu_testbench_mem_[(0x3ffU 
						     & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U] 
							- vlTOPp->icrc_tb__DOT__base_addr))] 
	    = icrc_tb__DOT____Vconcswap2;
    }
    if (((((IData)(vlTOPp->icrc_tb__DOT__Mout_we_ram_queue_curr) 
	   >> 1U) & (vlTOPp->icrc_tb__DOT__base_addr 
		     <= vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U])) 
	 & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U] 
	    < ((IData)(0x400U) + vlTOPp->icrc_tb__DOT__base_addr)))) {
	icrc_tb__DOT____Vconcswap3 = (0xffU & (((vlTOPp->icrc_tb__DOT__Mout_Wdata_ram_queue_curr 
						 & vlTOPp->icrc_tb__DOT__mask) 
						>> 0x18U) 
					       | (((0xffffffU 
						    & vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						    [
						    (0x3ffU 
						     & (((IData)(1U) 
							 + 
							 vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U]) 
							- vlTOPp->icrc_tb__DOT__base_addr))]) 
						   | (vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						      [
						      (0x3ffU 
						       & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U] 
							  - vlTOPp->icrc_tb__DOT__base_addr))] 
						      >> 8U)) 
						  & ((~ 
						      (vlTOPp->icrc_tb__DOT__mask 
						       >> 0x10U)) 
						     >> 8U))));
	icrc_tb__DOT____Vconcswap4 = (0xffU & (((vlTOPp->icrc_tb__DOT__Mout_Wdata_ram_queue_curr 
						 & vlTOPp->icrc_tb__DOT__mask) 
						>> 0x10U) 
					       | (vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						  [
						  (0x3ffU 
						   & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U] 
						      - vlTOPp->icrc_tb__DOT__base_addr))] 
						  & (~ 
						     (vlTOPp->icrc_tb__DOT__mask 
						      >> 0x10U)))));
	vlTOPp->icrc_tb__DOT___bambu_testbench_mem_[(0x3ffU 
						     & (((IData)(1U) 
							 + 
							 vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U]) 
							- vlTOPp->icrc_tb__DOT__base_addr))] 
	    = icrc_tb__DOT____Vconcswap3;
	vlTOPp->icrc_tb__DOT___bambu_testbench_mem_[(0x3ffU 
						     & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U] 
							- vlTOPp->icrc_tb__DOT__base_addr))] 
	    = icrc_tb__DOT____Vconcswap4;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:883
    if (VL_UNLIKELY(((VL_TIME_Q() >= vlTOPp->icrc_tb__DOT__startTime) 
		     & (VL_ULL(0xbebc200) < (((QData)(
						      VL_TIME_Q()) 
					      - vlTOPp->icrc_tb__DOT__startTime) 
					     >> 1U))))) {
	VL_WRITEF("Simulation not completed into   200000000 cycles\n");
	VL_FWRITEF(vlTOPp->icrc_tb__DOT__res_file,"X\t  200000000\n");
	VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
	VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
	VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",891,"");
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:246
    if (VL_UNLIKELY(vlTOPp->icrc_tb__DOT__next_start_port)) {
	vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	vlTOPp->icrc_tb__DOT__startTime = VL_TIME_Q();
	if (VL_UNLIKELY((vlTOPp->icrc_tb__DOT__file ? feof(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : true))) {
	    VL_WRITEF("No more values found. Simulation(s) executed: %11d.\n\n",
		      32,vlTOPp->icrc_tb__DOT___n_);
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
	    VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",257,"");
	}
	while ((((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		 | (0xaU == vlTOPp->icrc_tb__DOT___ch_)) 
		| (0x62U == vlTOPp->icrc_tb__DOT___ch_))) {
	    if ((0x62U == vlTOPp->icrc_tb__DOT___ch_)) {
		vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
							 32,
							 &(vlTOPp->icrc_tb__DOT__base_addr)) ;
	    } else {
		vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    }
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	}
	while ((((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		 | (0xaU == vlTOPp->icrc_tb__DOT___ch_)) 
		| (0x6dU == vlTOPp->icrc_tb__DOT___ch_))) {
	    if ((0x6dU == vlTOPp->icrc_tb__DOT___ch_)) {
		vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
							 8,
							 &(vlTOPp->icrc_tb__DOT___bambu_databyte_)) ;
		vlTOPp->icrc_tb__DOT___bambu_testbench_mem_[(0x3ffU 
							     & vlTOPp->icrc_tb__DOT___addr_i_)] 
		    = vlTOPp->icrc_tb__DOT___bambu_databyte_;
		vlTOPp->icrc_tb__DOT___addr_i_ = ((IData)(1U) 
						  + vlTOPp->icrc_tb__DOT___addr_i_);
	    } else {
		vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    }
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	}
	while (((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		| (0xaU == vlTOPp->icrc_tb__DOT___ch_))) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	}
	if (VL_UNLIKELY((0xffffffffU == vlTOPp->icrc_tb__DOT___ch_))) {
	    VL_WRITEF("No more values found. Simulation(s) executed: %11d.\n\n",
		      32,vlTOPp->icrc_tb__DOT___n_);
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
	    VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",298,"");
	} else {
	    vlTOPp->icrc_tb__DOT___n_ = ((IData)(1U) 
					 + vlTOPp->icrc_tb__DOT___n_);
	    VL_WRITEF("Start reading vector %11d's values from input file.\n\n",
		      32,vlTOPp->icrc_tb__DOT___n_);
	}
	if ((0x70U == vlTOPp->icrc_tb__DOT___ch_)) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
						     16,
						     &(vlTOPp->icrc_tb__DOT__crc)) ;
	}
	if ((1U != vlTOPp->icrc_tb__DOT___r_)) {
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    if ((0xffffffffU == vlTOPp->icrc_tb__DOT___ch_)) {
		VL_WRITEF("ERROR - End of file reached before getting all the values for the parameters\n");
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",318,"");
	    } else {
		VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
			  8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",325,"");
	    }
	}
	vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	while (((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		| (0xaU == vlTOPp->icrc_tb__DOT___ch_))) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	}
	if ((0x70U == vlTOPp->icrc_tb__DOT___ch_)) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
						     32,
						     &(vlTOPp->icrc_tb__DOT__lin)) ;
	}
	if ((1U != vlTOPp->icrc_tb__DOT___r_)) {
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    if ((0xffffffffU == vlTOPp->icrc_tb__DOT___ch_)) {
		VL_WRITEF("ERROR - End of file reached before getting all the values for the parameters\n");
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",352,"");
	    } else {
		VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
			  8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",359,"");
	    }
	}
	vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	while (((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		| (0xaU == vlTOPp->icrc_tb__DOT___ch_))) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	}
	if ((0x70U == vlTOPp->icrc_tb__DOT___ch_)) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
						     32,
						     &(vlTOPp->icrc_tb__DOT__len)) ;
	}
	if ((1U != vlTOPp->icrc_tb__DOT___r_)) {
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    if ((0xffffffffU == vlTOPp->icrc_tb__DOT___ch_)) {
		VL_WRITEF("ERROR - End of file reached before getting all the values for the parameters\n");
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",386,"");
	    } else {
		VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
			  8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",393,"");
	    }
	}
	vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	while (((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		| (0xaU == vlTOPp->icrc_tb__DOT___ch_))) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	}
	if ((0x70U == vlTOPp->icrc_tb__DOT___ch_)) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
						     16,
						     &(vlTOPp->icrc_tb__DOT__jinit)) ;
	}
	if ((1U != vlTOPp->icrc_tb__DOT___r_)) {
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    if ((0xffffffffU == vlTOPp->icrc_tb__DOT___ch_)) {
		VL_WRITEF("ERROR - End of file reached before getting all the values for the parameters\n");
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",420,"");
	    } else {
		VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
			  8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",427,"");
	    }
	}
	vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	while (((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		| (0xaU == vlTOPp->icrc_tb__DOT___ch_))) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	}
	if ((0x70U == vlTOPp->icrc_tb__DOT___ch_)) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
						     32,
						     &(vlTOPp->icrc_tb__DOT__jrev)) ;
	}
	if ((1U != vlTOPp->icrc_tb__DOT___r_)) {
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    if ((0xffffffffU == vlTOPp->icrc_tb__DOT___ch_)) {
		VL_WRITEF("ERROR - End of file reached before getting all the values for the parameters\n");
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",454,"");
	    } else {
		VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
			  8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",461,"");
	    }
	}
	vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	VL_WRITEF("Reading of vector values from input file completed. Simulation started.\n");
    }
    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0 = 0U;
    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1 = 0U;
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:560
    if ((1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write))) {
	vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 
	    = (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated));
	vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 1U;
	vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 
	    = (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:577
    if ((2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write))) {
	vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 
	    = (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated) 
			>> 8U));
	vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 1U;
	vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 
	    = (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a) 
			>> 8U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:560
    if ((1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write))) {
	vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 
	    = (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated);
	vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 1U;
	vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 
	    = (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:577
    if ((2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write))) {
	vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 
	    = (0xffffU & (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
			  >> 0x10U));
	vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 1U;
	vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 
	    = (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a) 
			>> 8U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:560
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a) 
	   | vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory
	   [(0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a))]);
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:577
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a) 
	   | (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory
	      [(0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a) 
			 >> 8U))] << 0x10U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:108
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_33__DOT__reg_out1 
	= vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441;
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:567
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_next 
	= ((0x3ffU & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_next) 
	   | (0xffc00U & (vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr 
			  << 0xaU)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:523
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[2U] 
	= (IData)((((QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U])) 
		    << 0x20U) | (QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U]))));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[3U] 
	= (IData)(((((QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U])) 
		     << 0x20U) | (QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U]))) 
		   >> 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:864
    vlTOPp->icrc_tb__DOT_____05Fstate = vlTOPp->icrc_tb__DOT_____05Fnext_state;
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:560
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a)) 
	   | vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory
	   [(0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a))]);
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:577
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a)) 
	   | (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory
	      [(0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a) 
			 >> 8U))] << 8U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_4__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_8) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_8__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1 
	    = vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_199_reg_21_0_0_0;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_25) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_25__DOT__reg_out1 
	    = vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_12) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_12__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_13) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_13__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:108
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_39__DOT__reg_out1 
	= (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_9__DOT__reg_out1 
	   + (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_10) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_10__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:4368
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1 
	= ((IData)(vlTOPp->icrc_tb__DOT__reset) & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_6) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_6__DOT__reg_out1 
	    = ((IData)(0x200U) + (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__crc) 
					   >> 8U)));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_7) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_7__DOT__reg_out1 
	    = ((IData)(0x200U) + (0xffU & (IData)(vlTOPp->icrc_tb__DOT__crc)));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:108
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_30__DOT__reg_out1 
	= (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_19__DOT__reg_out1) 
		    >> 8U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_26) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_26__DOT__reg_out1 
	    = (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_5__DOT__reg_out1 
	       + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1);
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:864
    vlTOPp->icrc_tb__DOT__start_port = vlTOPp->icrc_tb__DOT__next_start_port;
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_31) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_31__DOT__reg_out1 
	    = (0xffffU & (VL_EXTENDS_II(16,9, (0xffU 
					       & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_19__DOT__reg_out1))) 
			  << 8U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_29__DOT__reg_out1 
	    = (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_207_reg_29_0_0_0)
			   ? ((IData)(1U) + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1))
			   : 1U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_35__DOT__reg_out1 
	    = (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_214_reg_35_0_0_0)
			   ? ((IData)(1U) + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1))
			   : 1U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1 
	    = vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_200_reg_22_0_0_0;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_37) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_37__DOT__reg_out1 
	    = (0xffffU & (VL_EXTENDS_II(16,9, (0xffU 
					       & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_0__DOT__reg_out1))) 
			  << 8U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_15) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1 
	    = (1U & ((2U >= (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0))
		      ? (4U >> (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0))
		      : 0U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_16) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1 
	    = (1U & ((1U >= (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0))
		      ? (2U >> (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0))
		      : 0U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_17) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_17__DOT__reg_out1 
	    = (1U & ((7U >= (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0))
		      ? (0x80U >> (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0))
		      : 0U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_18) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1 
	    = (1U & ((0x1cU >= (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0))
		      ? (0x1010ba10U >> (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0))
		      : 0U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_36) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_36__DOT__reg_out1 
	    = (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_0__DOT__reg_out1) 
			>> 8U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_2__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_3__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_11) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_11__DOT__reg_out1 
	    = VL_LTES_III(1,32,32, 0U, vlTOPp->icrc_tb__DOT__jrev);
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_14) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_14__DOT__reg_out1 
	    = (0U != vlTOPp->icrc_tb__DOT__len);
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:3946
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state 
	= ((IData)(vlTOPp->icrc_tb__DOT__reset) ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state
	    : 1U);
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_27) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_27__DOT__reg_out1 
	    = (0x100U != ((IData)(1U) + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_23) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_23__DOT__reg_out1 
	    = (0xfU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1);
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_24) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_24__DOT__reg_out1 
	    = (0xfffU & (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1 
			 >> 4U));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_32) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_32__DOT__reg_out1 
	    = (vlTOPp->icrc_tb__DOT__len >= (0xffffU 
					     & ((IData)(1U) 
						+ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1))));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_38) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_38__DOT__reg_out1 
	    = ((0xffffU & ((IData)(1U) + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1))) 
	       <= vlTOPp->icrc_tb__DOT__len);
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1 
	    = ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0)
	        ? ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0)
		    ? (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_0__DOT__reg_out1)
		    : (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197))
	        : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1)
		    ? (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081)
		    : (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132)));
    }
}

VL_INLINE_OPT void Vicrc_tb::_sequent__TOP__4(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_sequent__TOP__4\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIG8(__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0,0,0);
    VL_SIG8(__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1,0,0);
    VL_SIG16(__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0,15,0);
    VL_SIG16(__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1,15,0);
    // Body
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0 
	= (((0U != vlTOPp->icrc_tb__DOT__len) << 1U) 
	   | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0 
	= ((4U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		  << 2U)) | (((0U != vlTOPp->icrc_tb__DOT__len) 
			      << 1U) | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0 
	= ((4U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		  << 2U)) | (((0U != vlTOPp->icrc_tb__DOT__len) 
			      << 1U) | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0 
	= ((0x10U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		     << 4U)) | (((0U != vlTOPp->icrc_tb__DOT__len) 
				 << 3U) | (((0U != vlTOPp->icrc_tb__DOT__len) 
					    << 2U) 
					   | ((2U & 
					       (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
						<< 1U)) 
					      | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit))))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0 
	= ((2U & (VL_SHIFTRS_III(1,32,5, vlTOPp->icrc_tb__DOT__jrev, 0x1fU) 
		  << 1U)) | VL_LTES_III(1,16,16, 0U, (IData)(vlTOPp->icrc_tb__DOT__jinit)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:295
    if ((1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write))) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound1 
	    = (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated);
	if ((0U >= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a)))) {
	    __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0 
		= vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound1;
	    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0 = 1U;
	    __Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0 
		= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a));
	}
    }
    if ((2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write))) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound2 
	    = (0xffffU & (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated 
			  >> 0x10U));
	if ((0U >= (1U & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a) 
			  >> 1U)))) {
	    __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1 
		= vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound2;
	    vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1 = 1U;
	    __Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1 
		= (1U & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a) 
			 >> 1U));
	}
    }
    // ALWAYSPOST at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:561
    if (vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0] 
	    = vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0;
    }
    if (vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1] 
	    = vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1;
    }
    // ALWAYSPOST at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:561
    if (vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0] 
	    = vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0;
    }
    if (vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[vlTOPp->__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1] 
	    = vlTOPp->__Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0)));
    // ALWAYSPOST at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:298
    if (vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory[__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0] 
	    = __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0;
    }
    if (vlTOPp->__Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory[__Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1] 
	    = __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1;
    }
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1) 
	   | (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1) 
	   | (0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)) 
	   | (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)) 
	   | (0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated) 
	   | (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated) 
	   | (0xffff0000U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_9) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_9__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:811
    vlTOPp->icrc_tb__DOT__start_results_comparison = 0U;
    vlTOPp->icrc_tb__DOT__reset = 1U;
    vlTOPp->icrc_tb__DOT__next_start_port = 0U;
    if ((0U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
	vlTOPp->icrc_tb__DOT__reset = 0U;
	vlTOPp->icrc_tb__DOT_____05Fnext_state = 1U;
    } else {
	if ((1U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
	    vlTOPp->icrc_tb__DOT__reset = 0U;
	    vlTOPp->icrc_tb__DOT_____05Fnext_state = 2U;
	} else {
	    if ((2U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
		if (VL_LTS_III(1,32,32, 0x64U, vlTOPp->icrc_tb__DOT__currTime)) {
		    vlTOPp->icrc_tb__DOT__next_start_port = 1U;
		    vlTOPp->icrc_tb__DOT_____05Fnext_state 
			= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1)
			    ? 4U : 3U);
		} else {
		    vlTOPp->icrc_tb__DOT_____05Fnext_state = 2U;
		}
	    } else {
		if ((3U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
		    vlTOPp->icrc_tb__DOT_____05Fnext_state 
			= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1)
			    ? 4U : 3U);
		} else {
		    if ((4U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))) {
			vlTOPp->icrc_tb__DOT__start_results_comparison = 1U;
			vlTOPp->icrc_tb__DOT_____05Fnext_state = 5U;
		    } else {
			vlTOPp->icrc_tb__DOT_____05Fnext_state 
			    = ((5U == (IData)(vlTOPp->icrc_tb__DOT_____05Fstate))
			        ? 2U : 0U);
		    }
		}
	    }
	}
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_5__DOT__reg_out1 = 0x200U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_19__DOT__reg_out1 
	    = ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0)
	        ? (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132)
	        : ((1U & ((3U >= (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0))
			   ? (8U >> (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0))
			   : 0U)) ? (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043)
		    : (IData)(vlTOPp->icrc_tb__DOT__crc)));
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1 
	    = vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_198_reg_20_0_0_0;
    }
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2 
	= (((QData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_3__DOT__reg_out1 
			     + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_24__DOT__reg_out1)))) 
	    << 0x20U) | (QData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_2__DOT__reg_out1 
					 + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_23__DOT__reg_out1)))));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1 
	    = vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_206_reg_28_0_0_0;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1 
	    = vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_213_reg_34_0_0_0;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:82
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0) {
	vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_0__DOT__reg_out1 
	    = ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1)
	        ? (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081)
	        : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0)
		    ? (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197)
		    : (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043)));
    }
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a) 
	   | ((0U >= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a)))
	       ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory
	      [(1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a))]
	       : 0U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a) 
	   | (((0U >= (1U & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a) 
			     >> 1U))) ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory
	       [(1U & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a) 
		       >> 1U))] : 0U) << 0x10U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473 
	= (0xfffffffeU & (((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_10__DOT__reg_out1 
			    >> 1U) + (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_36__DOT__reg_out1) 
					       ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)))) 
			  << 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132 
	= (0xffffU & (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
		      ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_31__DOT__reg_out1)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xfeU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xfdU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xfbU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (4U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xf7U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (8U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xefU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x10U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xdfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x20U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0xbfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x40U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:929
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 
	= ((0x7fU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0)) 
	   | (0x80U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2 
				       >> 0x20U)))) 
	      << 0x20U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081 
	= (0xffffU & ((VL_EXTENDS_II(16,9, (0xffU & 
					    ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1) 
					     >> 8U))) 
		       << 8U) | VL_EXTENDS_II(16,9, 
					      (0xffU 
					       & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1)))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043 
	= (0xffffU & ((VL_EXTENDS_II(16,9, (0xffU & (IData)(vlTOPp->icrc_tb__DOT__jinit))) 
		       << 8U) | VL_EXTENDS_II(16,9, 
					      (0xffU 
					       & (IData)(vlTOPp->icrc_tb__DOT__jinit)))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197 
	= (0xffffU & (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 
		      ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_37__DOT__reg_out1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1 
	= ((0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1) 
	   | (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1 
	= ((0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1) 
	   | (0xffff0000U & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372 
	= (0xfffffffeU & (((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_4__DOT__reg_out1 
			    >> 1U) + (0x7fffffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1)) 
			  << 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr 
				       >> 0x20U)))) 
	      << 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/icrc.v:3952
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_207_reg_29_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_214_reg_35_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_10 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_11 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_12 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_13 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_14 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_15 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_16 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_17 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_18 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_23 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_24 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_25 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_26 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_27 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_31 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_32 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_36 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_37 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_38 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_6 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_7 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_8 = 0U;
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_9 = 0U;
    if (((((((((1U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state) 
	       | (4U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	      | (8U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	     | (0x10U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	    | (0x20U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	   | (2U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	  | (0x200000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	 | (0x100U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state))) {
	if ((1U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
	    if (vlTOPp->icrc_tb__DOT__start_port) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_10 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_11 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_12 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_13 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_14 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_15 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_16 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_17 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_18 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_6 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_7 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_8 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_9 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5 = 1U;
		if ((0U == (0xffffU & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1))) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 4U;
		} else {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 2U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2 = 0U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3 = 0U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4 = 0U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5 = 0U;
		}
	    } else {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
	    }
	} else {
	    if ((4U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 8U;
	    } else {
		if ((8U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_23 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_24 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_25 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_26 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_27 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x10U;
		} else {
		    if ((0x10U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 1U;
			if ((8U != ((IData)(1U) + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1))) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x10U;
			} else {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 0U;
			}
		    } else {
			if ((0x20U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state 
				= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_27__DOT__reg_out1)
				    ? 8U : 2U);
			} else {
			    if ((2U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
				if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_17__DOT__reg_out1) {
				    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1) {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    } else {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x1000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    }
				} else {
				    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1) {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    } else {
					if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1) {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
					    }
					} else {
					    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1) {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    } else {
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x200000U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 1U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
						vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
					    }
					}
				    }
				}
			    } else {
				if ((0x200000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_207_reg_29_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_31 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_32 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x200U;
				}
			    }
			}
		    }
		}
	    }
	}
    } else {
	if (((((((((0x200U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state) 
		   | (0x400U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
		  | (0x800U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
		 | (0x40U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
		| (0x80U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	       | (0x1000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	      | (0x2000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) 
	     | (0x4000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state))) {
	    if ((0x200U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x400U;
	    } else {
		if ((0x400U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x800U;
		} else {
		    if ((0x800U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 1U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
			if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_32__DOT__reg_out1) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
			} else {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0 = 0U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 0U;
			}
		    } else {
			if ((0x40U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x80U;
			} else {
			    if ((0x80U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
				if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_14__DOT__reg_out1) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x1000U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40000U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0U;
				}
			    } else {
				if ((0x1000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_214_reg_35_0_0_0 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_36 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_37 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_38 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x2000U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state 
					= ((0x2000U 
					    == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)
					    ? 0x4000U
					    : 0x8000U);
				}
			    }
			}
		    }
		}
	    }
	} else {
	    if ((0x8000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 1U;
		vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x10000U;
	    } else {
		if ((0x10000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 1U;
		    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 1U;
		    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_38__DOT__reg_out1) {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x1000U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0U;
		    } else {
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x20000U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0 = 0U;
			vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 0U;
		    }
		} else {
		    if ((0x20000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_11__DOT__reg_out1) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x100000U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 1U;
			} else {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x40000U;
			}
		    } else {
			if ((0x100000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_0 = 1U;
			    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
			} else {
			    if ((0x40000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 = 1U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0x80000U;
				vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 1U;
			    } else {
				if ((0x80000U == vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state)) {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_1 = 1U;
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
				} else {
				    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 1U;
				}
			    }
			}
		    }
		}
	    }
	}
    }
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a 
	= ((0xf0U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a)) 
	   | (0xfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a 
	= ((0xfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a)) 
	   | (0xf0U & ((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr 
				>> 0x20U)) << 4U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_198_reg_20_0_0_0 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0)
	    ? ((IData)(1U) + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1)
	    : 0U);
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_200_reg_22_0_0_0 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0)
	    ? 0U : ((IData)(1U) + vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_206_reg_28_0_0_0 
	= (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0)
		       ? ((IData)(1U) + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1))
		       : 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_213_reg_34_0_0_0 
	= (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0)
		       ? ((IData)(1U) + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1))
		       : 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write 
	= ((1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write)) 
	   | ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE) 
	      << 1U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_199_reg_21_0_0_0 
	= (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0)
		       ? ((0x8000U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1))
			   ? (0x1021U ^ ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1) 
					 << 1U)) : 
			  ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1) 
			   << 1U)) : (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1 
				      << 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write 
	= ((2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write)) 
	   | (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write 
	= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write 
	= ((2U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write)) 
	   | (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write 
	= (1U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1)
	    ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473
	    : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0)
	        ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_33__DOT__reg_out1
	        : vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_25__DOT__reg_out1));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2 
	= (((QData)((IData)(((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1)
			      ? (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_13__DOT__reg_out1 
				 + (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1)))
			      : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0)
				  ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_7__DOT__reg_out1
				  : vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_26__DOT__reg_out1)))) 
	    << 0x20U) | (QData)((IData)(((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1)
					  ? (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_12__DOT__reg_out1 
					     + (0xffU 
						& ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1) 
						   >> 8U)))
					  : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0)
					      ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_6__DOT__reg_out1
					      : vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_39__DOT__reg_out1)))));
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size = ((0x3e0U 
						 & (IData)(vlTOPp->icrc_tb__DOT__Mout_data_ram_size)) 
						| ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD)
						    ? 8U
						    : 0U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 
	= ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0)
	    ? (vlTOPp->icrc_tb__DOT__lin + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_29__DOT__reg_out1))
	    : (vlTOPp->icrc_tb__DOT__lin + (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_35__DOT__reg_out1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)) 
	   | vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory
	   [(0xfU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a))]);
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)) 
	   | (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory
	      [(0xfU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a) 
			>> 4U))] << 8U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | ((QData)((IData)((IData)(((QData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1)) 
				       >> 0x20U)))) 
	      << 0x20U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2 
				       >> 0x20U)))) 
	      << 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:571
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr 
	= ((0x3ffU & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr) 
	   | (0xffc00U & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_next));
    vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr 
	= ((0xffc00U & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr) 
	   | (IData)(vlTOPp->icrc_tb__DOT__Mout_data_ram_size));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram = ((VL_ULL(0xffffffff00000000) 
					    & vlTOPp->icrc_tb__DOT__Mout_addr_ram) 
					   | (IData)((IData)(
							     ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD)
							       ? vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0
							       : 0U))));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram = (VL_ULL(0xffffffff) 
					   & vlTOPp->icrc_tb__DOT__Mout_addr_ram);
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1)) 
	   | (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1)) 
	   | (0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
				       >> 0x20U)))) 
	      << 0x20U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff00000000) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | (IData)((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
	= ((VL_ULL(0xffffffff) & vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr) 
	   | ((QData)((IData)((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr 
				       >> 0x20U)))) 
	      << 0x20U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:586
    vlTOPp->icrc_tb__DOT__mask = ((0xffff0000U & vlTOPp->icrc_tb__DOT__mask) 
				  | (0xffffU & ((1U 
						 & (IData)(vlTOPp->icrc_tb__DOT__Mout_we_ram_queue_curr))
						 ? 
						(((IData)(1U) 
						  << 
						  (0x1fU 
						   & vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr)) 
						 - (IData)(1U))
						 : 0U)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:598
    vlTOPp->icrc_tb__DOT__mask = ((0xffffU & vlTOPp->icrc_tb__DOT__mask) 
				  | (0xffff0000U & 
				     (((2U & (IData)(vlTOPp->icrc_tb__DOT__Mout_we_ram_queue_curr))
				        ? (((IData)(1U) 
					    << (0x1fU 
						& (vlTOPp->icrc_tb__DOT__Mout_data_ram_size_queue_curr 
						   >> 5U))) 
					   - (IData)(1U))
				        : 0U) << 0x10U)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:527
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U] 
	= (IData)((((QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[3U])) 
		    << 0x20U) | (QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[2U]))));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U] 
	= (IData)(((((QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[3U])) 
		     << 0x20U) | (QData)((IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_next[2U]))) 
		   >> 0x20U));
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[0U] 
	= (IData)(vlTOPp->icrc_tb__DOT__Mout_addr_ram);
    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[1U] 
	= (IData)((vlTOPp->icrc_tb__DOT__Mout_addr_ram 
		   >> 0x20U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945 
	= (0xffU & (((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1) 
		     << 4U) | ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1) 
			       >> 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xffU & (IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
			       >> 1U))));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xff00U & ((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
				  >> 0x21U)) << 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a)) 
	   | (0xff00U & ((IData)((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr 
				  >> 0x20U)) << 8U)));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:623
    vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp = ((0xffff0000U 
					       & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp) 
					      | (((vlTOPp->icrc_tb__DOT__base_addr 
						   <= 
						   vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U]) 
						  & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U] 
						     < 
						     ((IData)(0x400U) 
						      + vlTOPp->icrc_tb__DOT__base_addr)))
						  ? 
						 ((vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						   [
						   (0x3ffU 
						    & (((IData)(1U) 
							+ 
							vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U]) 
						       - vlTOPp->icrc_tb__DOT__base_addr))] 
						   << 8U) 
						  | vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						  [
						  (0x3ffU 
						   & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[2U] 
						      - vlTOPp->icrc_tb__DOT__base_addr))])
						  : 0U));
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:629
    vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp = ((0xffffU 
					       & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp) 
					      | ((((vlTOPp->icrc_tb__DOT__base_addr 
						    <= 
						    vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U]) 
						   & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U] 
						      < 
						      ((IData)(0x400U) 
						       + vlTOPp->icrc_tb__DOT__base_addr)))
						   ? 
						  ((vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						    [
						    (0x3ffU 
						     & (((IData)(1U) 
							 + 
							 vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U]) 
							- vlTOPp->icrc_tb__DOT__base_addr))] 
						    << 8U) 
						   | vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
						   [
						   (0x3ffU 
						    & (vlTOPp->icrc_tb__DOT__Mout_addr_ram_queue_curr[3U] 
						       - vlTOPp->icrc_tb__DOT__base_addr))])
						   : 0U) 
						 << 0x10U));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated)) 
	   | ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945) 
	      << 8U));
    vlTOPp->icrc_tb__DOT__M_Rdata_ram = ((0xffff0000U 
					  & vlTOPp->icrc_tb__DOT__M_Rdata_ram) 
					 | (0xffffU 
					    & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp));
    vlTOPp->icrc_tb__DOT__M_Rdata_ram = ((0xffffU & vlTOPp->icrc_tb__DOT__M_Rdata_ram) 
					 | (0xffff0000U 
					    & vlTOPp->icrc_tb__DOT__M_Rdata_ram_temp));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1 
	= ((0xff00U & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1)) 
	   | (0xffU & vlTOPp->icrc_tb__DOT__M_Rdata_ram));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1 
	= ((0xffU & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1)) 
	   | (0xff00U & (vlTOPp->icrc_tb__DOT__M_Rdata_ram 
			 >> 8U)));
    vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441 
	= (0xfffffffeU & (((vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_8__DOT__reg_out1 
			    >> 1U) + (0xffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_30__DOT__reg_out1) 
					       ^ (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1)))) 
			  << 1U));
}

VL_INLINE_OPT void Vicrc_tb::_sequent__TOP__5(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_sequent__TOP__5\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:868
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1) {
	vlTOPp->icrc_tb__DOT__endTime = VL_TIME_Q();
	vlTOPp->icrc_tb__DOT__sim_time = VL_EXTENDS_QI(64,32, 
						       VL_RTOI_I_D(
								   VL_ITOR_D_I(
									       ((((QData)((IData)(1U)) 
										+ vlTOPp->icrc_tb__DOT__endTime) 
										- vlTOPp->icrc_tb__DOT__startTime) 
										>> 1U))));
	vlTOPp->icrc_tb__DOT__success = 1U;
	vlTOPp->icrc_tb__DOT__compare_outputs = 0U;
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:691
    if (VL_UNLIKELY(vlTOPp->icrc_tb__DOT__start_results_comparison)) {
	vlTOPp->icrc_tb__DOT___i_ = 0U;
	while ((((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		 | (0xaU == vlTOPp->icrc_tb__DOT___ch_)) 
		| (0x6fU == vlTOPp->icrc_tb__DOT___ch_))) {
	    if ((0x6fU == vlTOPp->icrc_tb__DOT___ch_)) {
		vlTOPp->icrc_tb__DOT__compare_outputs = 1U;
		vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
							 8,
							 &(vlTOPp->icrc_tb__DOT__ex_lin)) ;
		if (VL_UNLIKELY((1U != vlTOPp->icrc_tb__DOT___r_))) {
		    VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
			      8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
		    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		    VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",710,"");
		}
		if ((vlTOPp->icrc_tb__DOT___bambu_testbench_mem_
		     [(0x3ffU & ((vlTOPp->icrc_tb__DOT__lin 
				  - vlTOPp->icrc_tb__DOT__base_addr) 
				 + vlTOPp->icrc_tb__DOT___i_))] 
		     != (IData)(vlTOPp->icrc_tb__DOT__ex_lin))) {
		    vlTOPp->icrc_tb__DOT__success = 0U;
		}
		vlTOPp->icrc_tb__DOT___i_ = ((IData)(1U) 
					     + vlTOPp->icrc_tb__DOT___i_);
		vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    } else {
		vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
		vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    }
	}
	if (VL_LIKELY((0x65U == vlTOPp->icrc_tb__DOT___ch_))) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	} else {
	    VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
		      8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
	    VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",737,"");
	}
	vlTOPp->icrc_tb__DOT___i_ = 0U;
	while ((((0x2fU == vlTOPp->icrc_tb__DOT___ch_) 
		 | (0xaU == vlTOPp->icrc_tb__DOT___ch_)) 
		| (0x6fU == vlTOPp->icrc_tb__DOT___ch_))) {
	    if (VL_UNLIKELY((0x6fU == vlTOPp->icrc_tb__DOT___ch_))) {
		vlTOPp->icrc_tb__DOT___i_ = ((IData)(1U) 
					     + vlTOPp->icrc_tb__DOT___i_);
		vlTOPp->icrc_tb__DOT__compare_outputs = 1U;
		vlTOPp->icrc_tb__DOT___r_ = VL_FSCANF_IX(vlTOPp->icrc_tb__DOT__file,"%b\n",
							 16,
							 &(vlTOPp->icrc_tb__DOT__ex_return_port)) ;
		if (VL_UNLIKELY((1U != vlTOPp->icrc_tb__DOT___r_))) {
		    VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
			      8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
		    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
		    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
		    VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",752,"");
		}
		VL_WRITEF(" return_port = %5#   expected = %5# \n\n",
			  16,vlTOPp->icrc_tb__DOT__registered_return_port,
			  16,(IData)(vlTOPp->icrc_tb__DOT__ex_return_port));
		if (((IData)(vlTOPp->icrc_tb__DOT__registered_return_port) 
		     != (IData)(vlTOPp->icrc_tb__DOT__ex_return_port))) {
		    vlTOPp->icrc_tb__DOT__success = 0U;
		}
		vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    } else {
		vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
		vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	    }
	}
	if (VL_LIKELY((0x65U == vlTOPp->icrc_tb__DOT___ch_))) {
	    vlTOPp->icrc_tb__DOT___r_ = VL_FGETS_IXI(8001, &(vlTOPp->icrc_tb__DOT__line), vlTOPp->icrc_tb__DOT__file);
	    vlTOPp->icrc_tb__DOT___ch_ = (vlTOPp->icrc_tb__DOT__file ? fgetc(VL_CVT_I_FP(vlTOPp->icrc_tb__DOT__file)) : -1);
	} else {
	    VL_WRITEF("ERROR - Unknown error while reading the file. Character found: %c\n",
		      8,(0xffU & vlTOPp->icrc_tb__DOT___ch_));
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__res_file); vlTOPp->icrc_tb__DOT__res_file=0;
	    VL_FCLOSE_I(vlTOPp->icrc_tb__DOT__file); vlTOPp->icrc_tb__DOT__file=0;
	    VL_FINISH_MT("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v",783,"");
	}
	if (VL_LIKELY(vlTOPp->icrc_tb__DOT__compare_outputs)) {
	    VL_WRITEF("Simulation ended after %20# cycles.\n\n",
		      64,vlTOPp->icrc_tb__DOT__sim_time);
	    if (vlTOPp->icrc_tb__DOT__success) {
		VL_WRITEF("Simulation completed with success\n\n");
		VL_FWRITEF(vlTOPp->icrc_tb__DOT__res_file,"1\t");
	    } else {
		VL_WRITEF("Simulation FAILED\n\n");
		VL_FWRITEF(vlTOPp->icrc_tb__DOT__res_file,"0\t");
	    }
	} else {
	    VL_WRITEF("Simulation ended after %20# cycles (no expected outputs specified).\n\n",
		      64,vlTOPp->icrc_tb__DOT__sim_time);
	    VL_FWRITEF(vlTOPp->icrc_tb__DOT__res_file,"-\t");
	}
	VL_FWRITEF(vlTOPp->icrc_tb__DOT__res_file,"%20#\n",
		   64,vlTOPp->icrc_tb__DOT__sim_time);
    }
    // ALWAYS at /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/testbench_icrc_tb.v:684
    if (vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1) {
	vlTOPp->icrc_tb__DOT__registered_return_port 
	    = (0xffffU & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_1)
			   ? ((VL_EXTENDS_II(16,9, 
					     (0xffU 
					      & ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1) 
						 >> 8U))) 
			       << 8U) | VL_EXTENDS_II(16,9, 
						      (0xffU 
						       & (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1))))
			   : ((IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_0)
			       ? (IData)(vlTOPp->icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1)
			       : (IData)(vlTOPp->icrc_tb__DOT__crc))));
    }
}

void Vicrc_tb::_eval(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_eval\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
	vlTOPp->_sequent__TOP__3(vlSymsp);
	vlTOPp->_sequent__TOP__4(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->clock)) & (IData)(vlTOPp->__Vclklast__TOP__clock))) {
	vlTOPp->_sequent__TOP__5(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

void Vicrc_tb::_eval_initial(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_eval_initial\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_initial__TOP__1(vlSymsp);
}

void Vicrc_tb::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::final\n"); );
    // Variables
    Vicrc_tb__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vicrc_tb::_eval_settle(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_eval_settle\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__2(vlSymsp);
}

VL_INLINE_OPT QData Vicrc_tb::_change_request(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_change_request\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData Vicrc_tb::_change_request_1(Vicrc_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_change_request_1\n"); );
    Vicrc_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vicrc_tb::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
	Verilated::overWidthError("clock");}
}
#endif // VL_DEBUG

void Vicrc_tb::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vicrc_tb::_ctor_var_reset\n"); );
    // Body
    clock = 0;
    icrc_tb__DOT__startTime = 0;
    icrc_tb__DOT__endTime = 0;
    icrc_tb__DOT__sim_time = 0;
    icrc_tb__DOT__res_file = 0;
    icrc_tb__DOT__file = 0;
    icrc_tb__DOT___r_ = 0;
    icrc_tb__DOT___n_ = 0;
    icrc_tb__DOT___i_ = 0;
    icrc_tb__DOT___addr_i_ = 0;
    icrc_tb__DOT___ch_ = 0;
    icrc_tb__DOT__compare_outputs = 0;
    icrc_tb__DOT__success = 0;
    VL_ZERO_RESET_W(8001,icrc_tb__DOT__line);
    icrc_tb__DOT__addr = 0;
    icrc_tb__DOT__base_addr = 0;
    { int __Vi0=0; for (; __Vi0<1024; ++__Vi0) {
	    icrc_tb__DOT___bambu_testbench_mem_[__Vi0] = 0;
    }}
    icrc_tb__DOT___bambu_databyte_ = 0;
    icrc_tb__DOT_____05Fstate = 0;
    icrc_tb__DOT_____05Fnext_state = 0;
    icrc_tb__DOT__start_results_comparison = 0;
    icrc_tb__DOT__next_start_port = 0;
    icrc_tb__DOT__currTime = 0;
    icrc_tb__DOT__reset = 0;
    icrc_tb__DOT__start_port = 0;
    icrc_tb__DOT__crc = 0;
    icrc_tb__DOT__lin = 0;
    icrc_tb__DOT__ex_lin = 0;
    icrc_tb__DOT__len = 0;
    icrc_tb__DOT__jinit = 0;
    icrc_tb__DOT__jrev = 0;
    icrc_tb__DOT__M_Rdata_ram = 0;
    icrc_tb__DOT__ex_return_port = 0;
    icrc_tb__DOT__registered_return_port = 0;
    icrc_tb__DOT__Mout_addr_ram = 0;
    icrc_tb__DOT__Mout_Wdata_ram = 0;
    icrc_tb__DOT__Mout_data_ram_size = 0;
    { int __Vi0=0; for (; __Vi0<2; ++__Vi0) {
	    icrc_tb__DOT__reg_DataReady[__Vi0] = 0;
    }}
    icrc_tb__DOT__mask = 0;
    icrc_tb__DOT__M_Rdata_ram_temp = 0;
    icrc_tb__DOT__Mout_we_ram_queue_curr = 0;
    VL_ZERO_RESET_W(128,icrc_tb__DOT__Mout_addr_ram_queue_next);
    VL_ZERO_RESET_W(128,icrc_tb__DOT__Mout_addr_ram_queue_curr);
    icrc_tb__DOT__Mout_Wdata_ram_queue_curr = 0;
    icrc_tb__DOT__Mout_data_ram_size_queue_next = 0;
    icrc_tb__DOT__Mout_data_ram_size_queue_curr = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG_signal_in = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__fuselector_BMEMORY_CTRLN_118_i0_LOAD = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_134_gimple_return_FU_52_i0_0_0_1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_185_reg_0_0_0_1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_196_reg_19_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_198_reg_20_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_199_reg_21_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_200_reg_22_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_206_reg_28_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_207_reg_29_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_213_reg_34_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_214_reg_35_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_0_1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_220_reg_40_0_1_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_10 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_11 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_12 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_13 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_14 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_15 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_16 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_17 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_18 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_19 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_2 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_20 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_21 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_22 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_23 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_24 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_25 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_26 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_27 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_28 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_29 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_3 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_31 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_32 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_34 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_35 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_36 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_37 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_38 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_4 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_40 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_5 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_6 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_7 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_8 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__wrenable_reg_9 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___present_state = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Controller_i__DOT___next_state = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_198_reg_20_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_199_reg_21_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_200_reg_22_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_206_reg_28_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_213_reg_34_0_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__BMEMORY_CTRLN_118_i0__out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33827_0__out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33854_0__out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33935_0__in2 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33935_0__out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellinp__array_33965_0__in2 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT____Vcellout__array_33965_0__out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__bram_write = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory_addr_a = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__din_value_aggregated = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__dout_a = 0;
    { int __Vi0=0; for (; __Vi0<1; ++__Vi0) {
	    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory[__Vi0] = 0;
    }}
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT____Vlvbound2 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr = 0;
    { int __Vi0=0; for (; __Vi0<256; ++__Vi0) {
	    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[__Vi0] = 0;
    }}
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__bram_write = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory_addr_a = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__din_value_aggregated = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__dout_a = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__tmp_addr = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__relative_addr = 0;
    { int __Vi0=0; for (; __Vi0<256; ++__Vi0) {
	    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory[__Vi0] = 0;
    }}
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory_addr_a = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__dout_a = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__tmp_addr = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__relative_addr = 0;
    { int __Vi0=0; for (; __Vi0<16; ++__Vi0) {
	    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33965_0__DOT__memory[__Vi0] = 0;
    }}
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__cleaned_in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34573__DOT__in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__cleaned_in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34593__DOT__in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__cleaned_in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34597__DOT__in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__cleaned_in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34603__DOT__in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__cleaned_in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__fu_icrc_33779_34606__DOT__in0 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_0__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_10__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_11__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_12__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_13__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_14__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_15__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_16__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_17__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_18__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_19__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_2__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_20__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_21__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_22__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_23__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_24__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_25__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_26__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_27__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_28__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_29__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_3__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_30__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_31__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_32__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_33__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_34__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_35__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_36__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_37__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_38__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_39__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_4__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_40__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_5__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_6__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_7__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_8__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__reg_9__DOT__reg_out1 = 0;
    icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__done_delayed_REG__DOT__reg_out1 = 0;
    __Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v0 = 0;
    __Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33827_0__DOT__memory__v1 = 0;
    __Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0;
    __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0;
    __Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0;
    __Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0;
    __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0;
    __Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33854_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0;
    __Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0;
    __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0;
    __Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v0 = 0;
    __Vdlyvdim0__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0;
    __Vdlyvval__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0;
    __Vdlyvset__icrc_tb__DOT__icrc__DOT___icrc_i0__DOT__Datapath_i__DOT__array_33935_0__DOT__ARRAY_1D_STD_BRAM_NN_instance__DOT__memory__v1 = 0;
    __Vclklast__TOP__clock = 0;
}
