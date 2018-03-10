library IEEE;  -- LIBRARY ieee
use IEEE.STD_LOGIC_1164.ALL;	-- Use STD_LOGIC_1164 
USE IEEE.STD_LOGIC_ARITH.ALL;	-- Use STD_LOGIC_ARITHMATIC
USE IEEE.STD_LOGIC_UNSIGNED.ALL;	--USE STD_LOGIC_UNSIGNED



ENTITY HWSETEQ3 IS
GENERIC(REQUIRED_FREQUENCY:INTEGER RANGE 1200 TO 115200 :=3072);	--ENTER THE REQUIRED FREQUENCY BETWEEN 1200 HZ and 115200 HZ
PORT(CLK: IN STD_LOGIC;															-- Clock Input signal
		RESET: IN STD_LOGIC;														-- Reset Signal
		BAUDSELECT: INOUT INTEGER RANGE 0 TO 256000;						-- Baud Rate Selector(Selects standard Baud rate from 110 to 256000)
		CLOCKOUT:OUT STD_LOGIC:='0');											-- Derived Clock out signal from Clock input based upon baud rate selector 
		END HWSETEQ3;

ARCHITECTURE BEHAVIOURAL OF HWSETEQ3 IS
SIGNAL COUNTER: INTEGER RANGE 0 TO 256000:=0;						-- Temporary signal to help baud rate selector
SIGNAL CLKOUT:STD_LOGIC := '0';											-- Temporary signal to generate Clock 

BEGIN


PROCESS(CLK,RESET)	-- Process trigerred on rising edge of clock or reset signal
BEGIN
IF(RESET='1') THEN		-- Asynchronous reset
CLKOUT<='0';				-- Makes Clock output as zero
COUNTER<=0;					-- Internal signal counter resets to zero


ELSIF(RISING_EDGE(CLK)) THEN		-- If rising edge of clock
IF(REQUIRED_FREQUENCY >= 1200 AND REQUIRED_FREQUENCY<=115200) THEN		-- If frequency between 1200 Hz and 115200 calculate baud rate using BR=(CLOCKFREQUENCY/REQUIREDFREQUENCY)
BAUDSELECT<=((14745600)/(REQUIRED_FREQUENCY));

ELSIF(REQUIRED_FREQUENCY <=1200 ) THEN 
BAUDSELECT<=1200;			-- If required frequency less than 1200 Hz then select baud rate as 1200

ELSIF(REQUIRED_FREQUENCY >=115200 ) THEN -- If required frequency greater than 115200 Hz then select baud rate as 115200
BAUDSELECT<=115200;
END IF;

-- Check Whether the Baud rate derived above is standard Baud rate, only if Baud rate is standard, generate the clock output signal
IF( BAUDSELECT =2 OR BAUDSELECT = 110 OR BAUDSELECT = 300 OR BAUDSELECT=600 OR BAUDSELECT=600 OR BAUDSELECT=1200 OR BAUDSELECT=2400 OR BAUDSELECT=4800 OR BAUDSELECT=9600 OR BAUDSELECT= 14400 OR BAUDSELECT=19200 OR BAUDSELECT=38400 OR BAUDSELECT=57600 OR BAUDSELECT=115200 OR BAUDSELECT=128000OR BAUDSELECT=256000 ) THEN

IF(COUNTER= (BAUDSELECT/2) - 1) THEN 	-- Clock out signal toggles every Baud/2 time unit
CLKOUT <= NOT(CLKOUT);
COUNTER <=0;
ELSE
COUNTER <=COUNTER + 1;
END IF;


END IF;
END IF;
END PROCESS;
CLOCKOUT<=CLKOUT;		-- Give the internal clock out signal to the final clock out signal
END BEHAVIOURAL;
