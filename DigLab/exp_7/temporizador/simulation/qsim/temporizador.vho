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

-- DATE "05/03/2020 22:45:30"

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
	saida : BUFFER std_logic
	);
END temporizador;

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
SIGNAL \saida~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \trigger_1min~input_o\ : std_logic;
SIGNAL \conta1~5_combout\ : std_logic;
SIGNAL \zera~input_o\ : std_logic;
SIGNAL \conta1~4_combout\ : std_logic;
SIGNAL \conta1[2]~3_combout\ : std_logic;
SIGNAL \conta1[3]~2_combout\ : std_logic;
SIGNAL \conta1~1_combout\ : std_logic;
SIGNAL \conta1~0_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \conta3[0]~5_combout\ : std_logic;
SIGNAL \conta3[1]~4_combout\ : std_logic;
SIGNAL \conta3[2]~3_combout\ : std_logic;
SIGNAL \conta3[3]~2_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \conta3[4]~1_combout\ : std_logic;
SIGNAL \conta3[5]~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \trigger_1s~input_o\ : std_logic;
SIGNAL \trigger_5s~input_o\ : std_logic;
SIGNAL \conta2[0]~2_combout\ : std_logic;
SIGNAL \conta2[1]~1_combout\ : std_logic;
SIGNAL \conta2[2]~0_combout\ : std_logic;
SIGNAL \flag~0_combout\ : std_logic;
SIGNAL \flag~1_combout\ : std_logic;
SIGNAL \flag~q\ : std_logic;
SIGNAL conta3 : std_logic_vector(5 DOWNTO 0);
SIGNAL conta1 : std_logic_vector(5 DOWNTO 0);
SIGNAL conta2 : std_logic_vector(2 DOWNTO 0);
SIGNAL ALT_INV_conta3 : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_flag~q\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL ALT_INV_conta1 : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL ALT_INV_conta2 : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_flag~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \ALT_INV_trigger_1min~input_o\ : std_logic;
SIGNAL \ALT_INV_trigger_1s~input_o\ : std_logic;
SIGNAL \ALT_INV_trigger_5s~input_o\ : std_logic;
SIGNAL \ALT_INV_zera~input_o\ : std_logic;

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
ALT_INV_conta3(5) <= NOT conta3(5);
\ALT_INV_flag~q\ <= NOT \flag~q\;
ALT_INV_conta3(4) <= NOT conta3(4);
ALT_INV_conta3(3) <= NOT conta3(3);
ALT_INV_conta3(1) <= NOT conta3(1);
ALT_INV_conta3(2) <= NOT conta3(2);
ALT_INV_conta3(0) <= NOT conta3(0);
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
ALT_INV_conta1(5) <= NOT conta1(5);
ALT_INV_conta1(4) <= NOT conta1(4);
ALT_INV_conta1(3) <= NOT conta1(3);
ALT_INV_conta1(2) <= NOT conta1(2);
ALT_INV_conta1(1) <= NOT conta1(1);
ALT_INV_conta1(0) <= NOT conta1(0);
\ALT_INV_Equal2~0_combout\ <= NOT \Equal2~0_combout\;
ALT_INV_conta2(2) <= NOT conta2(2);
ALT_INV_conta2(1) <= NOT conta2(1);
ALT_INV_conta2(0) <= NOT conta2(0);
\ALT_INV_flag~0_combout\ <= NOT \flag~0_combout\;
\ALT_INV_Add1~0_combout\ <= NOT \Add1~0_combout\;
\ALT_INV_trigger_1min~input_o\ <= NOT \trigger_1min~input_o\;
\ALT_INV_trigger_1s~input_o\ <= NOT \trigger_1s~input_o\;
\ALT_INV_trigger_5s~input_o\ <= NOT \trigger_5s~input_o\;
\ALT_INV_zera~input_o\ <= NOT \zera~input_o\;

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
	o => \saida~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\trigger_1min~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger_1min,
	o => \trigger_1min~input_o\);

