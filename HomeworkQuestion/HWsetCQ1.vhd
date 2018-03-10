library ieee; 
use ieee.std_logic_1164.all;

--Entity declaration
Entity HWsetCQ1 is 	
	PORT(
		clk,Reset,Y: IN std_logic; 
		X:				OUT  std_logic
	);	
end HWsetCQ1;


architecture behavioural of HWsetCQ1 is
	signal temp:STD_LOGIC;	-- Temporary signal to declare a buffer to solve time quest timing anaylzer problem
	begin
	 
	
	--If clock or reset input changes the output changes(Reset:Asynchronous Input)
	Process(clk,Reset)
	begin
	if(Reset='1') then 
	temp<='0';
	elsif(rising_edge(clk)) then
	temp<=not(Y);
	
	end if;
	end process;
	
	
	-- A new process to define a buffer used to solve timing analyzer problem
	process(Clk)
	begin
	if(rising_edge(clk)) then
	X<=(temp);
	end if;
	end process;
		
		
		end behavioural;