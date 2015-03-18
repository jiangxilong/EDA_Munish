// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.3
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ===========================================================

#include "write_data.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic write_data::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic write_data::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<2> write_data::ap_ST_st1_fsm_0 = "00";
const sc_lv<2> write_data::ap_ST_pp0_stg0_fsm_1 = "1";
const sc_lv<2> write_data::ap_ST_st5_fsm_2 = "10";
const sc_lv<1> write_data::ap_const_lv1_0 = "0";
const sc_lv<7> write_data::ap_const_lv7_0 = "0000000";
const sc_lv<4> write_data::ap_const_lv4_0 = "0000";
const sc_lv<7> write_data::ap_const_lv7_40 = "1000000";
const sc_lv<7> write_data::ap_const_lv7_1 = "1";
const sc_lv<4> write_data::ap_const_lv4_8 = "1000";
const sc_lv<4> write_data::ap_const_lv4_1 = "1";
const sc_lv<3> write_data::ap_const_lv3_0 = "000";

write_data::write_data(sc_module_name name) : sc_module(name), mVcdFile(0) {

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_bdd_76);
    sensitive << ( ap_start );
    sensitive << ( ap_done_reg );

    SC_METHOD(thread_buf_r_address0);
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_reg_ppiten_pp0_it1 );
    sensitive << ( tmp_4_fu_185_p1 );

    SC_METHOD(thread_buf_r_ce0);
    sensitive << ( ap_CS_fsm );
    sensitive << ( exitcond_flatten_reg_200 );
    sensitive << ( ap_reg_ppiten_pp0_it1 );

    SC_METHOD(thread_c_1_fu_130_p2);
    sensitive << ( c_mid2_fu_122_p3 );

    SC_METHOD(thread_c_cast6_fu_161_p1);
    sensitive << ( c_mid2_reg_214 );

    SC_METHOD(thread_c_mid2_fu_122_p3);
    sensitive << ( c_reg_92 );
    sensitive << ( exitcond4_fu_116_p2 );

    SC_METHOD(thread_exitcond4_fu_116_p2);
    sensitive << ( ap_CS_fsm );
    sensitive << ( c_reg_92 );
    sensitive << ( exitcond_flatten_fu_104_p2 );
    sensitive << ( ap_reg_ppiten_pp0_it0 );

    SC_METHOD(thread_exitcond_flatten_fu_104_p2);
    sensitive << ( ap_CS_fsm );
    sensitive << ( indvar_flatten_reg_69 );
    sensitive << ( ap_reg_ppiten_pp0_it0 );

    SC_METHOD(thread_indvar_flatten_next_fu_110_p2);
    sensitive << ( indvar_flatten_reg_69 );

    SC_METHOD(thread_output_r_address0);
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_reg_ppiten_pp0_it2 );
    sensitive << ( tmp_3_fu_196_p1 );

    SC_METHOD(thread_output_r_ce0);
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_reg_ppiten_pp0_it2 );
    sensitive << ( ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 );

    SC_METHOD(thread_output_r_d0);
    sensitive << ( ap_CS_fsm );
    sensitive << ( buf_r_q0 );
    sensitive << ( ap_reg_ppiten_pp0_it2 );

    SC_METHOD(thread_output_r_we0);
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_reg_ppiten_pp0_it2 );
    sensitive << ( ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 );

    SC_METHOD(thread_p_addr1_fu_179_p2);
    sensitive << ( p_addr_cast_fu_175_p1 );
    sensitive << ( tmp_8_trn_cast_fu_164_p1 );

    SC_METHOD(thread_p_addr_cast_fu_175_p1);
    sensitive << ( tmp_1_fu_167_p3 );

    SC_METHOD(thread_r_mid2_fu_142_p3);
    sensitive << ( exitcond4_reg_209 );
    sensitive << ( r_phi_fu_84_p4 );
    sensitive << ( r_s_fu_136_p2 );

    SC_METHOD(thread_r_phi_fu_84_p4);
    sensitive << ( ap_CS_fsm );
    sensitive << ( r_reg_80 );
    sensitive << ( ap_reg_ppiten_pp0_it2 );
    sensitive << ( ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 );
    sensitive << ( r_mid2_reg_225 );

    SC_METHOD(thread_r_s_fu_136_p2);
    sensitive << ( r_phi_fu_84_p4 );

    SC_METHOD(thread_tmp_1_fu_167_p3);
    sensitive << ( r_mid2_fu_142_p3 );

    SC_METHOD(thread_tmp_3_fu_196_p1);
    sensitive << ( tmp_9_reg_235 );

    SC_METHOD(thread_tmp_4_fu_185_p1);
    sensitive << ( p_addr1_fu_179_p2 );

    SC_METHOD(thread_tmp_8_trn_cast_fu_164_p1);
    sensitive << ( c_mid2_reg_214 );

    SC_METHOD(thread_tmp_9_fu_190_p2);
    sensitive << ( tmp_s_fu_153_p3 );
    sensitive << ( c_cast6_fu_161_p1 );

    SC_METHOD(thread_tmp_fu_149_p1);
    sensitive << ( r_mid2_fu_142_p3 );

    SC_METHOD(thread_tmp_s_fu_153_p3);
    sensitive << ( tmp_fu_149_p1 );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_CS_fsm );
    sensitive << ( exitcond_flatten_fu_104_p2 );
    sensitive << ( ap_reg_ppiten_pp0_it0 );
    sensitive << ( ap_reg_ppiten_pp0_it1 );
    sensitive << ( ap_reg_ppiten_pp0_it2 );
    sensitive << ( ap_sig_bdd_76 );

    ap_done_reg = SC_LOGIC_0;
    ap_CS_fsm = "00";
    ap_reg_ppiten_pp0_it0 = SC_LOGIC_0;
    ap_reg_ppiten_pp0_it1 = SC_LOGIC_0;
    ap_reg_ppiten_pp0_it2 = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "write_data_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    const char* dump_vcd = std::getenv("AP_WRITE_VCD");
    if (dump_vcd && string(dump_vcd) == "1" ) {
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_continue, "(port)ap_continue");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, buf_r_address0, "(port)buf_r_address0");
    sc_trace(mVcdFile, buf_r_ce0, "(port)buf_r_ce0");
    sc_trace(mVcdFile, buf_r_q0, "(port)buf_r_q0");
    sc_trace(mVcdFile, output_r_address0, "(port)output_r_address0");
    sc_trace(mVcdFile, output_r_ce0, "(port)output_r_ce0");
    sc_trace(mVcdFile, output_r_we0, "(port)output_r_we0");
    sc_trace(mVcdFile, output_r_d0, "(port)output_r_d0");
    sc_trace(mVcdFile, ap_done_reg, "ap_done_reg");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, indvar_flatten_reg_69, "indvar_flatten_reg_69");
    sc_trace(mVcdFile, r_reg_80, "r_reg_80");
    sc_trace(mVcdFile, c_reg_92, "c_reg_92");
    sc_trace(mVcdFile, exitcond_flatten_fu_104_p2, "exitcond_flatten_fu_104_p2");
    sc_trace(mVcdFile, exitcond_flatten_reg_200, "exitcond_flatten_reg_200");
    sc_trace(mVcdFile, ap_reg_ppiten_pp0_it0, "ap_reg_ppiten_pp0_it0");
    sc_trace(mVcdFile, ap_reg_ppiten_pp0_it1, "ap_reg_ppiten_pp0_it1");
    sc_trace(mVcdFile, ap_reg_ppiten_pp0_it2, "ap_reg_ppiten_pp0_it2");
    sc_trace(mVcdFile, ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1, "ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1");
    sc_trace(mVcdFile, indvar_flatten_next_fu_110_p2, "indvar_flatten_next_fu_110_p2");
    sc_trace(mVcdFile, exitcond4_fu_116_p2, "exitcond4_fu_116_p2");
    sc_trace(mVcdFile, exitcond4_reg_209, "exitcond4_reg_209");
    sc_trace(mVcdFile, c_mid2_fu_122_p3, "c_mid2_fu_122_p3");
    sc_trace(mVcdFile, c_mid2_reg_214, "c_mid2_reg_214");
    sc_trace(mVcdFile, c_1_fu_130_p2, "c_1_fu_130_p2");
    sc_trace(mVcdFile, r_mid2_fu_142_p3, "r_mid2_fu_142_p3");
    sc_trace(mVcdFile, r_mid2_reg_225, "r_mid2_reg_225");
    sc_trace(mVcdFile, tmp_9_fu_190_p2, "tmp_9_fu_190_p2");
    sc_trace(mVcdFile, tmp_9_reg_235, "tmp_9_reg_235");
    sc_trace(mVcdFile, ap_sig_bdd_76, "ap_sig_bdd_76");
    sc_trace(mVcdFile, r_phi_fu_84_p4, "r_phi_fu_84_p4");
    sc_trace(mVcdFile, tmp_4_fu_185_p1, "tmp_4_fu_185_p1");
    sc_trace(mVcdFile, tmp_3_fu_196_p1, "tmp_3_fu_196_p1");
    sc_trace(mVcdFile, r_s_fu_136_p2, "r_s_fu_136_p2");
    sc_trace(mVcdFile, tmp_fu_149_p1, "tmp_fu_149_p1");
    sc_trace(mVcdFile, tmp_1_fu_167_p3, "tmp_1_fu_167_p3");
    sc_trace(mVcdFile, p_addr_cast_fu_175_p1, "p_addr_cast_fu_175_p1");
    sc_trace(mVcdFile, tmp_8_trn_cast_fu_164_p1, "tmp_8_trn_cast_fu_164_p1");
    sc_trace(mVcdFile, p_addr1_fu_179_p2, "p_addr1_fu_179_p2");
    sc_trace(mVcdFile, tmp_s_fu_153_p3, "tmp_s_fu_153_p3");
    sc_trace(mVcdFile, c_cast6_fu_161_p1, "c_cast6_fu_161_p1");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");

    }
}