\conta1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~5_combout\ = ( conta1(1) & ( !conta1(0) & ( (!conta1(5)) # ((!conta1(4)) # ((conta1(2)) # (conta1(3)))) ) ) ) # ( !conta1(1) & ( !conta1(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111011111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(5),
	datab => ALT_INV_conta1(4),
	datac => ALT_INV_conta1(3),
	datad => ALT_INV_conta1(2),
	datae => ALT_INV_conta1(1),
	dataf => ALT_INV_conta1(0),
	combout => \conta1~5_combout\);

\zera~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_zera,
	o => \zera~input_o\);

\conta1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta1~5_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(0));

\conta1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~4_combout\ = ( !conta1(1) & ( conta1(0) ) ) # ( conta1(1) & ( !conta1(0) & ( (!conta1(5)) # ((!conta1(4)) # ((conta1(2)) # (conta1(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(5),
	datab => ALT_INV_conta1(4),
	datac => ALT_INV_conta1(3),
	datad => ALT_INV_conta1(2),
	datae => ALT_INV_conta1(1),
	dataf => ALT_INV_conta1(0),
	combout => \conta1~4_combout\);

\conta1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta1~4_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(1));

\conta1[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1[2]~3_combout\ = !conta1(2) $ (((!conta1(1)) # (!conta1(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001010110010101100101011001010110010101100101011001010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(2),
	datab => ALT_INV_conta1(1),
	datac => ALT_INV_conta1(0),
	combout => \conta1[2]~3_combout\);

\conta1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta1[2]~3_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(2));

\conta1[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1[3]~2_combout\ = !conta1(3) $ (((!conta1(2)) # ((!conta1(1)) # (!conta1(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010110010101010101011001010101010101100101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(3),
	datab => ALT_INV_conta1(2),
	datac => ALT_INV_conta1(1),
	datad => ALT_INV_conta1(0),
	combout => \conta1[3]~2_combout\);

\conta1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta1[3]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(3));

\conta1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~1_combout\ = ( conta1(1) & ( conta1(0) & ( !conta1(4) $ (((!conta1(3)) # (!conta1(2)))) ) ) ) # ( !conta1(1) & ( conta1(0) & ( conta1(4) ) ) ) # ( conta1(1) & ( !conta1(0) & ( (conta1(4) & ((!conta1(5)) # ((conta1(2)) # (conta1(3))))) ) ) ) # ( 
-- !conta1(1) & ( !conta1(0) & ( conta1(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001000110011001100110011001100110011001100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(5),
	datab => ALT_INV_conta1(4),
	datac => ALT_INV_conta1(3),
	datad => ALT_INV_conta1(2),
	datae => ALT_INV_conta1(1),
	dataf => ALT_INV_conta1(0),
	combout => \conta1~1_combout\);

\conta1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta1~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(4));

\conta1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta1~0_combout\ = ( conta1(1) & ( conta1(0) & ( !conta1(5) $ (((!conta1(4)) # ((!conta1(3)) # (!conta1(2))))) ) ) ) # ( !conta1(1) & ( conta1(0) & ( conta1(5) ) ) ) # ( conta1(1) & ( !conta1(0) & ( (conta1(5) & ((!conta1(4)) # ((conta1(2)) # 
-- (conta1(3))))) ) ) ) # ( !conta1(1) & ( !conta1(0) & ( conta1(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010001010101010101010101010101010101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(5),
	datab => ALT_INV_conta1(4),
	datac => ALT_INV_conta1(3),
	datad => ALT_INV_conta1(2),
	datae => ALT_INV_conta1(1),
	dataf => ALT_INV_conta1(0),
	combout => \conta1~0_combout\);

\conta1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta1~0_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta1(5));

\Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = ( conta1(1) & ( !conta1(0) & ( (conta1(5) & (conta1(4) & (!conta1(3) & !conta1(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta1(5),
	datab => ALT_INV_conta1(4),
	datac => ALT_INV_conta1(3),
	datad => ALT_INV_conta1(2),
	datae => ALT_INV_conta1(1),
	dataf => ALT_INV_conta1(0),
	combout => \Equal2~0_combout\);

\conta3[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[0]~5_combout\ = (!conta3(0) & ((\Equal2~0_combout\))) # (conta3(0) & (!\Equal1~0_combout\ & !\Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100101001001010010010100100101001001010010010100100101001001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(0),
	datab => \ALT_INV_Equal1~0_combout\,
	datac => \ALT_INV_Equal2~0_combout\,
	combout => \conta3[0]~5_combout\);

\conta3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta3[0]~5_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(0));

\conta3[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[1]~4_combout\ = (!\Equal2~0_combout\ & (conta3(1) & ((!\Equal1~0_combout\)))) # (\Equal2~0_combout\ & (!conta3(1) $ ((!conta3(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001100110010100000110011001010000011001100101000001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(1),
	datab => ALT_INV_conta3(0),
	datac => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_Equal2~0_combout\,
	combout => \conta3[1]~4_combout\);

\conta3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta3[1]~4_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(1));

\conta3[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[2]~3_combout\ = ( \Equal2~0_combout\ & ( !conta3(2) $ (((!conta3(1)) # (!conta3(0)))) ) ) # ( !\Equal2~0_combout\ & ( (conta3(2) & !\Equal1~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101100101011001010101000000000101011001010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(2),
	datab => ALT_INV_conta3(1),
	datac => ALT_INV_conta3(0),
	datad => \ALT_INV_Equal1~0_combout\,
	datae => \ALT_INV_Equal2~0_combout\,
	combout => \conta3[2]~3_combout\);

\conta3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta3[2]~3_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(2));

\conta3[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[3]~2_combout\ = ( \Equal1~0_combout\ & ( \Equal2~0_combout\ & ( !conta3(3) $ (((!conta3(2)) # ((!conta3(1)) # (!conta3(0))))) ) ) ) # ( !\Equal1~0_combout\ & ( \Equal2~0_combout\ & ( !conta3(3) $ (((!conta3(2)) # ((!conta3(1)) # (!conta3(0))))) ) 
-- ) ) # ( !\Equal1~0_combout\ & ( !\Equal2~0_combout\ & ( conta3(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000000000000001010101010101100101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(3),
	datab => ALT_INV_conta3(2),
	datac => ALT_INV_conta3(1),
	datad => ALT_INV_conta3(0),
	datae => \ALT_INV_Equal1~0_combout\,
	dataf => \ALT_INV_Equal2~0_combout\,
	combout => \conta3[3]~2_combout\);

\conta3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta3[3]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(3));

\Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (conta3(3) & (conta3(2) & (conta3(1) & conta3(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(3),
	datab => ALT_INV_conta3(2),
	datac => ALT_INV_conta3(1),
	datad => ALT_INV_conta3(0),
	combout => \Add1~0_combout\);

\conta3[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[4]~1_combout\ = (!\Equal2~0_combout\ & (conta3(4) & (!\Equal1~0_combout\))) # (\Equal2~0_combout\ & (!conta3(4) $ (((!\Add1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010101001010010001010100101001000101010010100100010101001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(4),
	datab => \ALT_INV_Equal1~0_combout\,
	datac => \ALT_INV_Equal2~0_combout\,
	datad => \ALT_INV_Add1~0_combout\,
	combout => \conta3[4]~1_combout\);

\conta3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta3[4]~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(4));

\conta3[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta3[5]~0_combout\ = ( \Add1~0_combout\ & ( (!\Equal2~0_combout\ & (conta3(5) & ((!\Equal1~0_combout\)))) # (\Equal2~0_combout\ & (!conta3(5) $ ((!conta3(4))))) ) ) # ( !\Add1~0_combout\ & ( (conta3(5) & ((!\Equal1~0_combout\) # (\Equal2~0_combout\))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010101010100000110011001010000010101010101000001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(5),
	datab => ALT_INV_conta3(4),
	datac => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_Equal2~0_combout\,
	datae => \ALT_INV_Add1~0_combout\,
	combout => \conta3[5]~0_combout\);

\conta3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta3[5]~0_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta3(5));

\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( !conta3(1) & ( !conta3(0) & ( (conta3(5) & (conta3(4) & (conta3(3) & conta3(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_conta3(5),
	datab => ALT_INV_conta3(4),
	datac => ALT_INV_conta3(3),
	datad => ALT_INV_conta3(2),
	datae => ALT_INV_conta3(1),
	dataf => ALT_INV_conta3(0),
	combout => \Equal1~0_combout\);

\trigger_1s~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger_1s,
	o => \trigger_1s~input_o\);

\trigger_5s~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_trigger_5s,
	o => \trigger_5s~input_o\);

\conta2[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta2[0]~2_combout\ = (!\Equal2~0_combout\ & (conta2(0) & ((!conta2(2)) # (conta2(1))))) # (\Equal2~0_combout\ & (((!conta2(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110001010010101011000101001010101100010100101010110001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal2~0_combout\,
	datab => ALT_INV_conta2(2),
	datac => ALT_INV_conta2(1),
	datad => ALT_INV_conta2(0),
	combout => \conta2[0]~2_combout\);

\conta2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta2[0]~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta2(0));

\conta2[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta2[1]~1_combout\ = !conta2(1) $ (((!\Equal2~0_combout\) # (!conta2(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000110110001101100011011000110110001101100011011000110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal2~0_combout\,
	datab => ALT_INV_conta2(1),
	datac => ALT_INV_conta2(0),
	combout => \conta2[1]~1_combout\);

\conta2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta2[1]~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta2(1));

\conta2[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conta2[2]~0_combout\ = (!\Equal2~0_combout\ & (conta2(2) & ((!conta2(0)) # (conta2(1))))) # (\Equal2~0_combout\ & (!conta2(2) $ (((!conta2(1)) # (!conta2(0))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100010110001100110001011000110011000101100011001100010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal2~0_combout\,
	datab => ALT_INV_conta2(2),
	datac => ALT_INV_conta2(1),
	datad => ALT_INV_conta2(0),
	combout => \conta2[2]~0_combout\);

\conta2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \conta2[2]~0_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => conta2(2));

\flag~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \flag~0_combout\ = ( conta2(0) & ( (!\flag~q\ & ((!\trigger_5s~input_o\) # ((!conta2(2)) # (conta2(1))))) ) ) # ( !conta2(0) & ( !\flag~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010001010101010101010101010101010100010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_flag~q\,
	datab => \ALT_INV_trigger_5s~input_o\,
	datac => ALT_INV_conta2(2),
	datad => ALT_INV_conta2(1),
	datae => ALT_INV_conta2(0),
	combout => \flag~0_combout\);

\flag~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \flag~1_combout\ = ( \flag~0_combout\ & ( (!\trigger_1min~input_o\ & (((\trigger_1s~input_o\ & \Equal2~0_combout\)))) # (\trigger_1min~input_o\ & (((\trigger_1s~input_o\ & \Equal2~0_combout\)) # (\Equal1~0_combout\))) ) ) # ( !\flag~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000100010001111111111111111111110001000100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_trigger_1min~input_o\,
	datab => \ALT_INV_Equal1~0_combout\,
	datac => \ALT_INV_trigger_1s~input_o\,
	datad => \ALT_INV_Equal2~0_combout\,
	datae => \ALT_INV_flag~0_combout\,
	combout => \flag~1_combout\);

flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \flag~1_combout\,
	clrn => \ALT_INV_zera~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \flag~q\);

ww_saida <= \saida~output_o\;
END structure;


