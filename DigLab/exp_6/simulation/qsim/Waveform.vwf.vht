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
-- Generated on "04/26/2020 20:54:57"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          maquina_estados
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY maquina_estados_vhd_vec_tst IS
END maquina_estados_vhd_vec_tst;
ARCHITECTURE maquina_estados_arch OF maquina_estados_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL carrega2 : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL condicao1 : STD_LOGIC;
SIGNAL conta1 : STD_LOGIC;
SIGNAL conta2 : STD_LOGIC;
SIGNAL db_estado : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL fim : STD_LOGIC;
SIGNAL iniciar : STD_LOGIC;
SIGNAL pronto : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL zera1 : STD_LOGIC;
COMPONENT maquina_estados
	PORT (
	carrega2 : BUFFER STD_LOGIC;
	clock : IN STD_LOGIC;
	condicao1 : IN STD_LOGIC;
	conta1 : BUFFER STD_LOGIC;
	conta2 : BUFFER STD_LOGIC;
	db_estado : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	fim : IN STD_LOGIC;
	iniciar : IN STD_LOGIC;
	pronto : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC;
	zera1 : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : maquina_estados
	PORT MAP (
-- list connections between master ports and signals
	carrega2 => carrega2,
	clock => clock,
	condicao1 => condicao1,
	conta1 => conta1,
	conta2 => conta2,
	db_estado => db_estado,
	fim => fim,
	iniciar => iniciar,
	pronto => pronto,
	reset => reset,
	zera1 => zera1
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 50000 ps;
	clock <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 2000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 50000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- iniciar
t_prcs_iniciar: PROCESS
BEGIN
	iniciar <= '0';
	WAIT FOR 150000 ps;
	iniciar <= '1';
	WAIT FOR 100000 ps;
	iniciar <= '0';
WAIT;
END PROCESS t_prcs_iniciar;

-- condicao1
t_prcs_condicao1: PROCESS
BEGIN
	condicao1 <= '0';
	WAIT FOR 400000 ps;
	condicao1 <= '1';
	WAIT FOR 350000 ps;
	condicao1 <= '0';
	WAIT FOR 200000 ps;
	condicao1 <= '1';
	WAIT FOR 100000 ps;
	condicao1 <= '0';
	WAIT FOR 200000 ps;
	condicao1 <= '1';
	WAIT FOR 200000 ps;
	condicao1 <= '0';
WAIT;
END PROCESS t_prcs_condicao1;

-- fim
t_prcs_fim: PROCESS
BEGIN
	fim <= '0';
	WAIT FOR 1750000 ps;
	fim <= '1';
	WAIT FOR 100000 ps;
	fim <= '0';
WAIT;
END PROCESS t_prcs_fim;
END maquina_estados_arch;
