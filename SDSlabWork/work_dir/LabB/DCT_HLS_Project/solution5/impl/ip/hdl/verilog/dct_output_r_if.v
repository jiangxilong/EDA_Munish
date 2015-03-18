// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.3
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1ns/1ps

module dct_output_r_if (
    // system singals
    input  wire        clk,
    input  wire        reset,
    // user signals
    input  wire [5:0]  output_r_address0,
    input  wire        output_r_ce0,
    input  wire [15:0] output_r_d0,
    output wire [15:0] output_r_q0,
    input  wire        output_r_we0,
    input  wire [5:0]  output_r_address1,
    input  wire        output_r_ce1,
    input  wire [15:0] output_r_d1,
    output wire [15:0] output_r_q1,
    input  wire        output_r_we1,
    // bus signals
    output wire        Clk_A,
    output wire        Rst_A,
    output wire        EN_A,
    output wire [1:0]  WEN_A,
    output wire [31:0] Addr_A,
    output wire [15:0] Dout_A,
    input  wire [15:0] Din_A,
    output wire        Clk_B,
    output wire        Rst_B,
    output wire        EN_B,
    output wire [1:0]  WEN_B,
    output wire [31:0] Addr_B,
    output wire [15:0] Dout_B,
    input  wire [15:0] Din_B
);
//------------------------Body---------------------------
assign Clk_A       = clk;
assign Rst_A       = reset;
assign EN_A        = output_r_ce0;
assign Addr_A      = {output_r_address0, 1'b0};
assign WEN_A       = {2{output_r_we0}};
assign Dout_A      = output_r_d0;
assign output_r_q0 = Din_A[15:0];
assign Clk_B       = clk;
assign Rst_B       = reset;
assign EN_B        = output_r_ce1;
assign Addr_B      = {output_r_address1, 1'b0};
assign WEN_B       = {2{output_r_we1}};
assign Dout_B      = output_r_d1;
assign output_r_q1 = Din_B[15:0];

endmodule
