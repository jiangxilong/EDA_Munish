// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.3
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ==============================================================

// Port list: {  2 1  }


#ifndef _dct_buf_2d_in_memcore_H_
#define _dct_buf_2d_in_memcore_H_



#include <systemc>
#include <iostream>
#include <fstream>
#include "AESL_pkg.h"

template<unsigned int READ_PORT_COUNT = 1,
         unsigned int WRITE_PORT_COUNT = 1,
         unsigned int DATA_WIDTH = 8,
         unsigned int ADDRESS_WIDTH = 8,
         unsigned int WORD_COUNT = 256>
struct dct_buf_2d_in_memcore_core : public sc_core::sc_module
{
public:
    sc_core::sc_in< sc_dt::sc_lv< WRITE_PORT_COUNT*DATA_WIDTH > > d;
    sc_core::sc_out< sc_dt::sc_lv< READ_PORT_COUNT*DATA_WIDTH > > q;
    sc_core::sc_in < sc_dt::sc_lv< READ_PORT_COUNT*ADDRESS_WIDTH > > ra;
    sc_core::sc_in < sc_dt::sc_lv< READ_PORT_COUNT > > ce;
    sc_core::sc_in < sc_dt::sc_lv< WRITE_PORT_COUNT*ADDRESS_WIDTH > > wa;
    sc_core::sc_in < sc_dt::sc_lv< WRITE_PORT_COUNT > > we;
    sc_core::sc_in <sc_dt::sc_logic>  reset;
    sc_core::sc_in_clk  clk;

    SC_HAS_PROCESS(dct_buf_2d_in_memcore_core);
    dct_buf_2d_in_memcore_core(sc_core::sc_module_name) {
        mem = new sc_dt::sc_lv< DATA_WIDTH> [WORD_COUNT];

        SC_METHOD(proc_di);
        sensitive << d;

        SC_METHOD(proc_wai);
        sensitive << wa;

        SC_METHOD(proc_mem);
        sensitive << clk.pos();

        SC_METHOD(proc_rai);
        sensitive << ra;

        SC_METHOD(proc_rai_reg);
        sensitive << clk.pos();

        SC_METHOD(proc_qi);
        sensitive << clk;
        for (unsigned i = 0; i < READ_PORT_COUNT; i++) {
            sensitive << rai_reg[i];
        }

        SC_METHOD(proc_q);
        sensitive << qi;

    }


    void proc_di()
    {
        sc_dt::sc_lv<DATA_WIDTH> dt;
        for (unsigned i = 0; i < WRITE_PORT_COUNT; i++) {
            for (unsigned j = 0; j < DATA_WIDTH; j++) {
                dt.set_bit(j, d.read()[i * DATA_WIDTH + j].value());
            }
            di[i].write(dt);
        }
    }

    void proc_wai()
    {
        sc_dt::sc_lv<ADDRESS_WIDTH> wat;
        for (unsigned i = 0; i < WRITE_PORT_COUNT; i++) {
            for (unsigned j = 0; j < ADDRESS_WIDTH; j++) {
                wat.set_bit(j, wa.read()[i * ADDRESS_WIDTH + j].value());
            }
            wai[i].write(wat);
        }
    }


    void proc_mem()
    {
        for (unsigned j = 0; j < WRITE_PORT_COUNT; j++) {
          if (we.read().get_bit(j) == 1) {
            unsigned i = wai[j].read().to_uint();
            if (!wai[j].read().is_01() || i >= WORD_COUNT) {
               cerr << "In memory model " << name() << ", during a write cycle\n";
               if (!wai[j].read().is_01()) 
                 cerr << "ERROR: address is not stable =" << wai[j].read() << endl;
               else
                 cerr << "ERROR: Address " << i << " for port '" << j << "' is outside the legal range [0.."
                      << (WORD_COUNT - 1) << "]." << endl;
               SC_REPORT_FATAL(1000, 0);
            }
            assert(wai[j].read().is_01());
            assert(i < WORD_COUNT);
            mem[i] = di[j];
          }
        }
    }


    void proc_rai()
    {
        sc_dt::sc_lv<ADDRESS_WIDTH> rat;
        for (unsigned i = 0; i < READ_PORT_COUNT; i++) {
            for (unsigned j = 0; j < ADDRESS_WIDTH; j++) {
                rat.set_bit(j, ra.read()[i * ADDRESS_WIDTH + j].value());
            }
            rai[i].write(rat);
        }
    }

    void proc_rai_reg()
    {
        for (unsigned i = 0; i < READ_PORT_COUNT; i++) {
            if ( ce.read().get_bit(i) == 1) {
                rai_reg[i] = rai[i];
            }
        }
    }