write_data::~write_data() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

}

void write_data::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_st1_fsm_0;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_done_reg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_continue.read())) {
            ap_done_reg = ap_const_logic_0;
        } else if (esl_seteq<1,2,2>(ap_ST_st5_fsm_2, ap_CS_fsm.read())) {
            ap_done_reg = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_reg_ppiten_pp0_it0 = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
             !esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0))) {
            ap_reg_ppiten_pp0_it0 = ap_const_logic_0;
        } else if ((esl_seteq<1,2,2>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                    !ap_sig_bdd_76.read())) {
            ap_reg_ppiten_pp0_it0 = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_reg_ppiten_pp0_it1 = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
             esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0))) {
            ap_reg_ppiten_pp0_it1 = ap_const_logic_1;
        } else if (((esl_seteq<1,2,2>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                     !ap_sig_bdd_76.read()) || 
                    (esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
                     !esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0)))) {
            ap_reg_ppiten_pp0_it1 = ap_const_logic_0;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_reg_ppiten_pp0_it2 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read())) {
            ap_reg_ppiten_pp0_it2 = ap_reg_ppiten_pp0_it1.read();
        } else if ((esl_seteq<1,2,2>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                    !ap_sig_bdd_76.read())) {
            ap_reg_ppiten_pp0_it2 = ap_const_logic_0;
        }
    }
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it0.read()) && 
         esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0))) {
        c_reg_92 = c_1_fu_130_p2.read();
    } else if ((esl_seteq<1,2,2>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                !ap_sig_bdd_76.read())) {
        c_reg_92 = ap_const_lv4_0;
    }
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it0.read()) && 
         esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0))) {
        indvar_flatten_reg_69 = indvar_flatten_next_fu_110_p2.read();
    } else if ((esl_seteq<1,2,2>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                !ap_sig_bdd_76.read())) {
        indvar_flatten_reg_69 = ap_const_lv7_0;
    }
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it2.read()) && 
         esl_seteq<1,1,1>(ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1.read(), ap_const_lv1_0))) {
        r_reg_80 = r_mid2_reg_225.read();
    } else if ((esl_seteq<1,2,2>(ap_ST_st1_fsm_0, ap_CS_fsm.read()) && 
                !ap_sig_bdd_76.read())) {
        r_reg_80 = ap_const_lv4_0;
    }
    if (esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read())) {
        ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 = exitcond_flatten_reg_200.read();
    }
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it0.read()) && esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0))) {
        c_mid2_reg_214 = c_mid2_fu_122_p3.read();
        exitcond4_reg_209 = exitcond4_fu_116_p2.read();
    }
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it0.read()))) {
        exitcond_flatten_reg_200 = exitcond_flatten_fu_104_p2.read();
    }
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it1.read()) && esl_seteq<1,1,1>(exitcond_flatten_reg_200.read(), ap_const_lv1_0))) {
        r_mid2_reg_225 = r_mid2_fu_142_p3.read();
        tmp_9_reg_235 = tmp_9_fu_190_p2.read();
    }
}

