// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/16.1/ip/sld/trace/core/altera_trace_channel_mapper/altera_trace_channel_mapper.sv.terp#1 $
// $Revision: #1 $
// $Date: 2016/08/07 $
// $Author: swbranch $

// -------------------------------------------------------
// Altera Trace Channel Mapper
//
// Parameters
//   DATA_WIDTH    : 32
//   EMPTY_WIDTH   : 2
//   IN_CHANNEL    : 1
//   OUT_CHANNEL   : 1
//   MAPPING       : 0 1
//
// -------------------------------------------------------

`timescale 1 ns / 1 ns
`default_nettype none
module alt_sld_fab_alt_sld_fab_trfabric_capture_remap
(
    // -------------------
    // Clock & Reset
    // -------------------
    input wire clk,
    input wire reset,

    // -------------------
    // Input
    // -------------------
    output wire in_ready,
    input wire in_valid,
    input wire [32-1:0] in_data,
    input wire in_startofpacket,
    input wire in_endofpacket,
    input wire [2-1:0] in_empty,
    input wire [1-1:0] in_channel,

    // -------------------
    // Output
    // -------------------
    input wire out_ready,
    output wire out_valid,
    output wire [32-1:0] out_data,
    output wire out_startofpacket,
    output wire out_endofpacket,
    output wire [2-1:0] out_empty,
    output reg [1-1:0] out_channel
);

assign in_ready = out_ready;

assign out_valid = in_valid;
assign out_data = in_data;
assign out_startofpacket = in_startofpacket;
assign out_endofpacket = in_endofpacket;
assign out_empty = in_empty;

always @(in_channel) begin

    case (in_channel)
        0: out_channel = 1'd0;    
        1: out_channel = 1'd1;    
        default: out_channel = 1'd0;
    endcase

end

endmodule
`default_nettype wire


