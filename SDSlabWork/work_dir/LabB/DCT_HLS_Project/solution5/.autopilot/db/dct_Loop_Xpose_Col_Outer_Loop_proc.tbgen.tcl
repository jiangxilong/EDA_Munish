set moduleName dct_Loop_Xpose_Col_Outer_Loop_proc
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName dct_Loop_Xpose_Col_Outer_Loop_proc
set C_modelType { void 0 }
set C_modelArgList { 
	{ col_outbuf int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ buf_2d_out int 16 regular {array 64 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ col_outbuf_address0 sc_out sc_lv 6 signal 0 } 
	{ col_outbuf_ce0 sc_out sc_logic 1 signal 0 } 
	{ col_outbuf_q0 sc_in sc_lv 16 signal 0 } 
	{ buf_2d_out_address0 sc_out sc_lv 6 signal 1 } 
	{ buf_2d_out_ce0 sc_out sc_logic 1 signal 1 } 
	{ buf_2d_out_we0 sc_out sc_logic 1 signal 1 } 
	{ buf_2d_out_d0 sc_out sc_lv 16 signal 1 } 
}

set Spec2ImplPortList { 
	col_outbuf { ap_memory {  { col_outbuf_address0 mem_address 1 6 }  { col_outbuf_ce0 mem_ce 1 1 }  { col_outbuf_q0 mem_dout 0 16 } } }
	buf_2d_out { ap_memory {  { buf_2d_out_address0 mem_address 1 6 }  { buf_2d_out_ce0 mem_ce 1 1 }  { buf_2d_out_we0 mem_we 1 1 }  { buf_2d_out_d0 mem_din 1 16 } } }
}