void write_data::thread_ap_done() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_done_reg.read()) || 
         esl_seteq<1,2,2>(ap_ST_st5_fsm_2, ap_CS_fsm.read()))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void write_data::thread_ap_idle() {
    if ((!esl_seteq<1,1,1>(ap_const_logic_1, ap_start.read()) && 
         esl_seteq<1,2,2>(ap_ST_st1_fsm_0, ap_CS_fsm.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void write_data::thread_ap_ready() {
    if (esl_seteq<1,2,2>(ap_ST_st5_fsm_2, ap_CS_fsm.read())) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void write_data::thread_ap_sig_bdd_76() {
    ap_sig_bdd_76 = (esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1));
}

void write_data::thread_buf_r_address0() {
    buf_r_address0 =  (sc_lv<6>) (tmp_4_fu_185_p1.read());
}

void write_data::thread_buf_r_ce0() {
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it1.read()) && 
         esl_seteq<1,1,1>(exitcond_flatten_reg_200.read(), ap_const_lv1_0))) {
        buf_r_ce0 = ap_const_logic_1;
    } else {
        buf_r_ce0 = ap_const_logic_0;
    }
}

void write_data::thread_c_1_fu_130_p2() {
    c_1_fu_130_p2 = (!c_mid2_fu_122_p3.read().is_01() || !ap_const_lv4_1.is_01())? sc_lv<4>(): (sc_bigint<4>(c_mid2_fu_122_p3.read()) + sc_biguint<4>(ap_const_lv4_1));
}

void write_data::thread_c_cast6_fu_161_p1() {
    c_cast6_fu_161_p1 = esl_zext<6,4>(c_mid2_reg_214.read());
}

void write_data::thread_c_mid2_fu_122_p3() {
    c_mid2_fu_122_p3 = (!exitcond4_fu_116_p2.read()[0].is_01())? sc_lv<4>(): ((exitcond4_fu_116_p2.read()[0].to_bool())? ap_const_lv4_0: c_reg_92.read());
}

void write_data::thread_exitcond4_fu_116_p2() {
    exitcond4_fu_116_p2 = (!c_reg_92.read().is_01() || !ap_const_lv4_8.is_01())? sc_lv<1>(): sc_lv<1>(c_reg_92.read() == ap_const_lv4_8);
}

void write_data::thread_exitcond_flatten_fu_104_p2() {
    exitcond_flatten_fu_104_p2 = (!indvar_flatten_reg_69.read().is_01() || !ap_const_lv7_40.is_01())? sc_lv<1>(): sc_lv<1>(indvar_flatten_reg_69.read() == ap_const_lv7_40);
}

void write_data::thread_indvar_flatten_next_fu_110_p2() {
    indvar_flatten_next_fu_110_p2 = (!indvar_flatten_reg_69.read().is_01() || !ap_const_lv7_1.is_01())? sc_lv<7>(): (sc_bigint<7>(indvar_flatten_reg_69.read()) + sc_biguint<7>(ap_const_lv7_1));
}

void write_data::thread_output_r_address0() {
    output_r_address0 =  (sc_lv<6>) (tmp_3_fu_196_p1.read());
}

void write_data::thread_output_r_ce0() {
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it2.read()) && 
         esl_seteq<1,1,1>(ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1.read(), ap_const_lv1_0))) {
        output_r_ce0 = ap_const_logic_1;
    } else {
        output_r_ce0 = ap_const_logic_0;
    }
}

