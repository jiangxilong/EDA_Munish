// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.3
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ==============================================================

#include "dct_2d_col_inbuf.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

void dct_2d_col_inbuf::proc_mem_q()
{
    sc_lv<2 * DataWidth> tmp = mem_q.read();
    sc_lv<DataWidth> tmp0 = tmp(2 * DataWidth - 1, 1 * DataWidth);
    q0.write(tmp0);

    sc_lv<DataWidth> tmp1 = tmp(1 * DataWidth - 1, 0 * DataWidth);
    q1.write(tmp1);

}


void dct_2d_col_inbuf::proc_mem_ra()
{
    sc_lv<2 * AddressWidth> tmp;
    tmp = (address0.read(), address1.read());
    mem_ra.write(tmp);
}


void dct_2d_col_inbuf::proc_mem_ce()
{
    sc_lv<2> tmp;
    tmp[1] = ce0.read();
    tmp[0] = ce1.read();
    mem_ce.write(tmp);
}


void dct_2d_col_inbuf::proc_mem_wa()
{
    sc_lv<1 * AddressWidth> tmp;
    tmp = (address0.read());
    mem_wa.write(tmp);
}


void dct_2d_col_inbuf::proc_mem_we()
{
    sc_lv<1> tmp;
    tmp[0] = we0.read();
    mem_we.write(tmp);
}


void dct_2d_col_inbuf::proc_mem_d()
{
    sc_lv<1 * DataWidth> tmp;
    tmp = (d0.read());
    mem_d.write(tmp);
}


void dct_2d_col_inbuf::proc_op()
{
    __re__[0].write(ce0.read() & ~we0.read());
    __we__[0].write(ce0.read() & we0.read());
    __re__[1].write(ce1.read());
    __we__[1].write((sc_logic)0);
}


void dct_2d_col_inbuf::proc_addr()
{
    __addr__[0].write(address0.read().to_uint());
    __addr__[1].write(address1.read().to_uint());
}


// check collision
void dct_2d_col_inbuf::proc_check()
{
    int f = 0;
    for (int i = 0; i < 1; i++) {
        for (int j = i + 1; j < 2; j++) {
            if (__addr__[i].read().to_uint() == __addr__[j].read().to_uint()) {
                if (__we__[i].read() == 1 && __we__[j].read() == 1) {
                    cerr << "Warning: collision occurred." << endl;
                    cerr << "    Port " << i << "  : write" << endl;
                    cerr << "    Port " << j << "  : write" << endl;
                    cerr << "    Address : " << __addr__[i].read().to_uint() << endl;
                    f = 1;
                } else if (__we__[i].read() == 1 && __re__[j].read() == 1) {
                    cerr << "Warning: collision occurred." << endl;
                    cerr << "    Port " << i << "  : write" << endl;
                    cerr << "    Port " << j << "  : read" << endl;
                    cerr << "    Address : " << __addr__[i].read().to_uint() << endl;
                    f = 1;
                } else if (__re__[i].read() == 1 && __we__[j].read() == 1) {
                    cerr << "Warning: collision occurred." << endl;
                    cerr << "    Port " << i << "  : read" << endl;
                    cerr << "    Port " << j << "  : write" << endl;
                    cerr << "    Address : " << __addr__[i].read().to_uint() << endl;
                    f = 1;
                }
                if (f) {
                    // SC_REPORT_FATAL(1001, "collion occured.");
                }
            }
        }
    }
}
