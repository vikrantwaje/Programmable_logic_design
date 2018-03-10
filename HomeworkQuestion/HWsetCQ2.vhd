library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_unsigned.all;

-- Entity declaration
entity HWsetCQ2 
	is
	port
	(
		CP			: in std_logic; --clock
		SR			: in std_logic;--Active low, Synchronous reset
		P			: in std_logic_vector(3 downto 0); --Parallel input
		
		PE			: in std_logic; -- Count Enable Parallel
		CEP		: in std_logic; -- Count Enable Parallel Input
		CET		: in std_logic; --Count Enable Trickle Input
		Q			: out std_logic_vector(3 downto 0); -- Parallel Output
		TC			: out std_logic--Terminal Count 
		
	);
	end HWsetCQ2;
	
	architecture behavioural of HWsetCQ2 is
	signal buff:  STD_LOGIC_VECTOR(3 downto 0);	--Insertion of Buffer to solve timing analysis
	begin
		Process(CP)
		variable temp:STD_LOGIC_VECTOR(3 downto 0);
		begin
		if(CP'event and CP='1') then
		if(SR='0') then	--If SR=0 then reset the counter
		temp:="0000";
		elsif(PE='0' and SR='1') then -- If PE=1 load the counter with count value
		temp:=P;
		elsif(PE='1' and CEP='1' and CET='1' and SR='1') then 
		if(temp="1111") then --Rollover when counter reaches its maximum value of 15
		TC<='1';					-- Make Terminal count=1 whenever there is rollover
		temp:="0000";
		
		else
		temp:=temp+1;	-- Increment Counter in every clock cycle
		TC<='0';
		end if;
		end if;
		end if;
		buff<=temp;
		
		end process;	--Additional process to insert a buffer in data path
		process(CP)
		begin
				if(CP'event and CP='1') then
				Q<=buff;
				end if;
				end process;
		end behavioural;
		