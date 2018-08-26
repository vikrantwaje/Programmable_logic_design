library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY LAB2PART1 IS 
GENERIC(N:INTEGER:=8;	-- Number of bits
		  K:INTEGER:=10);	-- Count
PORT(
RESET:IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		TERMINAL_COUNT:OUT STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable: IN STD_LOGIC;
		first:IN STD_LOGIC;
		second:IN STD_LOGIC
		);
END ENTITY LAB2PART1;

ARCHITECTURE BEHAVIOURAL OF LAB2PART1 IS
BEGIN

PROCESS(RESET, CLOCK)
VARIABLE COUNT: STD_LOGIC_VECTOR(N-1 DOWNTO 0):=(OTHERS=>'0');
--VARIABLE RCOUNT: STD_LOGIC_VECTOR(N-1 DOWNTO 0):=(OTHERS=>'0');

BEGIN

IF(RESET='0') THEN
COUNT:=(OTHERS=>'0');
--RCOUNT:=(OTHERS=>'0');

ELSIF (RISING_EDGE(CLOCK)  ) THEN

TERMINAL_COUNT<='0';





IF((COUNT) = (K-1) and first='1' and second='1') THEN
COUNT:=(OTHERS=>'0');
--RCOUNT:=(OTHERS=>'0');


ELSif(enable='1' and first='1' and second='1') then
COUNT:=COUNT+1;
END IF;

IF(COUNT = K-1 ) THEN
TERMINAL_COUNT<='1';
END IF;
END IF;
if(count = 0) then
Q<="11000000";
elsif(count=1) then
Q<="11111001";
elsif(count=2) then
Q<="10100100";
elsif(count=3) then
Q<="10110000";
elsif(count=4) then
Q<="10011001";
elsif(count=5) then
Q<="10010010";
elsif(count=6) then
Q<="10000010";
elsif(count=7) then
Q<="11111000";
elsif(count=8) then
Q<="10000000";
elsif(count=9) then
Q<="10011000";
else Q<=(OTHERS=>'1');
end if;

END PROCESS;
END BEHAVIOURAL;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Main is
GENERIC(N:INTEGER:=8;	-- Number of bits
		  K:INTEGER:=10);	-- Count
port(
clk: IN STD_LOGIC;
Enable: IN STD_LOGIC;
Reset: IN STD_LOGIC;
enable31: OUT STD_LOGIC;
Q1,Q2,Q3: OUT STD_LOGIC_VECTOR(N-1downto 0)
);
end entity main;

architecture behavioural of main is
signal enable12:STD_LOGIC;
signal enable23:STD_LOGIC;
signal reset2:STD_LOGIC:='0';
signal reset3:STD_LOGIC:='0';



component LAB2PART1 
GENERIC(N:INTEGER:=8;	-- Number of bits
		  K:INTEGER:=10);	-- Count
PORT(
		RESET:IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		TERMINAL_COUNT:OUT STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable: IN STD_LOGIC;
		first: IN STD_LOGIC;
		second:IN STD_LOGIC
		);
end component;
begin
u0:LAB2PART1 port map(Reset,clk,enable12,Q1,Enable,'1','1');
u1:LAB2PART1 port map(Reset,clk,enable23,Q2,enable12,enable12,'1');
u2:LAB2PART1 port map(Reset,clk,enable31,Q3,enable23,enable12,enable23);
end behavioural;
