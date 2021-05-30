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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "04/26/2020 20:54:59"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	maquina_estados IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	iniciar : IN std_logic;
	condicao1 : IN std_logic;
	fim : IN std_logic;
	pronto : BUFFER std_logic;
	zera1 : BUFFER std_logic;
	conta1 : BUFFER std_logic;
	conta2 : BUFFER std_logic;
	carrega2 : BUFFER std_logic;
	db_estado : BUFFER std_logic_vector(2 DOWNTO 0)
	);
END maquina_estados;

ARCHITECTURE structure OF maquina_estados IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_iniciar : std_logic;
SIGNAL ww_condicao1 : std_logic;
SIGNAL ww_fim : std_logic;
SIGNAL ww_pronto : std_logic;
SIGNAL ww_zera1 : std_logic;
SIGNAL ww_conta1 : std_logic;
SIGNAL ww_conta2 : std_logic;
SIGNAL ww_carrega2 : std_logic;
SIGNAL ww_db_estado : std_logic_vector(2 DOWNTO 0);
SIGNAL \pronto~output_o\ : std_logic;
SIGNAL \zera1~output_o\ : std_logic;
SIGNAL \conta1~output_o\ : std_logic;
SIGNAL \conta2~output_o\ : std_logic;
SIGNAL \carrega2~output_o\ : std_logic;
SIGNAL \db_estado[0]~output_o\ : std_logic;
SIGNAL \db_estado[1]~output_o\ : std_logic;
SIGNAL \db_estado[2]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \iniciar~input_o\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \Eatual.inicial~q\ : std_logic;
SIGNAL \Eprox.zeraconts~0_combout\ : std_logic;
SIGNAL \Eatual.zeraconts~q\ : std_logic;
SIGNAL \fim~input_o\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Eatual.testacondicao1~q\ : std_logic;
SIGNAL \condicao1~input_o\ : std_logic;
SIGNAL \Eprox.contacont2~0_combout\ : std_logic;
SIGNAL \Eatual.contacont2~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Eatual.contacont1~q\ : std_logic;
SIGNAL \Eatual.testafim~q\ : std_logic;
SIGNAL \Eprox.final~0_combout\ : std_logic;
SIGNAL \Eatual.final~q\ : std_logic;
SIGNAL \WideOr5~0_combout\ : std_logic;
SIGNAL \WideOr4~0_combout\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \ALT_INV_condicao1~input_o\ : std_logic;
SIGNAL \ALT_INV_iniciar~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_fim~input_o\ : std_logic;
SIGNAL \ALT_INV_Eatual.final~q\ : std_logic;
SIGNAL \ALT_INV_Eatual.zeraconts~q\ : std_logic;
SIGNAL \ALT_INV_Eatual.contacont1~q\ : std_logic;
SIGNAL \ALT_INV_Eatual.contacont2~q\ : std_logic;
SIGNAL \ALT_INV_Eatual.testafim~q\ : std_logic;
SIGNAL \ALT_INV_Eatual.testacondicao1~q\ : std_logic;
SIGNAL \ALT_INV_Eatual.inicial~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_iniciar <= iniciar;
ww_condicao1 <= condicao1;
ww_fim <= fim;
pronto <= ww_pronto;
zera1 <= ww_zera1;
conta1 <= ww_conta1;
conta2 <= ww_conta2;
carrega2 <= ww_carrega2;
db_estado <= ww_db_estado;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_condicao1~input_o\ <= NOT \condicao1~input_o\;
\ALT_INV_iniciar~input_o\ <= NOT \iniciar~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_fim~input_o\ <= NOT \fim~input_o\;
\ALT_INV_Eatual.final~q\ <= NOT \Eatual.final~q\;
\ALT_INV_Eatual.zeraconts~q\ <= NOT \Eatual.zeraconts~q\;
\ALT_INV_Eatual.contacont1~q\ <= NOT \Eatual.contacont1~q\;
\ALT_INV_Eatual.contacont2~q\ <= NOT \Eatual.contacont2~q\;
\ALT_INV_Eatual.testafim~q\ <= NOT \Eatual.testafim~q\;
\ALT_INV_Eatual.testacondicao1~q\ <= NOT \Eatual.testacondicao1~q\;
\ALT_INV_Eatual.inicial~q\ <= NOT \Eatual.inicial~q\;

\pronto~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Eatual.final~q\,
	devoe => ww_devoe,
	o => \pronto~output_o\);

\zera1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Eatual.zeraconts~q\,
	devoe => ww_devoe,
	o => \zera1~output_o\);

\conta1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Eatual.contacont1~q\,
	devoe => ww_devoe,
	o => \conta1~output_o\);

