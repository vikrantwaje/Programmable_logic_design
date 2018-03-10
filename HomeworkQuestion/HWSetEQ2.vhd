LIBRARY IEEE; 								--Importing library IEEE
USE IEEE.STD_LOGIC_1164.ALL;			-- Using standard logic library
USE IEEE.STD_LOGIC_ARITH.ALL;			-- Using standard arithmatic library
USE IEEE.STD_LOGIC_UNSIGNED.ALL;		-- Using logic unsigned library

ENTITY hwseteq2 IS
GENERIC(N: INTEGER:= 32;				-- Width of Inputs and Output=32 bits
			M: INTEGER:= 5);				--Width of Opcode=5 bits
PORT( Op : IN STD_LOGIC_VECTOR( M-1 DOWNTO 0 );-- Opcode
A, B : IN STD_LOGIC_VECTOR( N-1 DOWNTO 0 );		-- Input A and B
Y : OUT STD_LOGIC_VECTOR( N-1 DOWNTO 0 );			-- Output Y
Clk: IN STD_LOGIC											-- Clock Signal
 );
END hwseteq2;

ARCHITECTURE behavior OF hwseteq2 IS
SIGNAL ALU_OUT : STD_LOGIC_VECTOR( N-1 DOWNTO 0 );	--Defining Internal signal ALU_OUT
BEGIN
PROCESS ( Op, A, B,Clk )					-- ALU output trigerred whenever any of input mentioned in sensitivity list chnages
BEGIN
if(Rising_edge(Clk)) then					-- On rising edge of clock
CASE Op ( 4 DOWNTO 2 ) IS					-- Check only bits 4:2 of Opcode

WHEN "000" =>		--When Opcode[4:2]=000 , ALU_OUT=A								
ALU_OUT <= A;
WHEN "001" =>		--When Opcode[4:2]=001 , ALU_OUT=A+B
ALU_OUT <= A + B;
WHEN "010" =>		--When Opcode[4:2]=010 , ALU_OUT=A-B
ALU_OUT <= A - B;
WHEN "011" =>		--When Opcode[4:2]=011 , ALU_OUT=A AND B
ALU_OUT <= A AND B;
WHEN "100" =>		--When Opcode[4:2]=100 , ALU_OUT=A OR B
ALU_OUT <= A OR B;
WHEN "101" =>		--When Opcode[4:2]=101 , ALU_OUT=A + 1
ALU_OUT <= A + "1";
WHEN "110" =>		--When Opcode[4:2]=110 , ALU_OUT=A - 1
ALU_OUT <= A - "1";
WHEN "111" =>		--When Opcode[4:2]=111 , ALU_OUT=B
ALU_OUT <= B;
WHEN OTHERS =>    --When Opcode[4:2]=ANY OTHER , ALU_OUT=0
ALU_OUT <= (OTHERS =>'0');
END CASE;



CASE Op ( 1 DOWNTO 0 ) IS
WHEN "00" =>	--When Opcode[1:0]=00 , Y=ALU_OUT
Y <= ALU_OUT;
WHEN "01" =>	--When Opcode[1:0]=01 , Y=SHIFTLEFT(ALU_OUT)
Y <= ALU_OUT(30 DOWNTO 0) & '0';
WHEN "10" =>	--When Opcode[1:0]=10 , Y=SHIFTRIGHT(ALU_OUT)
Y <= '0' & ALU_OUT(31 DOWNTO 1) ;
WHEN "11" =>	--When Opcode[1:0]=11 , Y=0
Y <= (OTHERS =>'0');
WHEN OTHERS =>	--When Opcode[1:0]=ANY OTHER , Y=1
Y <= (OTHERS=>'1');
END CASE;
END IF;
END PROCESS;
END behavior;