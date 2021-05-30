-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
-- CREATED		"Sun May 03 23:43:43 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY logica_combinatoria IS 
	PORT
	(
		Q2 :  IN  STD_LOGIC;
		Q1 :  IN  STD_LOGIC;
		Q0 :  IN  STD_LOGIC;
		VdA :  OUT  STD_LOGIC;
		AmA :  OUT  STD_LOGIC;
		VmA :  OUT  STD_LOGIC;
		VdB :  OUT  STD_LOGIC;
		AmB :  OUT  STD_LOGIC;
		VmB :  OUT  STD_LOGIC;
		trigger_1s :  OUT  STD_LOGIC;
		trigger_5s :  OUT  STD_LOGIC;
		trigger_1min :  OUT  STD_LOGIC
	);
END logica_combinatoria;

ARCHITECTURE bdf_type OF logica_combinatoria IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_9 <= NOT(Q1);



SYNTHESIZED_WIRE_7 <= NOT(Q2);



SYNTHESIZED_WIRE_0 <= Q2 XOR Q1;


AmB <= SYNTHESIZED_WIRE_0 AND Q0;


SYNTHESIZED_WIRE_3 <= NOT(Q2 OR Q1);


SYNTHESIZED_WIRE_2 <= Q2 AND Q1 AND SYNTHESIZED_WIRE_1;


VmB <= SYNTHESIZED_WIRE_2 OR SYNTHESIZED_WIRE_3;


SYNTHESIZED_WIRE_11 <= NOT(Q1);



SYNTHESIZED_WIRE_4 <= NOT(Q0);



SYNTHESIZED_WIRE_6 <= NOT(Q2);



trigger_1min <= SYNTHESIZED_WIRE_4 AND SYNTHESIZED_WIRE_5;


SYNTHESIZED_WIRE_8 <= NOT(Q1);



SYNTHESIZED_WIRE_5 <= SYNTHESIZED_WIRE_6 OR Q1;


trigger_5s <= SYNTHESIZED_WIRE_7 AND Q0;


VdA <= NOT(Q1 OR Q0 OR Q2);


trigger_1s <= Q2 AND SYNTHESIZED_WIRE_8;


AmA <= SYNTHESIZED_WIRE_9 AND Q0;


VmA <= Q1 AND SYNTHESIZED_WIRE_10;


SYNTHESIZED_WIRE_10 <= NOT(Q2 AND Q0);


VdB <= NOT(SYNTHESIZED_WIRE_11 OR Q0 OR Q2);


SYNTHESIZED_WIRE_1 <= NOT(Q0);



END bdf_type;