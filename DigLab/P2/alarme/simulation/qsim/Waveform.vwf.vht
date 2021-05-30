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
-- Generated on "01/30/2021 16:56:34"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          alarme
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alarme_vhd_vec_tst IS
END alarme_vhd_vec_tst;
ARCHITECTURE alarme_arch OF alarme_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a0 : STD_LOGIC;
SIGNAL a1 : STD_LOGIC;
SIGNAL a2 : STD_LOGIC;
SIGNAL a3 : STD_LOGIC;
SIGNAL alarme : STD_LOGIC;
SIGNAL ck : STD_LOGIC;
COMPONENT alarme
	PORT (
	a0 : IN STD_LOGIC;
	a1 : IN STD_LOGIC;
	a2 : IN STD_LOGIC;
	a3 : IN STD_LOGIC;
	alarme : OUT STD_LOGIC;
	ck : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : alarme
	PORT MAP (
-- list connections between master ports and signals
	a0 => a0,
	a1 => a1,
	a2 => a2,
	a3 => a3,
	alarme => alarme,
	ck => ck
	);

-- ck
t_prcs_ck: PROCESS
BEGIN
LOOP
	ck <= '0';
	WAIT FOR 500 ps;
	ck <= '1';
	WAIT FOR 500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_ck;

-- a0
t_prcs_a0: PROCESS
BEGIN
LOOP
	a0 <= '0';
	WAIT FOR 62500 ps;
	a0 <= '1';
	WAIT FOR 62500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_a0;

-- a1
t_prcs_a1: PROCESS
BEGIN
LOOP
	a1 <= '0';
	WAIT FOR 125000 ps;
	a1 <= '1';
	WAIT FOR 125000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_a1;

-- a2
t_prcs_a2: PROCESS
BEGIN
LOOP
	a2 <= '0';
	WAIT FOR 250000 ps;
	a2 <= '1';
	WAIT FOR 250000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_a2;

-- a3
t_prcs_a3: PROCESS
BEGIN
LOOP
	a3 <= '0';
	WAIT FOR 500000 ps;
	a3 <= '1';
	WAIT FOR 500000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_a3;
END alarme_arch;
