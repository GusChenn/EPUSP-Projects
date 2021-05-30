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
-- Generated on "04/26/2020 23:04:14"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          circuito4
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY circuito4_vhd_vec_tst IS
END circuito4_vhd_vec_tst;
ARCHITECTURE circuito4_arch OF circuito4_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL db_contagem1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL db_estado : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL db_fim2 : STD_LOGIC;
SIGNAL fim1 : STD_LOGIC;
SIGNAL iniciar : STD_LOGIC;
SIGNAL pronto : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL saida : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT circuito4
	PORT (
	clock : IN STD_LOGIC;
	db_contagem1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	db_estado : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	db_fim2 : OUT STD_LOGIC;
	fim1 : OUT STD_LOGIC;
	iniciar : IN STD_LOGIC;
	pronto : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	saida : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : circuito4
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	db_contagem1 => db_contagem1,
	db_estado => db_estado,
	db_fim2 => db_fim2,
	fim1 => fim1,
	iniciar => iniciar,
	pronto => pronto,
	reset => reset,
	saida => saida
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 50000 ps;
	clock <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 8000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- iniciar
t_prcs_iniciar: PROCESS
BEGIN
	iniciar <= '0';
	WAIT FOR 900000 ps;
	iniciar <= '1';
	WAIT FOR 300000 ps;
	iniciar <= '0';
WAIT;
END PROCESS t_prcs_iniciar;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 5100000 ps;
	reset <= '1';
	WAIT FOR 300000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END circuito4_arch;
