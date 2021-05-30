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
-- Generated on "05/03/2020 22:45:28"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          temporizador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY temporizador_vhd_vec_tst IS
END temporizador_vhd_vec_tst;
ARCHITECTURE temporizador_arch OF temporizador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL saida : STD_LOGIC;
SIGNAL trigger_1min : STD_LOGIC;
SIGNAL trigger_1s : STD_LOGIC;
SIGNAL trigger_5s : STD_LOGIC;
SIGNAL zera : STD_LOGIC;
COMPONENT temporizador
	PORT (
	clock : IN STD_LOGIC;
	saida : BUFFER STD_LOGIC;
	trigger_1min : IN STD_LOGIC;
	trigger_1s : IN STD_LOGIC;
	trigger_5s : IN STD_LOGIC;
	zera : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : temporizador
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	saida => saida,
	trigger_1min => trigger_1min,
	trigger_1s => trigger_1s,
	trigger_5s => trigger_5s,
	zera => zera
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 10000 ps;
	clock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 100000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- zera
t_prcs_zera: PROCESS
BEGIN
	zera <= '0';
	WAIT FOR 1040000 ps;
	zera <= '1';
	WAIT FOR 20000 ps;
	zera <= '0';
	WAIT FOR 6620000 ps;
	zera <= '1';
	WAIT FOR 20000 ps;
	zera <= '0';
	WAIT FOR 65260000 ps;
	zera <= '1';
	WAIT FOR 20000 ps;
	zera <= '0';
	WAIT FOR 14060000 ps;
	zera <= '1';
	WAIT FOR 20000 ps;
	zera <= '0';
WAIT;
END PROCESS t_prcs_zera;

-- trigger_1s
t_prcs_trigger_1s: PROCESS
BEGIN
	trigger_1s <= '1';
	WAIT FOR 1040000 ps;
	trigger_1s <= '0';
WAIT;
END PROCESS t_prcs_trigger_1s;

-- trigger_5s
t_prcs_trigger_5s: PROCESS
BEGIN
	trigger_5s <= '0';
	WAIT FOR 1060000 ps;
	trigger_5s <= '1';
	WAIT FOR 6620000 ps;
	trigger_5s <= '0';
	WAIT FOR 65300000 ps;
	trigger_5s <= '1';
	WAIT FOR 14060000 ps;
	trigger_5s <= '0';
WAIT;
END PROCESS t_prcs_trigger_5s;

-- trigger_1min
t_prcs_trigger_1min: PROCESS
BEGIN
	trigger_1min <= '0';
	WAIT FOR 7700000 ps;
	trigger_1min <= '1';
	WAIT FOR 65260000 ps;
	trigger_1min <= '0';
WAIT;
END PROCESS t_prcs_trigger_1min;
END temporizador_arch;
