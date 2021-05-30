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

-- DATE "04/26/2020 23:04:17"

-- 
-- Device: Altera 5CEFA4F23C7 Package FBGA484
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

ENTITY 	circuito4 IS
    PORT (
	pronto : OUT std_logic;
	clock : IN std_logic;
	reset : IN std_logic;
	iniciar : IN std_logic;
	db_fim2 : OUT std_logic;
	fim1 : OUT std_logic;
	db_contagem1 : OUT std_logic_vector(3 DOWNTO 0);
	db_estado : OUT std_logic_vector(2 DOWNTO 0);
	saida : OUT std_logic_vector(3 DOWNTO 0)
	);
END circuito4;

-- Design Ports Information
-- pronto	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_fim2	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fim1	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_contagem1[3]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_contagem1[2]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_contagem1[1]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_contagem1[0]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_estado[2]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_estado[1]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_estado[0]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida[3]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida[2]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida[1]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- saida[0]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iniciar	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF circuito4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_pronto : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_iniciar : std_logic;
SIGNAL ww_db_fim2 : std_logic;
SIGNAL ww_fim1 : std_logic;
SIGNAL ww_db_contagem1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_db_estado : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_saida : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \iniciar~input_o\ : std_logic;
SIGNAL \inst1|Selector0~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \inst1|Eatual.inicial~q\ : std_logic;
SIGNAL \inst1|Eprox.zeraconts~0_combout\ : std_logic;
SIGNAL \inst1|Eatual.zeraconts~q\ : std_logic;
SIGNAL \inst1|Eatual.testafim~q\ : std_logic;
SIGNAL \inst1|Eatual.contacont1~DUPLICATE_q\ : std_logic;
SIGNAL \inst|IQ1[0]~3_combout\ : std_logic;
SIGNAL \inst|IQ1[1]~2_combout\ : std_logic;
SIGNAL \inst|IQ1[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|IQ1[2]~1_combout\ : std_logic;
SIGNAL \inst|IQ1[3]~0_combout\ : std_logic;
SIGNAL \inst|IQ1[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|Selector1~0_combout\ : std_logic;
SIGNAL \inst1|Eatual.testacondicao1~q\ : std_logic;
SIGNAL \inst|IQ1[3]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|Eprox.contacont2~0_combout\ : std_logic;
SIGNAL \inst1|Eatual.contacont2~feeder_combout\ : std_logic;
SIGNAL \inst1|Eatual.contacont2~q\ : std_logic;
SIGNAL \inst1|Selector2~0_combout\ : std_logic;
SIGNAL \inst1|Eatual.contacont1~q\ : std_logic;
SIGNAL \inst1|Eatual.testafim~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|Eprox.final~0_combout\ : std_logic;
SIGNAL \inst1|Eatual.final~q\ : std_logic;
SIGNAL \inst|IQ2[2]~1_combout\ : std_logic;
SIGNAL \inst|IQ2~4_combout\ : std_logic;
SIGNAL \inst|IQ2[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|IQ2~3_combout\ : std_logic;
SIGNAL \inst|IQ2[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|IQ2~2_combout\ : std_logic;
SIGNAL \inst|IQ2~0_combout\ : std_logic;
SIGNAL \inst|IQ2[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|IQ1[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|Equal1~0_combout\ : std_logic;
SIGNAL \inst1|WideOr3~0_combout\ : std_logic;
SIGNAL \inst1|WideOr4~0_combout\ : std_logic;
SIGNAL \inst1|WideOr5~0_combout\ : std_logic;
SIGNAL \inst|IQ2\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|IQ1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|ALT_INV_IQ2\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|ALT_INV_Eatual.final~q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|ALT_INV_Eatual.contacont1~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Eatual.testafim~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Eatual.testacondicao1~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Eatual.contacont2~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Eatual.zeraconts~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Eatual.testafim~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_Eatual.contacont1~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ1[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ1[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ1[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ1[3]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ2[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ2[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_IQ2[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_iniciar~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \inst1|ALT_INV_Eatual.inicial~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Eprox.contacont2~0_combout\ : std_logic;

BEGIN

pronto <= ww_pronto;
ww_clock <= clock;
ww_reset <= reset;
ww_iniciar <= iniciar;
db_fim2 <= ww_db_fim2;
fim1 <= ww_fim1;
db_contagem1 <= ww_db_contagem1;
db_estado <= ww_db_estado;
saida <= ww_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst|ALT_INV_IQ2\(3) <= NOT \inst|IQ2\(3);
\inst1|ALT_INV_Eatual.final~q\ <= NOT \inst1|Eatual.final~q\;
\inst|ALT_INV_IQ2\(2) <= NOT \inst|IQ2\(2);
\inst|ALT_INV_IQ2\(1) <= NOT \inst|IQ2\(1);
\inst|ALT_INV_IQ2\(0) <= NOT \inst|IQ2\(0);
\inst|ALT_INV_IQ1\(3) <= NOT \inst|IQ1\(3);
\inst|ALT_INV_IQ1\(2) <= NOT \inst|IQ1\(2);
\inst|ALT_INV_IQ1\(1) <= NOT \inst|IQ1\(1);
\inst|ALT_INV_IQ1\(0) <= NOT \inst|IQ1\(0);
\inst1|ALT_INV_Eatual.contacont1~q\ <= NOT \inst1|Eatual.contacont1~q\;
\inst1|ALT_INV_Eatual.testafim~q\ <= NOT \inst1|Eatual.testafim~q\;
\inst1|ALT_INV_Eatual.testacondicao1~q\ <= NOT \inst1|Eatual.testacondicao1~q\;
\inst1|ALT_INV_Eatual.contacont2~q\ <= NOT \inst1|Eatual.contacont2~q\;
\inst1|ALT_INV_Eatual.zeraconts~q\ <= NOT \inst1|Eatual.zeraconts~q\;
\inst1|ALT_INV_Eatual.testafim~DUPLICATE_q\ <= NOT \inst1|Eatual.testafim~DUPLICATE_q\;
\inst1|ALT_INV_Eatual.contacont1~DUPLICATE_q\ <= NOT \inst1|Eatual.contacont1~DUPLICATE_q\;
\inst|ALT_INV_IQ1[0]~DUPLICATE_q\ <= NOT \inst|IQ1[0]~DUPLICATE_q\;
\inst|ALT_INV_IQ1[1]~DUPLICATE_q\ <= NOT \inst|IQ1[1]~DUPLICATE_q\;
\inst|ALT_INV_IQ1[2]~DUPLICATE_q\ <= NOT \inst|IQ1[2]~DUPLICATE_q\;
\inst|ALT_INV_IQ1[3]~DUPLICATE_q\ <= NOT \inst|IQ1[3]~DUPLICATE_q\;
\inst|ALT_INV_IQ2[0]~DUPLICATE_q\ <= NOT \inst|IQ2[0]~DUPLICATE_q\;
\inst|ALT_INV_IQ2[1]~DUPLICATE_q\ <= NOT \inst|IQ2[1]~DUPLICATE_q\;
\inst|ALT_INV_IQ2[2]~DUPLICATE_q\ <= NOT \inst|IQ2[2]~DUPLICATE_q\;
\ALT_INV_iniciar~input_o\ <= NOT \iniciar~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\inst1|ALT_INV_Eatual.inicial~q\ <= NOT \inst1|Eatual.inicial~q\;
\inst1|ALT_INV_Eprox.contacont2~0_combout\ <= NOT \inst1|Eprox.contacont2~0_combout\;

-- Location: IOOBUF_X0_Y20_N22
\pronto~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Eatual.final~q\,
	devoe => ww_devoe,
	o => ww_pronto);

-- Location: IOOBUF_X0_Y19_N5
\db_fim2~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Equal0~0_combout\,
	devoe => ww_devoe,
	o => ww_db_fim2);

-- Location: IOOBUF_X0_Y21_N22
\fim1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Equal1~0_combout\,
	devoe => ww_devoe,
	o => ww_fim1);

-- Location: IOOBUF_X0_Y21_N5
\db_contagem1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ1[3]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_db_contagem1(3));

-- Location: IOOBUF_X0_Y21_N56
\db_contagem1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ1[2]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_db_contagem1(2));

-- Location: IOOBUF_X0_Y21_N39
\db_contagem1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ1[1]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_db_contagem1(1));

-- Location: IOOBUF_X0_Y20_N39
\db_contagem1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ1[0]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_db_contagem1(0));

-- Location: IOOBUF_X0_Y18_N45
\db_estado[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_db_estado(2));

-- Location: IOOBUF_X0_Y18_N62
\db_estado[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|WideOr4~0_combout\,
	devoe => ww_devoe,
	o => ww_db_estado(1));

-- Location: IOOBUF_X0_Y20_N56
\db_estado[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|WideOr5~0_combout\,
	devoe => ww_devoe,
	o => ww_db_estado(0));

-- Location: IOOBUF_X0_Y18_N79
\saida[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ2\(3),
	devoe => ww_devoe,
	o => ww_saida(3));

-- Location: IOOBUF_X0_Y19_N22
\saida[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ2[2]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_saida(2));

-- Location: IOOBUF_X0_Y19_N56
\saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ2[1]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_saida(1));

-- Location: IOOBUF_X0_Y19_N39
\saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|IQ2[0]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_saida(0));

-- Location: IOIBUF_X54_Y18_N61
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G10
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X0_Y18_N95
\iniciar~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iniciar,
	o => \iniciar~input_o\);

-- Location: LABCELL_X1_Y26_N27
\inst1|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector0~0_combout\ = ( !\inst1|Eatual.final~q\ & ( (\inst1|Eatual.inicial~q\) # (\iniciar~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iniciar~input_o\,
	datad => \inst1|ALT_INV_Eatual.inicial~q\,
	dataf => \inst1|ALT_INV_Eatual.final~q\,
	combout => \inst1|Selector0~0_combout\);

-- Location: IOIBUF_X0_Y20_N4
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X1_Y26_N28
\inst1|Eatual.inicial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst1|Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.inicial~q\);

-- Location: LABCELL_X1_Y26_N24
\inst1|Eprox.zeraconts~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Eprox.zeraconts~0_combout\ = ( !\inst1|Eatual.inicial~q\ & ( \iniciar~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iniciar~input_o\,
	dataf => \inst1|ALT_INV_Eatual.inicial~q\,
	combout => \inst1|Eprox.zeraconts~0_combout\);

-- Location: FF_X1_Y26_N26
\inst1|Eatual.zeraconts\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst1|Eprox.zeraconts~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.zeraconts~q\);

-- Location: FF_X1_Y26_N49
\inst1|Eatual.testafim\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \inst1|Eatual.contacont1~q\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.testafim~q\);

-- Location: FF_X1_Y26_N58
\inst1|Eatual.contacont1~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst1|Selector2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.contacont1~DUPLICATE_q\);

