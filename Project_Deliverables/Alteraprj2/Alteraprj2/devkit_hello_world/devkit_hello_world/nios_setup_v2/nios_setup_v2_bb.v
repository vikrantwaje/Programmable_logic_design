
module nios_setup_v2 (
	clk_clk,
	led_external_connection_export,
	reset_reset_n,
	switch_external_connection_export,
	key_external_connection_export);	

	input		clk_clk;
	output		led_external_connection_export;
	input		reset_reset_n;
	input		switch_external_connection_export;
	input	[1:0]	key_external_connection_export;
endmodule
