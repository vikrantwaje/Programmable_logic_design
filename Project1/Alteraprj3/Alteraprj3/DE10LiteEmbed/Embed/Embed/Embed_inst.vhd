	component Embed is
		port (
			alt_pll_1_areset_conduit_export     : in    std_logic                     := 'X';             -- export
			alt_pll_1_locked_conduit_export     : out   std_logic;                                        -- export
			clk_clk                             : in    std_logic                     := 'X';             -- clk
			clk_0_clk                           : in    std_logic                     := 'X';             -- clk
			dram_addr                           : out   std_logic_vector(12 downto 0);                    -- addr
			dram_ba                             : out   std_logic_vector(1 downto 0);                     -- ba
			dram_cas_n                          : out   std_logic;                                        -- cas_n
			dram_cke                            : out   std_logic;                                        -- cke
			dram_cs_n                           : out   std_logic;                                        -- cs_n
			dram_dq                             : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			dram_dqm                            : out   std_logic_vector(1 downto 0);                     -- dqm
			dram_ras_n                          : out   std_logic;                                        -- ras_n
			dram_we_n                           : out   std_logic;                                        -- we_n
			dram_clk_clk                        : out   std_logic;                                        -- clk
			gsensor_MISO                        : in    std_logic                     := 'X';             -- MISO
			gsensor_MOSI                        : out   std_logic;                                        -- MOSI
			gsensor_SCLK                        : out   std_logic;                                        -- SCLK
			gsensor_SS_n                        : out   std_logic;                                        -- SS_n
			ledr_export                         : out   std_logic_vector(9 downto 0);                     -- export
			modular_adc_0_adc_pll_locked_export : in    std_logic                     := 'X';             -- export
			reset_reset_n                       : in    std_logic                     := 'X';             -- reset_n
			reset_0_reset_n                     : in    std_logic                     := 'X';             -- reset_n
			sw_export                           : in    std_logic_vector(9 downto 0)  := (others => 'X')  -- export
		);
	end component Embed;

	u0 : component Embed
		port map (
			alt_pll_1_areset_conduit_export     => CONNECTED_TO_alt_pll_1_areset_conduit_export,     --     alt_pll_1_areset_conduit.export
			alt_pll_1_locked_conduit_export     => CONNECTED_TO_alt_pll_1_locked_conduit_export,     --     alt_pll_1_locked_conduit.export
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                          clk.clk
			clk_0_clk                           => CONNECTED_TO_clk_0_clk,                           --                        clk_0.clk
			dram_addr                           => CONNECTED_TO_dram_addr,                           --                         dram.addr
			dram_ba                             => CONNECTED_TO_dram_ba,                             --                             .ba
			dram_cas_n                          => CONNECTED_TO_dram_cas_n,                          --                             .cas_n
			dram_cke                            => CONNECTED_TO_dram_cke,                            --                             .cke
			dram_cs_n                           => CONNECTED_TO_dram_cs_n,                           --                             .cs_n
			dram_dq                             => CONNECTED_TO_dram_dq,                             --                             .dq
			dram_dqm                            => CONNECTED_TO_dram_dqm,                            --                             .dqm
			dram_ras_n                          => CONNECTED_TO_dram_ras_n,                          --                             .ras_n
			dram_we_n                           => CONNECTED_TO_dram_we_n,                           --                             .we_n
			dram_clk_clk                        => CONNECTED_TO_dram_clk_clk,                        --                     dram_clk.clk
			gsensor_MISO                        => CONNECTED_TO_gsensor_MISO,                        --                      gsensor.MISO
			gsensor_MOSI                        => CONNECTED_TO_gsensor_MOSI,                        --                             .MOSI
			gsensor_SCLK                        => CONNECTED_TO_gsensor_SCLK,                        --                             .SCLK
			gsensor_SS_n                        => CONNECTED_TO_gsensor_SS_n,                        --                             .SS_n
			ledr_export                         => CONNECTED_TO_ledr_export,                         --                         ledr.export
			modular_adc_0_adc_pll_locked_export => CONNECTED_TO_modular_adc_0_adc_pll_locked_export, -- modular_adc_0_adc_pll_locked.export
			reset_reset_n                       => CONNECTED_TO_reset_reset_n,                       --                        reset.reset_n
			reset_0_reset_n                     => CONNECTED_TO_reset_0_reset_n,                     --                      reset_0.reset_n
			sw_export                           => CONNECTED_TO_sw_export                            --                           sw.export
		);

