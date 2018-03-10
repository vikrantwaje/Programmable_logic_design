-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
-- CREATED		"Mon Jan 29 20:35:29 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY problem3new IS 
	PORT
	(
		CLKin :  IN  STD_LOGIC;
		Y :  IN  STD_LOGIC;
		Preset :  IN  STD_LOGIC;
		Clear :  IN  STD_LOGIC;
		X :  OUT  STD_LOGIC
	);
END problem3new;

ARCHITECTURE bdf_type OF problem3new IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



PROCESS(CLKin,Clear,Preset)
BEGIN
IF (Clear = '0') THEN
	X <= '0';
ELSIF (Preset = '0') THEN
	X <= '1';
ELSIF (RISING_EDGE(CLKin)) THEN
	X <= SYNTHESIZED_WIRE_0;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_0 <= NOT(Y);



END bdf_type;