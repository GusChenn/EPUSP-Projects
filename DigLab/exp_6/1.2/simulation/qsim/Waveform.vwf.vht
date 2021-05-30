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
-- Generated on "04/26/2020 21:09:01"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          fluxo_dados
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fluxo_dados_vhd_vec_tst IS
END fluxo_dados_vhd_vec_tst;
ARCHITECTURE fluxo_dados_arch OF fluxo_dados_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL carrega2 : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL condicao1 : STD_LOGIC;
SIGNAL conta1 : STD_LOGIC;
SIGNAL conta2 : STD_LOGIC;
SIGNAL db_contagem1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL db_fim2 : STD_LOGIC;
SIGNAL fim1 : STD_LOGIC;
SIGNAL saida : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL zera1 : STD_LOGIC;
COMPONENT fluxo_dados
	PORT (
	carrega2 : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	condicao1 : BUFFER STD_LOGIC;
	conta1 : IN STD_LOGIC;
	conta2 : IN STD_LOGIC;
	db_contagem1 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	db_fim2 : BUFFER STD_LOGIC;
	fim1 : BUFFER STD_LOGIC;
	saida : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	zera1 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : fluxo_dados
	PORT MAP (
-- list connections between master ports and signals
	carrega2 => carrega2,
	clock => clock,
	condicao1 => condicao1,
	conta1 => conta1,
	conta2 => conta2,
	db_contagem1 => db_contagem1,
	db_fim2 => db_fim2,
	fim1 => fim1,
	saida => saida,
	zera1 => zera1
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

-- zera1
t_prcs_zera1: PROCESS
BEGIN
	zera1 <= '1';
	WAIT FOR 1600000 ps;
	zera1 <= '0';
WAIT;
END PROCESS t_prcs_zera1;

-- conta1
t_prcs_conta1: PROCESS
BEGIN
	conta1 <= '1';
	WAIT FOR 1600000 ps;
	conta1 <= '0';
	WAIT FOR 1000000 ps;
	conta1 <= '1';
	WAIT FOR 5300000 ps;
	conta1 <= '0';
WAIT;
END PROCESS t_prcs_conta1;

-- carrega2
t_prcs_carrega2: PROCESS
BEGIN
	carrega2 <= '0';
	WAIT FOR 3200000 ps;
	carrega2 <= '1';
	WAIT FOR 1400000 ps;
	carrega2 <= '0';
WAIT;
END PROCESS t_prcs_carrega2;

-- conta2
t_prcs_conta2: PROCESS
BEGIN
	conta2 <= '1';
	WAIT FOR 3900000 ps;
	conta2 <= '0';
	WAIT FOR 1400000 ps;
	conta2 <= '1';
	WAIT FOR 1800000 ps;
	conta2 <= '0';
WAIT;
END PROCESS t_prcs_conta2;
END fluxo_dados_arch;
