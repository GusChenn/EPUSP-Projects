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

-- DATE "05/03/2020 22:34:08"

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

ENTITY 	temporizador IS
    PORT (
	clock : IN std_logic;
	zera : IN std_logic;
	trigger_1s : IN std_logic;
	trigger_5s : IN std_logic;
	trigger_1min : IN std_logic;
	saida : OUT std_logic
	);
END temporizador;

-- Design Ports Information
-- saida	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- trigger_1min	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- trigger_1s	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- trigger_5s	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- zera	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF temporizador IS
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
SIGNAL ww_zera : std_logic;
SIGNAL ww_trigger_1s : std_logic;
SIGNAL ww_trigger_5s : std_logic;
SIGNAL ww_trigger_1min : std_logic;
SIGNAL ww_saida : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \zera~input_o\ : std_logic;
SIGNAL \conta1[2]~DUPLICATE_q\ : std_logic;
SIGNAL \conta1[3]~2_combout\ : std_logic;
SIGNAL \conta1[3]~DUPLICATE_q\ : std_logic;
SIGNAL \conta1~1_combout\ : std_logic;
SIGNAL \conta1~0_combout\ : std_logic;
SIGNAL \conta1~4_combout\ : std_logic;
SIGNAL \conta1~5_combout\ : std_logic;
SIGNAL \conta1[0]~DUPLICATE_q\ : std_logic;
SIGNAL \conta1[2]~3_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \conta3[0]~5_combout\ : std_logic;
SIGNAL \conta3[0]~DUPLICATE_q\ : std_logic;
SIGNAL \conta3[1]~4_combout\ : std_logic;
SIGNAL \conta3[1]~DUPLICATE_q\ : std_logic;
SIGNAL \conta3[2]~3_combout\ : std_logic;
SIGNAL \conta3[3]~2_combout\ : std_logic;
SIGNAL \conta3[3]~DUPLICATE_q\ : std_logic;
SIGNAL \conta3[2]~DUPLICATE_q\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \conta3[4]~1_combout\ : std_logic;
SIGNAL \conta3[5]~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \trigger_1min~input_o\ : std_logic;
SIGNAL \trigger_1s~input_o\ : std_logic;
SIGNAL \trigger_5s~input_o\ : std_logic;
SIGNAL \conta2[2]~0_combout\ : std_logic;
SIGNAL \conta2[0]~2_combout\ : std_logic;
SIGNAL \conta2[0]~DUPLICATE_q\ : std_logic;
SIGNAL \conta2[1]~1_combout\ : std_logic;
SIGNAL \conta2[1]~DUPLICATE_q\ : std_logic;
SIGNAL \flag~0_combout\ : std_logic;
SIGNAL \flag~1_combout\ : std_logic;
SIGNAL \flag~q\ : std_logic;
SIGNAL conta3 : std_logic_vector(5 DOWNTO 0);
SIGNAL conta1 : std_logic_vector(5 DOWNTO 0);
SIGNAL conta2 : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_conta2[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta2[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta1[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta1[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta1[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta3[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta3[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta3[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_conta3[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_zera~input_o\ : std_logic;
SIGNAL \ALT_INV_trigger_5s~input_o\ : std_logic;
SIGNAL \ALT_INV_trigger_1s~input_o\ : std_logic;
SIGNAL \ALT_INV_trigger_1min~input_o\ : std_logic;
SIGNAL \ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \ALT_INV_flag~0_combout\ : std_logic;
SIGNAL ALT_INV_conta2 : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL ALT_INV_conta1 : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL ALT_INV_conta3 : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_flag~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_zera <= zera;
ww_trigger_1s <= trigger_1s;
ww_trigger_5s <= trigger_5s;
ww_trigger_1min <= trigger_1min;
saida <= ww_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_conta2[0]~DUPLICATE_q\ <= NOT \conta2[0]~DUPLICATE_q\;
\ALT_INV_conta2[1]~DUPLICATE_q\ <= NOT \conta2[1]~DUPLICATE_q\;
\ALT_INV_conta1[0]~DUPLICATE_q\ <= NOT \conta1[0]~DUPLICATE_q\;
\ALT_INV_conta1[2]~DUPLICATE_q\ <= NOT \conta1[2]~DUPLICATE_q\;
\ALT_INV_conta1[3]~DUPLICATE_q\ <= NOT \conta1[3]~DUPLICATE_q\;
\ALT_INV_conta3[0]~DUPLICATE_q\ <= NOT \conta3[0]~DUPLICATE_q\;
\ALT_INV_conta3[1]~DUPLICATE_q\ <= NOT \conta3[1]~DUPLICATE_q\;
\ALT_INV_conta3[2]~DUPLICATE_q\ <= NOT \conta3[2]~DUPLICATE_q\;
\ALT_INV_conta3[3]~DUPLICATE_q\ <= NOT \conta3[3]~DUPLICATE_q\;
\ALT_INV_zera~input_o\ <= NOT \zera~input_o\;
\ALT_INV_trigger_5s~input_o\ <= NOT \trigger_5s~input_o\;
\ALT_INV_trigger_1s~input_o\ <= NOT \trigger_1s~input_o\;
\ALT_INV_trigger_1min~input_o\ <= NOT \trigger_1min~input_o\;
\ALT_INV_Add1~0_combout\ <= NOT \Add1~0_combout\;
\ALT_INV_flag~0_combout\ <= NOT \flag~0_combout\;
ALT_INV_conta2(0) <= NOT conta2(0);
ALT_INV_conta2(1) <= NOT conta2(1);
ALT_INV_conta2(2) <= NOT conta2(2);
\ALT_INV_Equal2~0_combout\ <= NOT \Equal2~0_combout\;
ALT_INV_conta1(0) <= NOT conta1(0);
ALT_INV_conta1(1) <= NOT conta1(1);
ALT_INV_conta1(2) <= NOT conta1(2);
ALT_INV_conta1(3) <= NOT conta1(3);
ALT_INV_conta1(4) <= NOT conta1(4);
ALT_INV_conta1(5) <= NOT conta1(5);
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
ALT_INV_conta3(0) <= NOT conta3(0);
ALT_INV_conta3(1) <= NOT conta3(1);
ALT_INV_conta3(2) <= NOT conta3(2);
ALT_INV_conta3(3) <= NOT conta3(3);
ALT_INV_conta3(4) <= NOT conta3(4);
ALT_INV_conta3(5) <= NOT conta3(5);
\ALT_INV_flag~q\ <= NOT \flag~q\;

-- Location: IOOBUF_X0_Y20_N56
\saida~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \flag~q\,
	devoe => ww_devoe,
	o => ww_saida);

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

-- Location: IOIBUF_X0_Y21_N55
\zera~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_zera,
	o => \zera~input_o\);

-- Location: FF_X2_Y24_N43
\conta1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1~5_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(0));

-- Location: FF_X1_Y24_N46
\conta1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1[3]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(3));

-- Location: FF_X1_Y24_N52
\conta1[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1[2]~3_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta1[2]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y24_N45
\conta1[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1[3]~2_combout\ = ( \conta1[2]~DUPLICATE_q\ & ( !conta1(3) $ (((!conta1(0)) # (!conta1(1)))) ) ) # ( !\conta1[2]~DUPLICATE_q\ & ( conta1(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(0),
	datac => ALT_INV_conta1(1),
	datad => ALT_INV_conta1(3),
	dataf => \ALT_INV_conta1[2]~DUPLICATE_q\,
	combout => \conta1[3]~2_combout\);

-- Location: FF_X1_Y24_N47
\conta1[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1[3]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta1[3]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y24_N57
\conta1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~1_combout\ = ( conta1(4) & ( conta1(5) & ( (!conta1(1)) # ((!conta1(0) & ((conta1(2)) # (\conta1[3]~DUPLICATE_q\))) # (conta1(0) & ((!\conta1[3]~DUPLICATE_q\) # (!conta1(2))))) ) ) ) # ( !conta1(4) & ( conta1(5) & ( (conta1(0) & (conta1(1) & 
-- (\conta1[3]~DUPLICATE_q\ & conta1(2)))) ) ) ) # ( conta1(4) & ( !conta1(5) & ( (!conta1(0)) # ((!conta1(1)) # ((!\conta1[3]~DUPLICATE_q\) # (!conta1(2)))) ) ) ) # ( !conta1(4) & ( !conta1(5) & ( (conta1(0) & (conta1(1) & (\conta1[3]~DUPLICATE_q\ & 
-- conta1(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111111111000000000000000011101111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(0),
	datab => ALT_INV_conta1(1),
	datac => \ALT_INV_conta1[3]~DUPLICATE_q\,
	datad => ALT_INV_conta1(2),
	datae => ALT_INV_conta1(4),
	dataf => ALT_INV_conta1(5),
	combout => \conta1~1_combout\);

-- Location: FF_X1_Y24_N58
\conta1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(4));

-- Location: LABCELL_X2_Y24_N39
\conta1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~0_combout\ = ( conta1(5) & ( conta1(3) & ( (!conta1(1)) # ((!\conta1[0]~DUPLICATE_q\) # ((!conta1(4)) # (!\conta1[2]~DUPLICATE_q\))) ) ) ) # ( !conta1(5) & ( conta1(3) & ( (conta1(1) & (\conta1[0]~DUPLICATE_q\ & (conta1(4) & 
-- \conta1[2]~DUPLICATE_q\))) ) ) ) # ( conta1(5) & ( !conta1(3) & ( (!conta1(1)) # (((!conta1(4)) # (\conta1[2]~DUPLICATE_q\)) # (\conta1[0]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110111111111100000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(1),
	datab => \ALT_INV_conta1[0]~DUPLICATE_q\,
	datac => ALT_INV_conta1(4),
	datad => \ALT_INV_conta1[2]~DUPLICATE_q\,
	datae => ALT_INV_conta1(5),
	dataf => ALT_INV_conta1(3),
	combout => \conta1~0_combout\);

-- Location: FF_X2_Y24_N41
\conta1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1~0_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(5));

-- Location: LABCELL_X2_Y24_N54
\conta1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~4_combout\ = ( conta1(1) & ( conta1(3) & ( !conta1(0) ) ) ) # ( !conta1(1) & ( conta1(3) & ( conta1(0) ) ) ) # ( conta1(1) & ( !conta1(3) & ( (!conta1(0) & ((!conta1(5)) # ((!conta1(4)) # (\conta1[2]~DUPLICATE_q\)))) ) ) ) # ( !conta1(1) & ( 
-- !conta1(3) & ( conta1(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101101010101000101001010101010101011010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(0),
	datab => ALT_INV_conta1(5),
	datac => \ALT_INV_conta1[2]~DUPLICATE_q\,
	datad => ALT_INV_conta1(4),
	datae => ALT_INV_conta1(1),
	dataf => ALT_INV_conta1(3),
	combout => \conta1~4_combout\);

-- Location: FF_X2_Y24_N56
\conta1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1~4_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(1));

-- Location: LABCELL_X2_Y24_N42
\conta1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~5_combout\ = ( !conta1(0) & ( conta1(3) ) ) # ( !conta1(0) & ( !conta1(3) & ( (!conta1(1)) # ((!conta1(5)) # ((!conta1(4)) # (\conta1[2]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111101111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(1),
	datab => ALT_INV_conta1(5),
	datac => \ALT_INV_conta1[2]~DUPLICATE_q\,
	datad => ALT_INV_conta1(4),
	datae => ALT_INV_conta1(0),
	dataf => ALT_INV_conta1(3),
	combout => \conta1~5_combout\);

-- Location: FF_X2_Y24_N44
\conta1[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1~5_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta1[0]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y24_N51
\conta1[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1[2]~3_combout\ = ( conta1(1) & ( !\conta1[0]~DUPLICATE_q\ $ (!conta1(2)) ) ) # ( !conta1(1) & ( conta1(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_conta1[0]~DUPLICATE_q\,
	datad => ALT_INV_conta1(2),
	dataf => ALT_INV_conta1(1),
	combout => \conta1[2]~3_combout\);

-- Location: FF_X1_Y24_N53
\conta1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta1[2]~3_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(2));

-- Location: LABCELL_X1_Y24_N12
\Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = ( conta1(1) & ( conta1(4) & ( (!conta1(2) & (!\conta1[3]~DUPLICATE_q\ & (conta1(5) & !\conta1[0]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(2),
	datab => \ALT_INV_conta1[3]~DUPLICATE_q\,
	datac => ALT_INV_conta1(5),
	datad => \ALT_INV_conta1[0]~DUPLICATE_q\,
	datae => ALT_INV_conta1(1),
	dataf => ALT_INV_conta1(4),
	combout => \Equal2~0_combout\);

-- Location: FF_X1_Y24_N25
\conta3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[0]~5_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(0));

-- Location: LABCELL_X1_Y24_N24
\conta3[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[0]~5_combout\ = ( \Equal1~0_combout\ & ( (\Equal2~0_combout\ & !conta3(0)) ) ) # ( !\Equal1~0_combout\ & ( !\Equal2~0_combout\ $ (!conta3(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100001100111100110000110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal2~0_combout\,
	datad => ALT_INV_conta3(0),
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \conta3[0]~5_combout\);

-- Location: FF_X1_Y24_N26
\conta3[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[0]~5_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta3[0]~DUPLICATE_q\);

-- Location: FF_X1_Y24_N1
\conta3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[1]~4_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(1));

-- Location: LABCELL_X1_Y24_N0
\conta3[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[1]~4_combout\ = ( \Equal1~0_combout\ & ( (\Equal2~0_combout\ & (!\conta3[0]~DUPLICATE_q\ $ (!conta3(1)))) ) ) # ( !\Equal1~0_combout\ & ( !conta3(1) $ (((!\Equal2~0_combout\) # (!\conta3[0]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111100000000111111110000000011001100000000001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal2~0_combout\,
	datac => \ALT_INV_conta3[0]~DUPLICATE_q\,
	datad => ALT_INV_conta3(1),
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \conta3[1]~4_combout\);

-- Location: FF_X1_Y24_N2
\conta3[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[1]~4_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta3[1]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y24_N33
\conta3[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[2]~3_combout\ = ( \Equal1~0_combout\ & ( (\Equal2~0_combout\ & (!conta3(2) $ (((!\conta3[0]~DUPLICATE_q\) # (!\conta3[1]~DUPLICATE_q\))))) ) ) # ( !\Equal1~0_combout\ & ( !conta3(2) $ (((!\conta3[0]~DUPLICATE_q\) # ((!\Equal2~0_combout\) # 
-- (!\conta3[1]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000000011111111000000001001100100000000100110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_conta3[0]~DUPLICATE_q\,
	datab => \ALT_INV_Equal2~0_combout\,
	datac => \ALT_INV_conta3[1]~DUPLICATE_q\,
	datad => ALT_INV_conta3(2),
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \conta3[2]~3_combout\);

-- Location: FF_X1_Y24_N35
\conta3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[2]~3_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(2));

-- Location: FF_X1_Y24_N7
\conta3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[3]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(3));

-- Location: LABCELL_X1_Y24_N6
\conta3[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[3]~2_combout\ = ( conta3(3) & ( \Equal1~0_combout\ & ( (\Equal2~0_combout\ & ((!conta3(2)) # ((!\conta3[1]~DUPLICATE_q\) # (!conta3(0))))) ) ) ) # ( !conta3(3) & ( \Equal1~0_combout\ & ( (conta3(2) & (\Equal2~0_combout\ & (\conta3[1]~DUPLICATE_q\ 
-- & conta3(0)))) ) ) ) # ( conta3(3) & ( !\Equal1~0_combout\ & ( (!conta3(2)) # ((!\Equal2~0_combout\) # ((!\conta3[1]~DUPLICATE_q\) # (!conta3(0)))) ) ) ) # ( !conta3(3) & ( !\Equal1~0_combout\ & ( (conta3(2) & (\Equal2~0_combout\ & 
-- (\conta3[1]~DUPLICATE_q\ & conta3(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111111111000000000000000010011001100110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(2),
	datab => \ALT_INV_Equal2~0_combout\,
	datac => \ALT_INV_conta3[1]~DUPLICATE_q\,
	datad => ALT_INV_conta3(0),
	datae => ALT_INV_conta3(3),
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \conta3[3]~2_combout\);

-- Location: FF_X1_Y24_N8
\conta3[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[3]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta3[3]~DUPLICATE_q\);

-- Location: FF_X1_Y24_N34
\conta3[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[2]~3_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta3[2]~DUPLICATE_q\);

-- Location: LABCELL_X2_Y24_N24
\Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = ( conta3(3) & ( conta3(1) & ( (\conta3[2]~DUPLICATE_q\ & conta3(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_conta3[2]~DUPLICATE_q\,
	datad => ALT_INV_conta3(0),
	datae => ALT_INV_conta3(3),
	dataf => ALT_INV_conta3(1),
	combout => \Add1~0_combout\);

-- Location: LABCELL_X1_Y24_N39
\conta3[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[4]~1_combout\ = ( \Add1~0_combout\ & ( (!\Equal2~0_combout\ & (!\Equal1~0_combout\ & conta3(4))) # (\Equal2~0_combout\ & ((!conta3(4)))) ) ) # ( !\Add1~0_combout\ & ( (conta3(4) & ((!\Equal1~0_combout\) # (\Equal2~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101111000000001010111100001111101000000000111110100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datac => \ALT_INV_Equal2~0_combout\,
	datad => ALT_INV_conta3(4),
	dataf => \ALT_INV_Add1~0_combout\,
	combout => \conta3[4]~1_combout\);

-- Location: FF_X1_Y24_N41
\conta3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[4]~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(4));

-- Location: LABCELL_X1_Y24_N27
\conta3[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[5]~0_combout\ = ( \Add1~0_combout\ & ( (!\Equal2~0_combout\ & (!\Equal1~0_combout\ & ((conta3(5))))) # (\Equal2~0_combout\ & ((!conta3(4) $ (!conta3(5))))) ) ) # ( !\Add1~0_combout\ & ( (conta3(5) & ((!\Equal1~0_combout\) # (\Equal2~0_combout\))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010111011000000001011101100000011101110000000001110111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datab => \ALT_INV_Equal2~0_combout\,
	datac => ALT_INV_conta3(4),
	datad => ALT_INV_conta3(5),
	dataf => \ALT_INV_Add1~0_combout\,
	combout => \conta3[5]~0_combout\);

-- Location: FF_X1_Y24_N29
\conta3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta3[5]~0_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(5));

-- Location: LABCELL_X1_Y24_N18
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( conta3(5) & ( !\conta3[0]~DUPLICATE_q\ & ( (!\conta3[1]~DUPLICATE_q\ & (\conta3[3]~DUPLICATE_q\ & (conta3(2) & conta3(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_conta3[1]~DUPLICATE_q\,
	datab => \ALT_INV_conta3[3]~DUPLICATE_q\,
	datac => ALT_INV_conta3(2),
	datad => ALT_INV_conta3(4),
	datae => ALT_INV_conta3(5),
	dataf => \ALT_INV_conta3[0]~DUPLICATE_q\,
	combout => \Equal1~0_combout\);

-- Location: IOIBUF_X0_Y20_N4
\trigger_1min~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger_1min,
	o => \trigger_1min~input_o\);

-- Location: IOIBUF_X0_Y20_N21
\trigger_1s~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger_1s,
	o => \trigger_1s~input_o\);

-- Location: IOIBUF_X0_Y20_N38
\trigger_5s~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger_5s,
	o => \trigger_5s~input_o\);

-- Location: FF_X1_Y24_N31
\conta2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta2[1]~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta2(1));

-- Location: FF_X1_Y24_N44
\conta2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta2[0]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta2(0));

-- Location: LABCELL_X1_Y24_N3
\conta2[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta2[2]~0_combout\ = ( \Equal2~0_combout\ & ( !conta2(2) $ (((!conta2(1)) # (!conta2(0)))) ) ) # ( !\Equal2~0_combout\ & ( (conta2(2) & ((!conta2(0)) # (conta2(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110101000000001111010100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta2(1),
	datac => ALT_INV_conta2(0),
	datad => ALT_INV_conta2(2),
	dataf => \ALT_INV_Equal2~0_combout\,
	combout => \conta2[2]~0_combout\);

-- Location: FF_X1_Y24_N5
\conta2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta2[2]~0_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta2(2));

-- Location: LABCELL_X1_Y24_N42
\conta2[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta2[0]~2_combout\ = ( \Equal2~0_combout\ & ( !conta2(0) ) ) # ( !\Equal2~0_combout\ & ( (conta2(0) & ((!conta2(2)) # (\conta2[1]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110011000000001111001111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_conta2[1]~DUPLICATE_q\,
	datac => ALT_INV_conta2(2),
	datad => ALT_INV_conta2(0),
	dataf => \ALT_INV_Equal2~0_combout\,
	combout => \conta2[0]~2_combout\);

-- Location: FF_X1_Y24_N43
\conta2[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta2[0]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta2[0]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y24_N30
\conta2[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta2[1]~1_combout\ = ( \Equal2~0_combout\ & ( !\conta2[0]~DUPLICATE_q\ $ (!conta2(1)) ) ) # ( !\Equal2~0_combout\ & ( conta2(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_conta2[0]~DUPLICATE_q\,
	datad => ALT_INV_conta2(1),
	dataf => \ALT_INV_Equal2~0_combout\,
	combout => \conta2[1]~1_combout\);

-- Location: FF_X1_Y24_N32
\conta2[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \conta2[1]~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conta2[1]~DUPLICATE_q\);

-- Location: LABCELL_X1_Y24_N48
\flag~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \flag~0_combout\ = ( conta2(0) & ( (!\flag~q\ & ((!\trigger_5s~input_o\) # ((!conta2(2)) # (\conta2[1]~DUPLICATE_q\)))) ) ) # ( !conta2(0) & ( !\flag~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111011000000001111101100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_trigger_5s~input_o\,
	datab => \ALT_INV_conta2[1]~DUPLICATE_q\,
	datac => ALT_INV_conta2(2),
	datad => \ALT_INV_flag~q\,
	dataf => ALT_INV_conta2(0),
	combout => \flag~0_combout\);

-- Location: LABCELL_X1_Y24_N36
\flag~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \flag~1_combout\ = ( \flag~0_combout\ & ( (!\Equal1~0_combout\ & (\Equal2~0_combout\ & ((\trigger_1s~input_o\)))) # (\Equal1~0_combout\ & (((\Equal2~0_combout\ & \trigger_1s~input_o\)) # (\trigger_1min~input_o\))) ) ) # ( !\flag~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000101001101110000010100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datab => \ALT_INV_Equal2~0_combout\,
	datac => \ALT_INV_trigger_1min~input_o\,
	datad => \ALT_INV_trigger_1s~input_o\,
	dataf => \ALT_INV_flag~0_combout\,
	combout => \flag~1_combout\);

-- Location: FF_X1_Y24_N38
flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \flag~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \flag~q\);

-- Location: LABCELL_X43_Y43_N3
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


