	component nios_setup_v2 is
		port (
			clk_clk                           : in  std_logic                    := 'X';             -- clk
			led_external_connection_export    : out std_logic;                                       -- export
			reset_reset_n                     : in  std_logic                    := 'X';             -- reset_n
			switch_external_connection_export : in  std_logic                    := 'X';             -- export
			key_external_connection_export    : in  std_logic_vector(1 downto 0) := (others => 'X')  -- export
		);
	end component nios_setup_v2;

	u0 : component nios_setup_v2
		port map (
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			led_external_connection_export    => CONNECTED_TO_led_external_connection_export,    --    led_external_connection.export
			reset_reset_n                     => CONNECTED_TO_reset_reset_n,                     --                      reset.reset_n
			switch_external_connection_export => CONNECTED_TO_switch_external_connection_export, -- switch_external_connection.export
			key_external_connection_export    => CONNECTED_TO_key_external_connection_export     --    key_external_connection.export
		);