\conta2~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Eatual.contacont2~q\,
	devoe => ww_devoe,
	o => \conta2~output_o\);

\carrega2~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Eatual.zeraconts~q\,
	devoe => ww_devoe,
	o => \carrega2~output_o\);

\db_estado[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr5~0_combout\,
	devoe => ww_devoe,
	o => \db_estado[0]~output_o\);

\db_estado[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \db_estado[1]~output_o\);

\db_estado[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr3~0_combout\,
	devoe => ww_devoe,
	o => \db_estado[2]~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\iniciar~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iniciar,
	o => \iniciar~input_o\);

\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (!\Eatual.final~q\ & ((\Eatual.inicial~q\) # (\iniciar~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000101010001010100010101000101010001010100010101000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.final~q\,
	datab => \ALT_INV_iniciar~input_o\,
	datac => \ALT_INV_Eatual.inicial~q\,
	combout => \Selector0~0_combout\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\Eatual.inicial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Eatual.inicial~q\);

\Eprox.zeraconts~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Eprox.zeraconts~0_combout\ = (\iniciar~input_o\ & !\Eatual.inicial~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iniciar~input_o\,
	datab => \ALT_INV_Eatual.inicial~q\,
	combout => \Eprox.zeraconts~0_combout\);

\Eatual.zeraconts\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Eprox.zeraconts~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Eatual.zeraconts~q\);

\fim~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fim,
	o => \fim~input_o\);

\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ((\Eatual.testafim~q\ & !\fim~input_o\)) # (\Eatual.zeraconts~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010101110101011101010111010101110101011101010111010101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.zeraconts~q\,
	datab => \ALT_INV_Eatual.testafim~q\,
	datac => \ALT_INV_fim~input_o\,
	combout => \Selector1~0_combout\);

\Eatual.testacondicao1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Eatual.testacondicao1~q\);

\condicao1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_condicao1,
	o => \condicao1~input_o\);

\Eprox.contacont2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Eprox.contacont2~0_combout\ = (\Eatual.testacondicao1~q\ & \condicao1~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.testacondicao1~q\,
	datab => \ALT_INV_condicao1~input_o\,
	combout => \Eprox.contacont2~0_combout\);

\Eatual.contacont2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Eprox.contacont2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Eatual.contacont2~q\);

\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ((\Eatual.testacondicao1~q\ & !\condicao1~input_o\)) # (\Eatual.contacont2~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010101110101011101010111010101110101011101010111010101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.contacont2~q\,
	datab => \ALT_INV_Eatual.testacondicao1~q\,
	datac => \ALT_INV_condicao1~input_o\,
	combout => \Selector2~0_combout\);

\Eatual.contacont1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Selector2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Eatual.contacont1~q\);

\Eatual.testafim\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Eatual.contacont1~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Eatual.testafim~q\);

\Eprox.final~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Eprox.final~0_combout\ = (\Eatual.testafim~q\ & \fim~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.testafim~q\,
	datab => \ALT_INV_fim~input_o\,
	combout => \Eprox.final~0_combout\);

\Eatual.final\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Eprox.final~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Eatual.final~q\);

\WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr5~0_combout\ = ((\Eatual.testafim~q\) # (\Eatual.contacont2~q\)) # (\Eatual.zeraconts~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111101111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.zeraconts~q\,
	datab => \ALT_INV_Eatual.contacont2~q\,
	datac => \ALT_INV_Eatual.testafim~q\,
	combout => \WideOr5~0_combout\);

\WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr4~0_combout\ = ((\Eatual.testacondicao1~q\) # (\Eatual.contacont2~q\)) # (\Eatual.final~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111101111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.final~q\,
	datab => \ALT_INV_Eatual.contacont2~q\,
	datac => \ALT_INV_Eatual.testacondicao1~q\,
	combout => \WideOr4~0_combout\);

\WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = ((\Eatual.testafim~q\) # (\Eatual.contacont1~q\)) # (\Eatual.final~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111101111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Eatual.final~q\,
	datab => \ALT_INV_Eatual.contacont1~q\,
	datac => \ALT_INV_Eatual.testafim~q\,
	combout => \WideOr3~0_combout\);

ww_pronto <= \pronto~output_o\;

ww_zera1 <= \zera1~output_o\;

ww_conta1 <= \conta1~output_o\;

ww_conta2 <= \conta2~output_o\;

ww_carrega2 <= \carrega2~output_o\;

ww_db_estado(0) <= \db_estado[0]~output_o\;

ww_db_estado(1) <= \db_estado[1]~output_o\;

ww_db_estado(2) <= \db_estado[2]~output_o\;
END structure;


