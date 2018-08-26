

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY LAB2PART3 IS 
GENERIC(N:INTEGER:=7;	-- Number of bits
		  K:INTEGER:=10);	-- Count
PORT(
RESET:IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		TERMINAL_COUNT:OUT STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable: IN STD_LOGIC;
		first:IN STD_LOGIC;
		second:IN STD_LOGIC;
		third:IN STD_LOGIC;
		fourth:IN STD_LOGIC;
		fifth:IN STD_LOGIC;
		sw: IN STD_LOGIC_VECTOR(7 downto 0);
		Key: IN STD_LOGIC;
		count9: IN STD_LOGIC
		);
END ENTITY LAB2PART3;

ARCHITECTURE BEHAVIOURAL OF LAB2PART3 IS
SIGNAL CLKOUT:STD_LOGIC := '0';											-- Temporary signal to generate Clock 
SIGNAL COUNTER:STD_LOGIC_vector(19 DOWNTO 0) := (OTHERS=>'0');											-- Temporary signal to generate Clock 
SIGNAL PREENABLE9: STD_LOGIC;
BEGIN

PROCESS(CLOCK)
BEGIN
IF(rISING_EDGE(CLOCK)) THEN
IF(COUNTER= (250000)) THEN 	-- Clock out signal toggles every Baud/2 time unit
CLKOUT <= NOT(CLKOUT);
COUNTER <=(others=>'0');
ELSE
COUNTER <=COUNTER + 1;
END IF;
END IF;
END PROCESS;


PROCESS(RESET, CLKOUT,key)
VARIABLE COUNT: STD_LOGIC_VECTOR(N-1 DOWNTO 0):=(OTHERS=>'0');
VARIABLE RCOUNT: STD_LOGIC_VECTOR(N-1 DOWNTO 0):=(OTHERS=>'0');

BEGIN
Preenable9<=count9;
if(key = '0') then
if(Preenable9='1') then
RCOUNT:="0000000" or SW(3 DOWNTO 0) ;
PREENABLE9<='0';
end if;

elsIF(RESET='0') THEN
COUNT:=(OTHERS=>'0');
RCOUNT:=(OTHERS=>'0');


ELSIF (RISING_EDGE(CLKOUT)  ) THEN

TERMINAL_COUNT<='0';





IF((RCOUNT) = (K-1) and first='1' and second='1' and third='1' and fourth='1' and fifth='1') THEN
COUNT:=(OTHERS=>'0');
RCOUNT:=(OTHERS=>'0');


ELSif(enable='1' and first='1' and second='1' and third='1' and fourth='1' and fifth='1') then
COUNT:=COUNT+1;
IF(COUNT = 1) THEN
COUNT:=(OTHERS=>'0');
RCOUNT:=RCOUNT+1;
END IF;
END IF;
IF(RCOUNT = K-1 ) THEN
TERMINAL_COUNT<='1';
END IF;
END IF;
if(Rcount = 0) then
Q<="1000000";
elsif(Rcount=1) then
Q<="1111001";
elsif(Rcount=2) then
Q<="0100100";
elsif(Rcount=3) then
Q<="0110000";
elsif(Rcount=4) then
Q<="0011001";
elsif(Rcount=5) then
Q<="0010010";
elsif(Rcount=6) then
Q<="0000010";
elsif(Rcount=7) then
Q<="1111000";
elsif(Rcount=8) then
Q<="0000000";
elsif(Rcount=9) then
Q<="0011000";
else Q<=(OTHERS=>'1');
end if;
END PROCESS;
END BEHAVIOURAL;


--counter59
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY main1 IS 
GENERIC(N:INTEGER:=7;	-- Number of bits
		  K:INTEGER:=10);	-- Count
PORT(
		RESET:IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		TERMINAL_COUNT:OUT STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable: IN STD_LOGIC;
		first:IN STD_LOGIC;
		second:IN STD_LOGIC;
		third:IN STD_LOGIC;
		fourth:IN STD_LOGIC;
		fifth:IN STD_LOGIC;
		sw: IN STD_LOGIC_VECTOR(7 downto 0);
		Key: IN STD_LOGIC;
		COUNT5: IN STD_LOGIC
		);
END ENTITY main1;

ARCHITECTURE BEHAVIOURAL OF main1 IS
SIGNAL CLKOUT:STD_LOGIC := '0';											-- Temporary signal to generate Clock 
SIGNAL COUNTER:STD_LOGIC_vector(19 DOWNTO 0) := (OTHERS=>'0');											-- Temporary signal to generate Clock 
SIGNAL PREENABLE5: STD_LOGIC;
BEGIN
PROCESS(CLOCK)
BEGIN
IF(RISING_EDGE(CLOCK)) THEN
IF(COUNTER= (250000)) THEN 	-- Clock out signal toggles every Baud/2 time unit
CLKOUT <= NOT(CLKOUT);
COUNTER <=(others=>'0');
ELSE
COUNTER <=COUNTER + 1;
END IF;
END IF;
END PROCESS;

PROCESS(RESET, CLKOUT,key)
VARIABLE COUNT: STD_LOGIC_VECTOR(N-1 DOWNTO 0):=(OTHERS=>'0');
VARIABLE RCOUNT: STD_LOGIC_VECTOR(N-1 DOWNTO 0):=(OTHERS=>'0');