-- Location: LABCELL_X1_Y26_N21
\inst|IQ1[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ1[0]~3_combout\ = ( \inst1|Eatual.contacont1~DUPLICATE_q\ & ( !\inst|IQ1\(0) ) ) # ( !\inst1|Eatual.contacont1~DUPLICATE_q\ & ( \inst|IQ1\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_IQ1\(0),
	dataf => \inst1|ALT_INV_Eatual.contacont1~DUPLICATE_q\,
	combout => \inst|IQ1[0]~3_combout\);

-- Location: FF_X1_Y26_N23
\inst|IQ1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[0]~3_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1\(0));

-- Location: LABCELL_X1_Y26_N30
\inst|IQ1[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ1[1]~2_combout\ = ( \inst|IQ1\(1) & ( \inst1|Eatual.contacont1~DUPLICATE_q\ & ( !\inst|IQ1\(0) ) ) ) # ( !\inst|IQ1\(1) & ( \inst1|Eatual.contacont1~DUPLICATE_q\ & ( \inst|IQ1\(0) ) ) ) # ( \inst|IQ1\(1) & ( !\inst1|Eatual.contacont1~DUPLICATE_q\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|ALT_INV_IQ1\(0),
	datae => \inst|ALT_INV_IQ1\(1),
	dataf => \inst1|ALT_INV_Eatual.contacont1~DUPLICATE_q\,
	combout => \inst|IQ1[1]~2_combout\);

