	component DE1_SoC_QSYS is
		port (
			clk_clk                        : in  std_logic                    := 'X';             -- clk
			reset_reset_n                  : in  std_logic                    := 'X';             -- reset_n
			adc_ltc2308_conduit_end_CONVST : out std_logic;                                       -- CONVST
			adc_ltc2308_conduit_end_SCK    : out std_logic;                                       -- SCK
			adc_ltc2308_conduit_end_SDI    : out std_logic;                                       -- SDI
			adc_ltc2308_conduit_end_SDO    : in  std_logic                    := 'X';             -- SDO
			sw_external_connection_export  : in  std_logic_vector(9 downto 0) := (others => 'X'); -- export
			pll_sys_locked_export          : out std_logic;                                       -- export
			pll_sys_outclk2_clk            : out std_logic                                        -- clk
		);
	end component DE1_SoC_QSYS;

	u0 : component DE1_SoC_QSYS
		port map (
			clk_clk                        => CONNECTED_TO_clk_clk,                        --                     clk.clk
			reset_reset_n                  => CONNECTED_TO_reset_reset_n,                  --                   reset.reset_n
			adc_ltc2308_conduit_end_CONVST => CONNECTED_TO_adc_ltc2308_conduit_end_CONVST, -- adc_ltc2308_conduit_end.CONVST
			adc_ltc2308_conduit_end_SCK    => CONNECTED_TO_adc_ltc2308_conduit_end_SCK,    --                        .SCK
			adc_ltc2308_conduit_end_SDI    => CONNECTED_TO_adc_ltc2308_conduit_end_SDI,    --                        .SDI
			adc_ltc2308_conduit_end_SDO    => CONNECTED_TO_adc_ltc2308_conduit_end_SDO,    --                        .SDO
			sw_external_connection_export  => CONNECTED_TO_sw_external_connection_export,  --  sw_external_connection.export
			pll_sys_locked_export          => CONNECTED_TO_pll_sys_locked_export,          --          pll_sys_locked.export
			pll_sys_outclk2_clk            => CONNECTED_TO_pll_sys_outclk2_clk             --         pll_sys_outclk2.clk
		);

