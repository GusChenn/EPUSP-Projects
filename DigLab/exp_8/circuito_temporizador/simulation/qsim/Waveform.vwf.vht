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
-- Generated on "05/24/2020 23:56:14"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          circuito_temporizador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY circuito_temporizador_vhd_vec_tst IS
END circuito_temporizador_vhd_vec_tst;
ARCHITECTURE circuito_temporizador_arch OF circuito_temporizador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL Desliga : STD_LOGIC;
SIGNAL lampada : STD_LOGIC;
SIGNAL Liga : STD_LOGIC;
SIGNAL out_12horas : STD_LOGIC;
SIGNAL out_hora : STD_LOGIC;
SIGNAL out_minuto : STD_LOGIC;
SIGNAL out_segundo : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
COMPONENT circuito_temporizador
	PORT (
	clock : IN STD_LOGIC;
	Desliga : IN STD_LOGIC;
	lampada : OUT STD_LOGIC;
	Liga : IN STD_LOGIC;
	out_12horas : OUT STD_LOGIC;
	out_hora : OUT STD_LOGIC;
	out_minuto : OUT STD_LOGIC;
	out_segundo : OUT STD_LOGIC;
	Reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : circuito_temporizador
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	Desliga => Desliga,
	lampada => lampada,
	Liga => Liga,
	out_12horas => out_12horas,
	out_hora => out_hora,
	out_minuto => out_minuto,
	out_segundo => out_segundo,
	Reset => Reset
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

-- Reset
t_prcs_Reset: PROCESS
BEGIN
	Reset <= '0';
	WAIT FOR 300000 ps;
	Reset <= '1';
	WAIT FOR 10000 ps;
	Reset <= '0';
WAIT;
END PROCESS t_prcs_Reset;

-- Liga
t_prcs_Liga: PROCESS
BEGIN
	Liga <= '0';
	WAIT FOR 70000 ps;
	Liga <= '1';
	WAIT FOR 60000 ps;
	Liga <= '0';
	WAIT FOR 100000 ps;
	Liga <= '1';
	WAIT FOR 80000 ps;
	Liga <= '0';
	WAIT FOR 250000 ps;
	Liga <= '1';
	WAIT FOR 160000 ps;
	Liga <= '0';
WAIT;
END PROCESS t_prcs_Liga;

-- Desliga
t_prcs_Desliga: PROCESS
BEGIN
	Desliga <= '0';
	WAIT FOR 40000 ps;
	Desliga <= '1';
	WAIT FOR 30000 ps;
	Desliga <= '0';
	WAIT FOR 30000 ps;
	Desliga <= '1';
	WAIT FOR 30000 ps;
	Desliga <= '0';
	WAIT FOR 30000 ps;
	Desliga <= '1';
	WAIT FOR 30000 ps;
	Desliga <= '0';
	WAIT FOR 30000 ps;
	Desliga <= '1';
	WAIT FOR 30000 ps;
	Desliga <= '0';
	WAIT FOR 30000 ps;
	Desliga <= '1';
	WAIT FOR 30000 ps;
	Desliga <= '0';
	WAIT FOR 90000 ps;
	Desliga <= '1';
	WAIT FOR 20000 ps;
	Desliga <= '0';
WAIT;
END PROCESS t_prcs_Desliga;
END circuito_temporizador_arch;
