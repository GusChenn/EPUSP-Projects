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
-- CREATED		"Sun Apr 26 22:59:33 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY circuito4 IS 
	PORT
	(
		clock :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		iniciar :  IN  STD_LOGIC;
		pronto :  OUT  STD_LOGIC;
		db_fim2 :  OUT  STD_LOGIC;
		fim1 :  OUT  STD_LOGIC;
		db_contagem1 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		db_estado :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		saida :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END circuito4;

ARCHITECTURE bdf_type OF circuito4 IS 

COMPONENT fluxo_dados
	PORT(clock : IN STD_LOGIC;
		 zera1 : IN STD_LOGIC;
		 conta1 : IN STD_LOGIC;
		 conta2 : IN STD_LOGIC;
		 carrega2 : IN STD_LOGIC;
		 fim1 : OUT STD_LOGIC;
		 condicao1 : OUT STD_LOGIC;
		 db_fim2 : OUT STD_LOGIC;
		 db_contagem1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 saida : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT maquina_estados
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 iniciar : IN STD_LOGIC;
		 condicao1 : IN STD_LOGIC;
		 fim : IN STD_LOGIC;
		 pronto : OUT STD_LOGIC;
		 zera1 : OUT STD_LOGIC;
		 conta1 : OUT STD_LOGIC;
		 conta2 : OUT STD_LOGIC;
		 carrega2 : OUT STD_LOGIC;
		 db_estado : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	2_carrega2 :  STD_LOGIC;
SIGNAL	s_condicao1 :  STD_LOGIC;
SIGNAL	s_conta1 :  STD_LOGIC;
SIGNAL	s_conta2 :  STD_LOGIC;
SIGNAL	s_fim1 :  STD_LOGIC;
SIGNAL	s_zera1 :  STD_LOGIC;


BEGIN 



b2v_inst : fluxo_dados
PORT MAP(clock => clock,
		 zera1 => s_zera1,
		 conta1 => s_conta1,
		 conta2 => s_conta2,
		 carrega2 => 2_carrega2,
		 fim1 => s_fim1,
		 condicao1 => s_condicao1,
		 db_fim2 => db_fim2,
		 db_contagem1 => db_contagem1,
		 saida => saida);


b2v_inst1 : maquina_estados
PORT MAP(clock => clock,
		 reset => reset,
		 iniciar => iniciar,
		 condicao1 => s_condicao1,
		 fim => s_fim1,
		 pronto => pronto,
		 zera1 => s_zera1,
		 conta1 => s_conta1,
		 conta2 => s_conta2,
		 carrega2 => 2_carrega2,
		 db_estado => db_estado);

fim1 <= s_fim1;

END bdf_type;