void write_data::thread_output_r_d0() {
    output_r_d0 = buf_r_q0.read();
}

void write_data::thread_output_r_we0() {
    if (((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it2.read()) && 
          esl_seteq<1,1,1>(ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1.read(), ap_const_lv1_0)))) {
        output_r_we0 = ap_const_logic_1;
    } else {
        output_r_we0 = ap_const_logic_0;
    }
}

void write_data::thread_p_addr1_fu_179_p2() {
    p_addr1_fu_179_p2 = (!p_addr_cast_fu_175_p1.read().is_01() || !tmp_8_trn_cast_fu_164_p1.read().is_01())? sc_lv<8>(): (sc_bigint<8>(p_addr_cast_fu_175_p1.read()) + sc_biguint<8>(tmp_8_trn_cast_fu_164_p1.read()));
}

void write_data::thread_p_addr_cast_fu_175_p1() {
    p_addr_cast_fu_175_p1 = esl_zext<8,7>(tmp_1_fu_167_p3.read());
}

void write_data::thread_r_mid2_fu_142_p3() {
    r_mid2_fu_142_p3 = (!exitcond4_reg_209.read()[0].is_01())? sc_lv<4>(): ((exitcond4_reg_209.read()[0].to_bool())? r_s_fu_136_p2.read(): r_phi_fu_84_p4.read());
}

