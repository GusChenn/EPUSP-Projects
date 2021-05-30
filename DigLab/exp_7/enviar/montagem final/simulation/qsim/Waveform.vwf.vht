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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/23/2020 18:21:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          montagem
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY montagem_vhd_vec_tst IS
END montagem_vhd_vec_tst;
ARCHITECTURE montagem_arch OF montagem_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AmA : STD_LOGIC;
SIGNAL AmB : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL noturno : STD_LOGIC;
SIGNAL pin_name1 : STD_LOGIC;
SIGNAL PvA : STD_LOGIC;
SIGNAL PvB : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL trigger_1min : STD_LOGIC;
SIGNAL trigger_1s : STD_LOGIC;
SIGNAL trigger_5s : STD_LOGIC;
SIGNAL VdA : STD_LOGIC;
SIGNAL VdB : STD_LOGIC;
SIGNAL VmA : STD_LOGIC;
SIGNAL VmB : STD_LOGIC;
COMPONENT montagem
	PORT (
	AmA : OUT STD_LOGIC;
	AmB : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	noturno : IN STD_LOGIC;
	pin_name1 : OUT STD_LOGIC;
	PvA : IN STD_LOGIC;
	PvB : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	trigger_1min : OUT STD_LOGIC;
	trigger_1s : OUT STD_LOGIC;
	trigger_5s : OUT STD_LOGIC;
	VdA : OUT STD_LOGIC;
	VdB : OUT STD_LOGIC;
	VmA : OUT STD_LOGIC;
	VmB : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : montagem
	PORT MAP (
-- list connections between master ports and signals
	AmA => AmA,
	AmB => AmB,
	clock => clock,
	noturno => noturno,
	pin_name1 => pin_name1,
	PvA => PvA,
	PvB => PvB,
	reset => reset,
	trigger_1min => trigger_1min,
	trigger_1s => trigger_1s,
	trigger_5s => trigger_5s,
	VdA => VdA,
	VdB => VdB,
	VmA => VmA,
	VmB => VmB
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 50 ps;
	clock <= '1';
	WAIT FOR 50 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- noturno
t_prcs_noturno: PROCESS
BEGIN
	noturno <= '0';
WAIT;
END PROCESS t_prcs_noturno;

-- PvA
t_prcs_PvA: PROCESS
BEGIN
	PvA <= '1';
	WAIT FOR 540000 ps;
	PvA <= '0';
WAIT;
END PROCESS t_prcs_PvA;

-- PvB
t_prcs_PvB: PROCESS
BEGIN
	PvB <= '1';
	WAIT FOR 540000 ps;
	PvB <= '0';
WAIT;
END PROCESS t_prcs_PvB;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 20000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END montagem_arch;