BEGIN
PREENABLE5<=COUNT5;

if(key = '0') then
if(Preenable5='1') then
RCOUNT:= sw(7 DOWNTO 4) OR "0000000" ;
PREENABLE5<='0';
end if;
elsIF(RESET='0') THEN
COUNT:=(OTHERS=>'0');
RCOUNT:=(OTHERS=>'0');


ELSIF (RISING_EDGE(CLKOUT)  ) THEN

TERMINAL_COUNT<='0';





IF((RCOUNT) = 5 and first='1' and second='1' and third='1' and fourth='1' and fifth='1') THEN
COUNT:=(OTHERS=>'0');
RCOUNT:=(OTHERS=>'0');


ELSif(enable='1' and first='1' and second='1' and third='1' and fourth='1' and fifth='1') then
COUNT:=COUNT+1;
IF(COUNT = 1) THEN
COUNT:=(OTHERS=>'0');
RCOUNT:=RCOUNT+1;
END IF;
END IF;
IF(RCOUNT = 5 ) THEN
TERMINAL_COUNT<='1';
END IF;
END IF;
if(Rcount = 0) then
Q<="1000000";
elsif(Rcount=1) then
Q<="1111001";
elsif(Rcount=2) then
Q<="0100100";
elsif(Rcount=3) then
Q<="0110000";
elsif(Rcount=4) then
Q<="0011001";
elsif(Rcount=5) then
Q<="0010010";
elsif(Rcount=6) then
Q<="0000010";
elsif(Rcount=7) then
Q<="1111000";
elsif(Rcount=8) then
Q<="0000000";
elsif(Rcount=9) then
Q<="0011000";
else Q<=(OTHERS=>'1');
end if;
END PROCESS;
END BEHAVIOURAL;




--Actual

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity Main is
GENERIC(N:INTEGER:=7;	-- Number of bits
		  K:INTEGER:=10);	-- Count
port(
clk: IN STD_LOGIC;
Enable: IN STD_LOGIC;
Reset: IN STD_LOGIC;
enable6: OUT STD_LOGIC;
O0: OUT STD_LOGIC_VECTOR(6 downto 0);
O1: OUT STD_LOGIC_VECTOR(6 downto 0);
O2: OUT STD_LOGIC_VECTOR(6 downto 0);
O3: OUT STD_LOGIC_VECTOR(6 downto 0);
O4: OUT STD_LOGIC_VECTOR(6 downto 0);
O5: OUT STD_LOGIC_VECTOR(6 downto 0);
sw: in std_logic_VECTOR(7 DOWNTO 0);
kEY: in std_logic
);
end entity main;

architecture behavioural of main is
signal enable12:STD_LOGIC;
signal enable23:STD_LOGIC;
signal enable31:STD_LOGIC;
signal enable4:STD_LOGIC;
signal enable5:STD_LOGIC;
signal reset2:STD_LOGIC:='0';
signal reset3:STD_LOGIC:='0';
signal Q1: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
signal Q2: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
signal Q3: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
signal Q4: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
signal Q5: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
signal Q6: STD_LOGIC_VECTOR(N-1 DOWNTO 0);


component LAB2PART3 
GENERIC(N:INTEGER:=7;	-- Number of bits
		  K:INTEGER:=10);	-- Count
PORT(
		RESET:IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		TERMINAL_COUNT:OUT STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable: IN STD_LOGIC;
		first: IN STD_LOGIC;
		second:IN STD_LOGIC;
		third:IN STD_LOGIC;
		fourth:IN STD_LOGIC;
		fifth:IN STD_LOGIC;
		sw: IN STD_LOGIC_VECTOR(7 downto 0);
		Key: IN STD_LOGIC;
		count9: IN STD_LOGIC
		);
end component;

component main1
GENERIC(N:INTEGER:=7;	-- Number of bits
		  K:INTEGER:=5);	-- Count
port(
	RESET:IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		TERMINAL_COUNT:OUT STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable: IN STD_LOGIC;
		first:IN STD_LOGIC;
		second:IN STD_LOGIC;
		third:IN STD_LOGIC;
		fourth:IN STD_LOGIC;
		fifth:IN STD_LOGIC;
		sw: IN STD_LOGIC_VECTOR(7 downto 0);
		Key: IN STD_LOGIC;
		count5: IN STD_LOGIC
);
end component;
begin
u0:LAB2PART3 port map(Reset,clk,enable12,o0,Enable,'1','1','1','1','1',SW,KEY,'0');
u1:LAB2PART3 port map(Reset,clk,enable23,O1,enable12,enable12,'1','1','1','1',SW,KEY,'0');
u2:LAB2PART3 port map(Reset,clk,enable31,O2,enable23,enable12,enable23,'1','1','1',SW,KEY,'0');
u3:main1 	 port map(Reset,clk,enable4, O3,enable31,enable12,enable23,enable31,'1','1',SW,KEY,'0');
u4:LAB2PART3 port map(Reset,clk,enable5, O4,enable4,enable12,enable23,enable31,enable4,'1',SW,KEY,'1');
u5:main1 	 port map(Reset,clk,enable6, O5,enable5,enable12,enable23,enable31,enable4,enable5,SW,KEY,'1');
end behavioural;
