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
-- Generated on "06/23/2020 17:06:12"
                                                             
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
SIGNAL clock : STD_LOGIC;
SIGNAL noturno : STD_LOGIC;
SIGNAL PvA : STD_LOGIC;
SIGNAL PvB : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT logica_combinatoria
	PORT (
	clock : IN STD_LOGIC;
	noturno : IN STD_LOGIC;
	PvA : IN STD_LOGIC;
	PvB : IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : logica_combinatoria
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	noturno => noturno,
	PvA => PvA,
	PvB => PvB,
	Q => Q,
	reset => reset
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 100000 ps;
	clock <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 8000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 800000 ps;
	reset <= '0';
	WAIT FOR 5600000 ps;
	reset <= '1';
	WAIT FOR 1500000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- PvA
t_prcs_PvA: PROCESS
BEGIN
	PvA <= '1';
	WAIT FOR 3100000 ps;
	PvA <= '0';
	WAIT FOR 3300000 ps;
	PvA <= '1';
	WAIT FOR 1000000 ps;
	PvA <= '0';
WAIT;
END PROCESS t_prcs_PvA;

-- PvB
t_prcs_PvB: PROCESS
BEGIN
	PvB <= '1';
	WAIT FOR 2400000 ps;
	PvB <= '0';
	WAIT FOR 1700000 ps;
	PvB <= '1';
	WAIT FOR 800000 ps;
	PvB <= '0';
	WAIT FOR 1500000 ps;
	PvB <= '1';
	WAIT FOR 1000000 ps;
	PvB <= '0';
WAIT;
END PROCESS t_prcs_PvB;

-- noturno
t_prcs_noturno: PROCESS
BEGIN
	noturno <= '0';
	WAIT FOR 5000000 ps;
	noturno <= '1';
	WAIT FOR 1200000 ps;
	noturno <= '0';
WAIT;
END PROCESS t_prcs_noturno;
END logica_combinatoria_arch;