    void proc_qi()
    {
        sc_dt::sc_lv<DATA_WIDTH> qt;
        sc_dt::sc_lv<READ_PORT_COUNT*DATA_WIDTH> qit;
        for (unsigned i = 0; i < READ_PORT_COUNT; i++) {
            if (!(rai_reg[i].read().is_01())) 
                qt = sc_dt::sc_lv<DATA_WIDTH>();
            else 
            {
                unsigned addr = rai_reg[i].read().to_uint();
                if (addr >= WORD_COUNT) {
                    qt = sc_dt::sc_lv<DATA_WIDTH>();
                }
                else {
                    qt = mem[addr];
                }
            }
            for (unsigned j = 0; j < DATA_WIDTH; j++) {
                qit.set_bit(i*DATA_WIDTH+j, qt[j].value());
            }
        }
        qi.write(qit);
    }


    void proc_q()
    {
        q.write(qi.read());
    }

    ~dct_buf_2d_in_memcore_core() {
        delete [] mem;
    }

public:
    sc_dt::sc_lv< DATA_WIDTH>*  mem;
    sc_core::sc_signal<sc_dt::sc_lv<ADDRESS_WIDTH> > wai[ WRITE_PORT_COUNT ];
    sc_core::sc_signal<sc_dt::sc_lv<ADDRESS_WIDTH> > rai[READ_PORT_COUNT];
    sc_core::sc_signal<sc_dt::sc_lv<ADDRESS_WIDTH> > rai_reg[READ_PORT_COUNT];
    sc_core::sc_signal<sc_dt::sc_lv<DATA_WIDTH> > di[WRITE_PORT_COUNT];
    sc_core::sc_signal<sc_dt::sc_lv<READ_PORT_COUNT*DATA_WIDTH> > qi;
};

  


SC_MODULE( dct_buf_2d_in_memcore )
{
    static const unsigned int DataWidth = 16;
    static const unsigned int AddressRange = 64;
    static const unsigned int AddressWidth = 6;


    sc_core::sc_in<sc_dt::sc_lv<AddressWidth> > address0;
    sc_core::sc_in<sc_dt::sc_logic> ce0;
    sc_core::sc_out<sc_dt::sc_lv<DataWidth> > q0;
    sc_core::sc_in<sc_dt::sc_logic> we0;
    sc_core::sc_in<sc_dt::sc_lv<DataWidth> > d0;

    sc_core::sc_in<sc_dt::sc_lv<AddressWidth> > address1;
    sc_core::sc_in<sc_dt::sc_logic> ce1;
    sc_core::sc_out<sc_dt::sc_lv<DataWidth> > q1;

    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in_clk clk;


    SC_CTOR( dct_buf_2d_in_memcore ) {
        meminst = new dct_buf_2d_in_memcore_core <2, 1, DataWidth, AddressWidth, AddressRange>("core_inst");

        meminst->d(mem_d);
        meminst->q(mem_q);
        meminst->ra(mem_ra);
        meminst->ce(mem_ce);
        meminst->wa(mem_wa);
        meminst->we(mem_we);
        meminst->reset(reset);
        meminst->clk(clk);

        SC_METHOD(proc_mem_q);
        sensitive << mem_q;

        SC_METHOD(proc_mem_ra);
        sensitive << address0 << address1;

        SC_METHOD(proc_mem_ce);
        sensitive << ce0 << ce1;

        SC_METHOD(proc_mem_wa);
        sensitive << address0;

        SC_METHOD(proc_mem_we);
        sensitive << we0;

        SC_METHOD(proc_mem_d);
        sensitive << d0;

        SC_METHOD(proc_op);
        sensitive << ce0 << ce1 << we0;

        SC_METHOD(proc_addr);
        sensitive << address0 << address1;

        SC_METHOD(proc_check);
        sensitive << clk.pos();

    }

    ~dct_buf_2d_in_memcore() {
        delete meminst;
    }

    void proc_mem_q();
    void proc_mem_ra();
    void proc_mem_ce();
    void proc_mem_wa();
    void proc_mem_we();
    void proc_mem_d();
    void proc_op();
    void proc_addr();
    void proc_check();

public:
    sc_core::sc_signal<sc_dt::sc_lv<2 * DataWidth> > mem_q;
    sc_core::sc_signal<sc_dt::sc_lv<1> > mem_we;
    sc_core::sc_signal<sc_dt::sc_lv<1 * DataWidth> > mem_d;
    sc_core::sc_signal<sc_dt::sc_lv<1 * AddressWidth> > mem_wa;
    sc_core::sc_signal<sc_dt::sc_lv<2 * AddressWidth> > mem_ra;
    sc_core::sc_signal<sc_dt::sc_lv<2> > mem_ce;

    dct_buf_2d_in_memcore_core <2, 1, DataWidth, AddressWidth, AddressRange>* meminst;
    sc_core::sc_signal<sc_dt::sc_logic> __re__[2];
    sc_core::sc_signal<sc_dt::sc_logic> __we__[2];
    sc_core::sc_signal<sc_dt::sc_lv<AddressWidth> > __addr__[2];


};

#endif //_dct_buf_2d_in_memcore_H_