-- Location: FF_X1_Y26_N32
\inst|IQ1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[1]~2_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1\(1));

-- Location: FF_X1_Y26_N22
\inst|IQ1[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[0]~3_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1[0]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y26_N36
\inst|IQ1[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ1[2]~1_combout\ = ( \inst|IQ1[0]~DUPLICATE_q\ & ( !\inst|IQ1\(2) $ (((!\inst|IQ1\(1)) # (!\inst1|Eatual.contacont1~DUPLICATE_q\))) ) ) # ( !\inst|IQ1[0]~DUPLICATE_q\ & ( \inst|IQ1\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000011111111000000001111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_IQ1\(1),
	datac => \inst1|ALT_INV_Eatual.contacont1~DUPLICATE_q\,
	datad => \inst|ALT_INV_IQ1\(2),
	dataf => \inst|ALT_INV_IQ1[0]~DUPLICATE_q\,
	combout => \inst|IQ1[2]~1_combout\);

-- Location: FF_X1_Y26_N38
\inst|IQ1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[2]~1_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1\(2));

-- Location: LABCELL_X1_Y26_N45
\inst|IQ1[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ1[3]~0_combout\ = ( \inst|IQ1\(3) & ( \inst|IQ1[0]~DUPLICATE_q\ & ( (!\inst1|Eatual.contacont1~q\) # ((!\inst|IQ1\(1)) # (!\inst|IQ1\(2))) ) ) ) # ( !\inst|IQ1\(3) & ( \inst|IQ1[0]~DUPLICATE_q\ & ( (\inst1|Eatual.contacont1~q\ & (\inst|IQ1\(1) & 
-- \inst|IQ1\(2))) ) ) ) # ( \inst|IQ1\(3) & ( !\inst|IQ1[0]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000111111111111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_Eatual.contacont1~q\,
	datac => \inst|ALT_INV_IQ1\(1),
	datad => \inst|ALT_INV_IQ1\(2),
	datae => \inst|ALT_INV_IQ1\(3),
	dataf => \inst|ALT_INV_IQ1[0]~DUPLICATE_q\,
	combout => \inst|IQ1[3]~0_combout\);

-- Location: FF_X1_Y26_N47
\inst|IQ1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[3]~0_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1\(3));

-- Location: FF_X1_Y26_N31
\inst|IQ1[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[1]~2_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1[1]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y26_N0
\inst1|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector1~0_combout\ = ( \inst|IQ1\(0) & ( \inst|IQ1[1]~DUPLICATE_q\ & ( ((\inst1|Eatual.testafim~q\ & ((!\inst|IQ1\(2)) # (!\inst|IQ1\(3))))) # (\inst1|Eatual.zeraconts~q\) ) ) ) # ( !\inst|IQ1\(0) & ( \inst|IQ1[1]~DUPLICATE_q\ & ( 
-- (\inst1|Eatual.testafim~q\) # (\inst1|Eatual.zeraconts~q\) ) ) ) # ( \inst|IQ1\(0) & ( !\inst|IQ1[1]~DUPLICATE_q\ & ( (\inst1|Eatual.testafim~q\) # (\inst1|Eatual.zeraconts~q\) ) ) ) # ( !\inst|IQ1\(0) & ( !\inst|IQ1[1]~DUPLICATE_q\ & ( 
-- (\inst1|Eatual.testafim~q\) # (\inst1|Eatual.zeraconts~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Eatual.zeraconts~q\,
	datab => \inst1|ALT_INV_Eatual.testafim~q\,
	datac => \inst|ALT_INV_IQ1\(2),
	datad => \inst|ALT_INV_IQ1\(3),
	datae => \inst|ALT_INV_IQ1\(0),
	dataf => \inst|ALT_INV_IQ1[1]~DUPLICATE_q\,
	combout => \inst1|Selector1~0_combout\);

-- Location: FF_X1_Y26_N2
\inst1|Eatual.testacondicao1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst1|Selector1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.testacondicao1~q\);

-- Location: FF_X1_Y26_N46
\inst|IQ1[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[3]~0_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1[3]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y26_N9
\inst1|Eprox.contacont2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Eprox.contacont2~0_combout\ = ( \inst|IQ1[3]~DUPLICATE_q\ & ( \inst|IQ1[1]~DUPLICATE_q\ & ( (\inst1|Eatual.testacondicao1~q\ & (!\inst|IQ1\(2) $ (\inst|IQ1[0]~DUPLICATE_q\))) ) ) ) # ( !\inst|IQ1[3]~DUPLICATE_q\ & ( !\inst|IQ1[1]~DUPLICATE_q\ & ( 
-- (\inst1|Eatual.testacondicao1~q\ & (!\inst|IQ1\(2) $ (\inst|IQ1[0]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100101000000000000000000000000000000000000000010100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_IQ1\(2),
	datac => \inst|ALT_INV_IQ1[0]~DUPLICATE_q\,
	datad => \inst1|ALT_INV_Eatual.testacondicao1~q\,
	datae => \inst|ALT_INV_IQ1[3]~DUPLICATE_q\,
	dataf => \inst|ALT_INV_IQ1[1]~DUPLICATE_q\,
	combout => \inst1|Eprox.contacont2~0_combout\);

-- Location: LABCELL_X2_Y26_N57
\inst1|Eatual.contacont2~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Eatual.contacont2~feeder_combout\ = ( \inst1|Eprox.contacont2~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst1|ALT_INV_Eprox.contacont2~0_combout\,
	combout => \inst1|Eatual.contacont2~feeder_combout\);

-- Location: FF_X2_Y26_N59
\inst1|Eatual.contacont2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst1|Eatual.contacont2~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.contacont2~q\);

-- Location: LABCELL_X1_Y26_N57
\inst1|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector2~0_combout\ = ( \inst|IQ1\(0) & ( \inst|IQ1[1]~DUPLICATE_q\ & ( ((\inst1|Eatual.testacondicao1~q\ & ((!\inst|IQ1\(3)) # (!\inst|IQ1\(2))))) # (\inst1|Eatual.contacont2~q\) ) ) ) # ( !\inst|IQ1\(0) & ( \inst|IQ1[1]~DUPLICATE_q\ & ( 
-- ((\inst1|Eatual.testacondicao1~q\ & ((!\inst|IQ1\(3)) # (\inst|IQ1\(2))))) # (\inst1|Eatual.contacont2~q\) ) ) ) # ( \inst|IQ1\(0) & ( !\inst|IQ1[1]~DUPLICATE_q\ & ( ((\inst1|Eatual.testacondicao1~q\ & ((!\inst|IQ1\(2)) # (\inst|IQ1\(3))))) # 
-- (\inst1|Eatual.contacont2~q\) ) ) ) # ( !\inst|IQ1\(0) & ( !\inst|IQ1[1]~DUPLICATE_q\ & ( ((\inst1|Eatual.testacondicao1~q\ & ((\inst|IQ1\(2)) # (\inst|IQ1\(3))))) # (\inst1|Eatual.contacont2~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011101110111011101110011011101110011011101110111011101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Eatual.testacondicao1~q\,
	datab => \inst1|ALT_INV_Eatual.contacont2~q\,
	datac => \inst|ALT_INV_IQ1\(3),
	datad => \inst|ALT_INV_IQ1\(2),
	datae => \inst|ALT_INV_IQ1\(0),
	dataf => \inst|ALT_INV_IQ1[1]~DUPLICATE_q\,
	combout => \inst1|Selector2~0_combout\);

-- Location: FF_X1_Y26_N59
\inst1|Eatual.contacont1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst1|Selector2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.contacont1~q\);

-- Location: FF_X1_Y26_N50
\inst1|Eatual.testafim~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \inst1|Eatual.contacont1~q\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.testafim~DUPLICATE_q\);

-- Location: LABCELL_X1_Y26_N51
\inst1|Eprox.final~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Eprox.final~0_combout\ = ( \inst|IQ1\(0) & ( \inst|IQ1[1]~DUPLICATE_q\ & ( (\inst1|Eatual.testafim~DUPLICATE_q\ & (\inst|IQ1\(3) & \inst|IQ1\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Eatual.testafim~DUPLICATE_q\,
	datac => \inst|ALT_INV_IQ1\(3),
	datad => \inst|ALT_INV_IQ1\(2),
	datae => \inst|ALT_INV_IQ1\(0),
	dataf => \inst|ALT_INV_IQ1[1]~DUPLICATE_q\,
	combout => \inst1|Eprox.final~0_combout\);

-- Location: FF_X1_Y26_N52
\inst1|Eatual.final\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst1|Eprox.final~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|Eatual.final~q\);

-- Location: LABCELL_X2_Y26_N51
\inst|IQ2[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ2[2]~1_combout\ = ( \inst1|Eatual.zeraconts~q\ & ( !\inst1|Eatual.contacont2~q\ ) ) # ( !\inst1|Eatual.zeraconts~q\ & ( \inst1|Eatual.contacont2~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_Eatual.contacont2~q\,
	dataf => \inst1|ALT_INV_Eatual.zeraconts~q\,
	combout => \inst|IQ2[2]~1_combout\);

-- Location: FF_X2_Y26_N23
\inst|IQ2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ2~3_combout\,
	ena => \inst|IQ2[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ2\(1));

-- Location: FF_X2_Y26_N14
\inst|IQ2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ2~4_combout\,
	ena => \inst|IQ2[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ2\(0));

-- Location: LABCELL_X2_Y26_N12
\inst|IQ2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ2~4_combout\ = ( !\inst|IQ2\(0) & ( !\inst1|Eatual.zeraconts~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst|ALT_INV_IQ2\(0),
	dataf => \inst1|ALT_INV_Eatual.zeraconts~q\,
	combout => \inst|IQ2~4_combout\);

-- Location: FF_X2_Y26_N13
\inst|IQ2[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ2~4_combout\,
	ena => \inst|IQ2[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ2[0]~DUPLICATE_q\);

-- Location: LABCELL_X2_Y26_N21
\inst|IQ2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ2~3_combout\ = ( \inst|IQ2[0]~DUPLICATE_q\ & ( (!\inst1|Eatual.zeraconts~q\ & !\inst|IQ2\(1)) ) ) # ( !\inst|IQ2[0]~DUPLICATE_q\ & ( (!\inst1|Eatual.zeraconts~q\ & \inst|IQ2\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Eatual.zeraconts~q\,
	datad => \inst|ALT_INV_IQ2\(1),
	dataf => \inst|ALT_INV_IQ2[0]~DUPLICATE_q\,
	combout => \inst|IQ2~3_combout\);

-- Location: FF_X2_Y26_N22
\inst|IQ2[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ2~3_combout\,
	ena => \inst|IQ2[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ2[1]~DUPLICATE_q\);

-- Location: LABCELL_X2_Y26_N18
\inst|IQ2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ2~2_combout\ = ( \inst|IQ2[1]~DUPLICATE_q\ & ( (!\inst1|Eatual.zeraconts~q\ & (!\inst|IQ2\(0) $ (!\inst|IQ2\(2)))) ) ) # ( !\inst|IQ2[1]~DUPLICATE_q\ & ( (!\inst1|Eatual.zeraconts~q\ & \inst|IQ2\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000100010100010000010001010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Eatual.zeraconts~q\,
	datab => \inst|ALT_INV_IQ2\(0),
	datad => \inst|ALT_INV_IQ2\(2),
	dataf => \inst|ALT_INV_IQ2[1]~DUPLICATE_q\,
	combout => \inst|IQ2~2_combout\);

-- Location: FF_X2_Y26_N20
\inst|IQ2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ2~2_combout\,
	ena => \inst|IQ2[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ2\(2));

-- Location: LABCELL_X2_Y26_N48
\inst|IQ2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|IQ2~0_combout\ = ( \inst|IQ2[0]~DUPLICATE_q\ & ( (!\inst1|Eatual.zeraconts~q\ & (!\inst|IQ2\(3) $ (((!\inst|IQ2\(1)) # (!\inst|IQ2\(2)))))) ) ) # ( !\inst|IQ2[0]~DUPLICATE_q\ & ( (!\inst1|Eatual.zeraconts~q\ & \inst|IQ2\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000100110010000000010011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_IQ2\(1),
	datab => \inst1|ALT_INV_Eatual.zeraconts~q\,
	datac => \inst|ALT_INV_IQ2\(2),
	datad => \inst|ALT_INV_IQ2\(3),
	dataf => \inst|ALT_INV_IQ2[0]~DUPLICATE_q\,
	combout => \inst|IQ2~0_combout\);

-- Location: FF_X2_Y26_N49
\inst|IQ2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ2~0_combout\,
	ena => \inst|IQ2[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ2\(3));

-- Location: FF_X2_Y26_N19
\inst|IQ2[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ2~2_combout\,
	ena => \inst|IQ2[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ2[2]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y19_N39
\inst|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = ( \inst|IQ2[0]~DUPLICATE_q\ & ( \inst|IQ2[2]~DUPLICATE_q\ & ( (\inst|IQ2[1]~DUPLICATE_q\ & \inst|IQ2\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_IQ2[1]~DUPLICATE_q\,
	datac => \inst|ALT_INV_IQ2\(3),
	datae => \inst|ALT_INV_IQ2[0]~DUPLICATE_q\,
	dataf => \inst|ALT_INV_IQ2[2]~DUPLICATE_q\,
	combout => \inst|Equal0~0_combout\);

-- Location: FF_X1_Y26_N37
\inst|IQ1[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst|IQ1[2]~1_combout\,
	clrn => \inst1|ALT_INV_Eatual.zeraconts~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|IQ1[2]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y21_N0
\inst|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal1~0_combout\ = ( \inst|IQ1[2]~DUPLICATE_q\ & ( (\inst|IQ1[0]~DUPLICATE_q\ & (\inst|IQ1[1]~DUPLICATE_q\ & \inst|IQ1[3]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_IQ1[0]~DUPLICATE_q\,
	datac => \inst|ALT_INV_IQ1[1]~DUPLICATE_q\,
	datad => \inst|ALT_INV_IQ1[3]~DUPLICATE_q\,
	dataf => \inst|ALT_INV_IQ1[2]~DUPLICATE_q\,
	combout => \inst|Equal1~0_combout\);

-- Location: LABCELL_X1_Y26_N39
\inst1|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|WideOr3~0_combout\ = ( \inst1|Eatual.testafim~DUPLICATE_q\ ) # ( !\inst1|Eatual.testafim~DUPLICATE_q\ & ( (\inst1|Eatual.final~q\) # (\inst1|Eatual.contacont1~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010111110101111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Eatual.contacont1~DUPLICATE_q\,
	datac => \inst1|ALT_INV_Eatual.final~q\,
	dataf => \inst1|ALT_INV_Eatual.testafim~DUPLICATE_q\,
	combout => \inst1|WideOr3~0_combout\);

-- Location: LABCELL_X1_Y26_N15
\inst1|WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|WideOr4~0_combout\ = ( \inst1|Eatual.contacont2~q\ ) # ( !\inst1|Eatual.contacont2~q\ & ( (\inst1|Eatual.testacondicao1~q\) # (\inst1|Eatual.final~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111111111111111111101010101111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Eatual.final~q\,
	datad => \inst1|ALT_INV_Eatual.testacondicao1~q\,
	datae => \inst1|ALT_INV_Eatual.contacont2~q\,
	combout => \inst1|WideOr4~0_combout\);

-- Location: LABCELL_X1_Y26_N18
\inst1|WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|WideOr5~0_combout\ = ( \inst1|Eatual.testafim~DUPLICATE_q\ ) # ( !\inst1|Eatual.testafim~DUPLICATE_q\ & ( (\inst1|Eatual.zeraconts~q\) # (\inst1|Eatual.contacont2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_Eatual.contacont2~q\,
	datac => \inst1|ALT_INV_Eatual.zeraconts~q\,
	dataf => \inst1|ALT_INV_Eatual.testafim~DUPLICATE_q\,
	combout => \inst1|WideOr5~0_combout\);

-- Location: LABCELL_X31_Y29_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


