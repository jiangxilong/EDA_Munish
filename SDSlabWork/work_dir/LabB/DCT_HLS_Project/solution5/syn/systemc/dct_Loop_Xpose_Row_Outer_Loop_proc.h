// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.3
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ===========================================================

#ifndef _dct_Loop_Xpose_Row_Outer_Loop_proc_HH_
#define _dct_Loop_Xpose_Row_Outer_Loop_proc_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct dct_Loop_Xpose_Row_Outer_Loop_proc : public sc_module {
    // Port declarations 14
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_lv<6> > row_outbuf_address0;
    sc_out< sc_logic > row_outbuf_ce0;
    sc_in< sc_lv<16> > row_outbuf_q0;
    sc_out< sc_lv<6> > col_inbuf_address0;
    sc_out< sc_logic > col_inbuf_ce0;
    sc_out< sc_logic > col_inbuf_we0;
    sc_out< sc_lv<16> > col_inbuf_d0;


    // Module declarations
    dct_Loop_Xpose_Row_Outer_Loop_proc(sc_module_name name);
    SC_HAS_PROCESS(dct_Loop_Xpose_Row_Outer_Loop_proc);

    ~dct_Loop_Xpose_Row_Outer_Loop_proc();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<2> > ap_CS_fsm;
    sc_signal< sc_lv<7> > indvar_flatten_reg_67;
    sc_signal< sc_lv<4> > j_0_i_reg_78;
    sc_signal< sc_lv<4> > i_1_i_reg_89;
    sc_signal< sc_lv<1> > exitcond_flatten_fu_101_p2;
    sc_signal< sc_lv<1> > exitcond_flatten_reg_197;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it0;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it1;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it2;
    sc_signal< sc_lv<1> > ap_reg_ppstg_exitcond_flatten_reg_197_pp0_it1;
    sc_signal< sc_lv<7> > indvar_flatten_next_fu_107_p2;
    sc_signal< sc_lv<4> > i_1_i_mid2_fu_119_p3;
    sc_signal< sc_lv<4> > i_1_i_mid2_reg_206;
    sc_signal< sc_lv<4> > ap_reg_ppstg_i_1_i_mid2_reg_206_pp0_it1;
    sc_signal< sc_lv<4> > j_0_i_mid2_fu_133_p3;
    sc_signal< sc_lv<4> > j_0_i_mid2_reg_212;
    sc_signal< sc_lv<4> > ap_reg_ppstg_j_0_i_mid2_reg_212_pp0_it1;
    sc_signal< sc_lv<4> > i_fu_141_p2;
    sc_signal< bool > ap_sig_bdd_76;
    sc_signal< sc_lv<4> > j_0_i_phi_fu_82_p4;
    sc_signal< sc_lv<64> > tmp_s_fu_167_p1;
    sc_signal< sc_lv<64> > tmp_18_fu_192_p1;
    sc_signal< sc_lv<1> > exitcond5_i8_fu_113_p2;
    sc_signal< sc_lv<4> > j6_fu_127_p2;
    sc_signal< sc_lv<7> > tmp_fu_150_p3;
    sc_signal< sc_lv<8> > p_addr_cast_fu_157_p1;
    sc_signal< sc_lv<8> > tmp_trn_cast_fu_147_p1;
    sc_signal< sc_lv<8> > p_addr1_fu_161_p2;
    sc_signal< sc_lv<7> > tmp_17_fu_175_p3;
    sc_signal< sc_lv<8> > p_addr4_cast_fu_182_p1;
    sc_signal< sc_lv<8> > tmp_8_trn_cast_fu_172_p1;
    sc_signal< sc_lv<8> > p_addr5_fu_186_p2;
    sc_signal< sc_lv<2> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<2> ap_ST_st1_fsm_0;
    static const sc_lv<2> ap_ST_pp0_stg0_fsm_1;
    static const sc_lv<2> ap_ST_st5_fsm_2;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<7> ap_const_lv7_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<7> ap_const_lv7_40;
    static const sc_lv<7> ap_const_lv7_1;
    static const sc_lv<4> ap_const_lv4_8;
    static const sc_lv<4> ap_const_lv4_1;
    static const sc_lv<3> ap_const_lv3_0;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_sig_bdd_76();
    void thread_col_inbuf_address0();
    void thread_col_inbuf_ce0();
    void thread_col_inbuf_d0();
    void thread_col_inbuf_we0();
    void thread_exitcond5_i8_fu_113_p2();
    void thread_exitcond_flatten_fu_101_p2();
    void thread_i_1_i_mid2_fu_119_p3();
    void thread_i_fu_141_p2();
    void thread_indvar_flatten_next_fu_107_p2();
    void thread_j6_fu_127_p2();
    void thread_j_0_i_mid2_fu_133_p3();
    void thread_j_0_i_phi_fu_82_p4();
    void thread_p_addr1_fu_161_p2();
    void thread_p_addr4_cast_fu_182_p1();
    void thread_p_addr5_fu_186_p2();
    void thread_p_addr_cast_fu_157_p1();
    void thread_row_outbuf_address0();
    void thread_row_outbuf_ce0();
    void thread_tmp_17_fu_175_p3();
    void thread_tmp_18_fu_192_p1();
    void thread_tmp_8_trn_cast_fu_172_p1();
    void thread_tmp_fu_150_p3();
    void thread_tmp_s_fu_167_p1();
    void thread_tmp_trn_cast_fu_147_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
