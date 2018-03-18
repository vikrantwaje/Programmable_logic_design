// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.1 :| Alexandra Du			:| 06/01/2016:| Added Verilog file
// ============================================================================


`define ENABLE_CLOCK1
`define ENABLE_LED
`define ENABLE_SW

`timescale 1 ps/1 ps
module hello_world(

	//////////// CLOCK 1: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK1
	input 		          		MAX10_CLK1_50,
`endif

	//////////// LEDR: 3.3-V LVTTL //////////
`ifdef ENABLE_LED
	output		     [1:0]		LEDR,
`endif

	//////////// SW: 3.3-V LVTTL //////////
`ifdef ENABLE_SW
	input 		     [1:0]		SW,
`endif
    
	input					[1:0]		KEY);
assign LEDR[1] = SW[1];
	nios_setup_v2 u0 (
		.clk_clk                           (MAX10_CLK1_50),                           //                        clk.clk
		.led_external_connection_export    (LEDR),    //    led_external_connection.export
		.reset_reset_n                     (1'b1),                     //                      reset.reset_n
		.switch_external_connection_export (SW), // switch_external_connection.export
		.key_external_connection_export    (KEY)     //    key_external_connection.export
	);

endmodule
