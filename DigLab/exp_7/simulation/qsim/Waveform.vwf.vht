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
-- Generated on "05/03/2020 23:05:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          logica_combinatoria
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY logica_combinatoria_vhd_vec_tst IS
END logica_combinatoria_vhd_vec_tst;
ARCHITECTURE logica_combinatoria_arch OF logica_combinatoria_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AmA : STD_LOGIC;
SIGNAL AmB : STD_LOGIC;
SIGNAL Q0 : STD_LOGIC;
SIGNAL Q1 : STD_LOGIC;
SIGNAL Q2 : STD_LOGIC;
SIGNAL trigger_1min : STD_LOGIC;
SIGNAL trigger_1s : STD_LOGIC;
SIGNAL trigger_5s : STD_LOGIC;
SIGNAL VdA : STD_LOGIC;
SIGNAL VdB : STD_LOGIC;
SIGNAL VmA : STD_LOGIC;
SIGNAL VmB : STD_LOGIC;
COMPONENT logica_combinatoria
	PORT (
	AmA : OUT STD_LOGIC;
	AmB : OUT STD_LOGIC;
	Q0 : IN STD_LOGIC;
	Q1 : IN STD_LOGIC;
	Q2 : IN STD_LOGIC;
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
	i1 : logica_combinatoria
	PORT MAP (
-- list connections between master ports and signals
	AmA => AmA,
	AmB => AmB,
	Q0 => Q0,
	Q1 => Q1,
	Q2 => Q2,
	trigger_1min => trigger_1min,
	trigger_1s => trigger_1s,
	trigger_5s => trigger_5s,
	VdA => VdA,
	VdB => VdB,
	VmA => VmA,
	VmB => VmB
	);

-- Q2
t_prcs_Q2: PROCESS
BEGIN
	Q2 <= '0';
	WAIT FOR 1600000 ps;
	Q2 <= '1';
	WAIT FOR 1600000 ps;
	Q2 <= '0';
WAIT;
END PROCESS t_prcs_Q2;

-- Q1
t_prcs_Q1: PROCESS
BEGIN
	Q1 <= '0';
	WAIT FOR 800000 ps;
	Q1 <= '1';
	WAIT FOR 800000 ps;
	Q1 <= '0';
	WAIT FOR 800000 ps;
	Q1 <= '1';
	WAIT FOR 800000 ps;
	Q1 <= '0';
WAIT;
END PROCESS t_prcs_Q1;

-- Q0
t_prcs_Q0: PROCESS
BEGIN
	Q0 <= '0';
	WAIT FOR 400000 ps;
	Q0 <= '1';
	WAIT FOR 400000 ps;
	Q0 <= '0';
	WAIT FOR 400000 ps;
	Q0 <= '1';
	WAIT FOR 400000 ps;
	Q0 <= '0';
	WAIT FOR 400000 ps;
	Q0 <= '1';
	WAIT FOR 400000 ps;
	Q0 <= '0';
	WAIT FOR 400000 ps;
	Q0 <= '1';
	WAIT FOR 400000 ps;
	Q0 <= '0';
WAIT;
END PROCESS t_prcs_Q0;
END logica_combinatoria_arch;
