	ADC u0 (
		.CLOCK     (<connected-to-CLOCK>),     //         clk.clk
		.RESET     (<connected-to-RESET>),     //       reset.reset
		.CH0       (<connected-to-CH0>),       //    readings.CH0
		.CH1       (<connected-to-CH1>),       //            .CH1
		.CH2       (<connected-to-CH2>),       //            .CH2
		.CH3       (<connected-to-CH3>),       //            .CH3
		.CH4       (<connected-to-CH4>),       //            .CH4
		.CH5       (<connected-to-CH5>),       //            .CH5
		.CH6       (<connected-to-CH6>),       //            .CH6
		.CH7       (<connected-to-CH7>),       //            .CH7
		.ADC_SCLK  (<connected-to-ADC_SCLK>),  // adc_signals.SCLK
		.ADC_CS_N  (<connected-to-ADC_CS_N>),  //            .CS_N
		.ADC_SDAT  (<connected-to-ADC_SDAT>),  //            .SDAT
		.ADC_SADDR (<connected-to-ADC_SADDR>)  //            .SADDR
	);