void write_data::thread_r_phi_fu_84_p4() {
    if ((esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it2.read()) && 
         esl_seteq<1,1,1>(ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1.read(), ap_const_lv1_0))) {
        r_phi_fu_84_p4 = r_mid2_reg_225.read();
    } else {
        r_phi_fu_84_p4 = r_reg_80.read();
    }
}

void write_data::thread_r_s_fu_136_p2() {
    r_s_fu_136_p2 = (!r_phi_fu_84_p4.read().is_01() || !ap_const_lv4_1.is_01())? sc_lv<4>(): (sc_bigint<4>(r_phi_fu_84_p4.read()) + sc_biguint<4>(ap_const_lv4_1));
}

void write_data::thread_tmp_1_fu_167_p3() {
    tmp_1_fu_167_p3 = esl_concat<4,3>(r_mid2_fu_142_p3.read(), ap_const_lv3_0);
}

void write_data::thread_tmp_3_fu_196_p1() {
    tmp_3_fu_196_p1 = esl_zext<64,6>(tmp_9_reg_235.read());
}

void write_data::thread_tmp_4_fu_185_p1() {
    tmp_4_fu_185_p1 = esl_zext<64,8>(p_addr1_fu_179_p2.read());
}

void write_data::thread_tmp_8_trn_cast_fu_164_p1() {
    tmp_8_trn_cast_fu_164_p1 = esl_zext<8,4>(c_mid2_reg_214.read());
}

void write_data::thread_tmp_9_fu_190_p2() {
    tmp_9_fu_190_p2 = (!tmp_s_fu_153_p3.read().is_01() || !c_cast6_fu_161_p1.read().is_01())? sc_lv<6>(): (sc_bigint<6>(tmp_s_fu_153_p3.read()) + sc_biguint<6>(c_cast6_fu_161_p1.read()));
}

void write_data::thread_tmp_fu_149_p1() {
    tmp_fu_149_p1 = r_mid2_fu_142_p3.read().range(3-1, 0);
}

void write_data::thread_tmp_s_fu_153_p3() {
    tmp_s_fu_153_p3 = esl_concat<3,3>(tmp_fu_149_p1.read(), ap_const_lv3_0);
}

void write_data::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint()) {
        case 0 : 
            if (!ap_sig_bdd_76.read()) {
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            } else {
                ap_NS_fsm = ap_ST_st1_fsm_0;
            }
            break;
        case 1 : 
            if ((!(esl_seteq<1,2,2>(ap_ST_pp0_stg0_fsm_1, ap_CS_fsm.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it2.read()) && !esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it1.read())) && !(esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it0.read()) && !esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0) && !esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it1.read())))) {
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it0.read()) && !esl_seteq<1,1,1>(exitcond_flatten_fu_104_p2.read(), ap_const_lv1_0) && !esl_seteq<1,1,1>(ap_const_logic_1, ap_reg_ppiten_pp0_it1.read()))) {
                ap_NS_fsm = ap_ST_st5_fsm_2;
            } else {
                ap_NS_fsm = ap_ST_st5_fsm_2;
            }
            break;
        case 2 : 
            ap_NS_fsm = ap_ST_st1_fsm_0;
            break;
        default : 
            ap_NS_fsm = "XX";
            break;
    }
}
}

