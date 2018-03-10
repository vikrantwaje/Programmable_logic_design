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


// altera message_level level1
// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.

 
// $Id: //acds/rel/13.1/ip/.../avalon-st_demultiplexer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2013/09/09 $
// $Author: dmunday $


// --------------------------------------------------------------------------------
//| Avalon Streaming Demultiplexer
// --------------------------------------------------------------------------------


`timescale 1ns / 100ps
// ------------------------------------------
// Generation parameters:
//   output_name:        alt_sld_fab_alt_sld_fab_stfabric_demux
//   use_packets:        true
//   use_empty:          0
//   empty_width:        0
//   data_width:         8
//   channel_width:      2
//   error_width:        0
//   num_outputs:        2
//   outChWidth:         1
//   selectWidth:        1
//   selectBits:         1-1:0
//   inPayloadMap:       in_data,in_startofpacket,in_endofpacket,in_channel[1:1]
//   outPayloadWidth:    11
//   outPayloadMap:      out0_data,out0_startofpacket,out0_endofpacket,out0_channel out1_data,out1_startofpacket,out1_endofpacket,out1_channel
//   
// ------------------------------------------


module alt_sld_fab_alt_sld_fab_stfabric_demux (     
 // Interface: in
 input     [2-1: 0] in_channel,
 input              in_valid,
 output reg         in_ready,
 input    [8-1: 0] in_data,
 input              in_startofpacket,
 input              in_endofpacket,

// Interface: out0
 output reg          out0_channel,
 output reg          out0_valid,
 input               out0_ready,
 output reg [8-1: 0] out0_data,
 output reg          out0_startofpacket,
 output reg          out0_endofpacket, 
// Interface: out1
 output reg          out1_channel,
 output reg          out1_valid,
 input               out1_ready,
 output reg [8-1: 0] out1_data,
 output reg          out1_startofpacket,
 output reg          out1_endofpacket, 
  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

 /*AUTOARG*/);
                          

// ---------------------------------------------------------------------
//| Signal Declarations
// ---------------------------------------------------------------------
   wire           in_ready_wire;
   reg [1 -1:0]   in_select;
   reg [11 -1:0]  in_payload;
   reg            lhs_ready;
   wire           lhs_valid; 
   wire [1 -1:0]  mid_select;
   wire [11 -1:0] mid_payload;
   
   reg            rhs0_valid;
   wire           rhs0_ready;
   reg            rhs1_valid;
   wire           rhs1_ready;
   wire           out0_valid_wire;
   wire [11-1:0]  out0_payload;                  
   wire           out1_valid_wire;
   wire [11-1:0]  out1_payload;                  
// ---------------------------------------------------------------------
//| Input Mapping
// ---------------------------------------------------------------------
always @* begin
   in_ready   = in_ready_wire;
   in_payload = {in_data,in_startofpacket,in_endofpacket,in_channel[1:1]};
   in_select  = in_channel[1-1:0];
end

// ---------------------------------------------------------------------
//| Input Pipeline Stage
// ---------------------------------------------------------------------
alt_sld_fab_alt_sld_fab_stfabric_demux_1stage_pipeline #( .PAYLOAD_WIDTH( 11 + 1 )) inpipe
 ( .clk      (clk ),
   .reset_n  (reset_n  ),
   .in_ready (in_ready_wire ),
   .in_valid (in_valid ),
   .in_payload ({in_select, in_payload}),
   .out_ready(lhs_ready ),
   .out_valid(lhs_valid),
   .out_payload({mid_select, mid_payload}) );


// ---------------------------------------------------------------------
//| Demuxing
// ---------------------------------------------------------------------
always @* begin
     lhs_ready  = 1;
     rhs0_valid = 0;
     rhs1_valid = 0;
   // Do mux
   case (mid_select)
       0: begin
             lhs_ready = rhs0_ready;
             rhs0_valid = lhs_valid;
           end
       1: begin
             lhs_ready = rhs1_ready;
             rhs1_valid = lhs_valid;
           end
   endcase // case (mid_select)
end


   // ---------------------------------------------------------------------
   //| Output Pipeline Stage
   // ---------------------------------------------------------------------
alt_sld_fab_alt_sld_fab_stfabric_demux_1stage_pipeline #( .PAYLOAD_WIDTH(11)) outpipe0
  ( .clk        (clk ),
    .reset_n    (reset_n  ),
    .in_ready   (rhs0_ready ),
    .in_valid   (rhs0_valid),
    .in_payload (mid_payload),
    .out_ready  (out0_ready ),
    .out_valid  (out0_valid_wire),
    .out_payload(out0_payload)  );
alt_sld_fab_alt_sld_fab_stfabric_demux_1stage_pipeline #( .PAYLOAD_WIDTH(11)) outpipe1
  ( .clk        (clk ),
    .reset_n    (reset_n  ),
    .in_ready   (rhs1_ready ),
    .in_valid   (rhs1_valid),
    .in_payload (mid_payload),
    .out_ready  (out1_ready ),
    .out_valid  (out1_valid_wire),
    .out_payload(out1_payload)  );

   // ---------------------------------------------------------------------
   //| Output Mapping
   // ---------------------------------------------------------------------
always @* begin
   out0_valid   = out0_valid_wire;
   {out0_data,out0_startofpacket,out0_endofpacket,out0_channel} = out0_payload;                                              
   out1_valid   = out1_valid_wire;
   {out1_data,out1_startofpacket,out1_endofpacket,out1_channel} = out1_payload;                                              
end

endmodule //

//  --------------------------------------------------------------------------------
// | single buffered pipeline stage
//  --------------------------------------------------------------------------------
module alt_sld_fab_alt_sld_fab_stfabric_demux_1stage_pipeline
  #( parameter PAYLOAD_WIDTH = 8 )
   ( input                          clk,
     input                          reset_n,
     output reg                     in_ready,
     input                          in_valid,
     input [PAYLOAD_WIDTH-1:0]      in_payload,
     input                          out_ready,
     output reg                     out_valid,
     output reg [PAYLOAD_WIDTH-1:0] out_payload
   );

   reg                              in_ready1;
   always @* begin
      in_ready = out_ready || ~out_valid;
         //     in_ready = in_ready1;
         //     if (!out_ready)
         //       in_ready = 0;
   end

   always @ (negedge reset_n, posedge clk) begin
      if (!reset_n) begin
         in_ready1   <= 0;
         out_valid   <= 0;
         out_payload <= 0;
      end else begin
         in_ready1 <= out_ready || !out_valid;
         if (in_valid) begin
            out_valid <= 1;
         end else if (out_ready) begin
            out_valid <= 0;
         end
         if(in_valid && in_ready) begin
            out_payload <= in_payload;
         end
      end // else: !if(!reset_n)
   end // always @ (negedge reset_n, posedge clk)
endmodule //



