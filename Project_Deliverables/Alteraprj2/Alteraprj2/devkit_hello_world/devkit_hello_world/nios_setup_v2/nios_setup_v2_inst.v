	nios_setup_v2 u0 (
		.clk_clk                           (<connected-to-clk_clk>),                           //                        clk.clk
		.led_external_connection_export    (<connected-to-led_external_connection_export>),    //    led_external_connection.export
		.reset_reset_n                     (<connected-to-reset_reset_n>),                     //                      reset.reset_n
		.switch_external_connection_export (<connected-to-switch_external_connection_export>), // switch_external_connection.export
		.key_external_connection_export    (<connected-to-key_external_connection_export>)     //    key_external_connection.export
	);

