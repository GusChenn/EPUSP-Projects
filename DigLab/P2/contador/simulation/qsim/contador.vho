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

-- DATE "07/23/2020 17:54:59"

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

ENTITY 	contador IS
    PORT (
	clock : IN std_logic;
	out20 : OUT std_logic;
	out200 : OUT std_logic;
	out2k : OUT std_logic;
	out20k : OUT std_logic
	);
END contador;

ARCHITECTURE structure OF contador IS
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
SIGNAL ww_out20 : std_logic;
SIGNAL ww_out200 : std_logic;
SIGNAL ww_out2k : std_logic;
SIGNAL ww_out20k : std_logic;
SIGNAL \out20~output_o\ : std_logic;
SIGNAL \out200~output_o\ : std_logic;
SIGNAL \out2k~output_o\ : std_logic;
SIGNAL \out20k~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \cont20[0]~0_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \cont200[0]~3_combout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \cont200~1_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \cont200~2_combout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \cont200~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \cont20k[0]~2_combout\ : std_logic;
SIGNAL \cont2k~2_combout\ : std_logic;
SIGNAL \cont2k[2]~1_combout\ : std_logic;
SIGNAL \cont2k~0_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \cont20k~0_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL cont20 : std_logic_vector(9 DOWNTO 0);
SIGNAL cont200 : std_logic_vector(6 DOWNTO 0);
SIGNAL cont2k : std_logic_vector(3 DOWNTO 0);
SIGNAL cont20k : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL ALT_INV_cont20k : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_LessThan2~0_combout\ : std_logic;
SIGNAL ALT_INV_cont2k : std_logic_vector(3 DOWNTO 1);
SIGNAL \ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL ALT_INV_cont200 : std_logic_vector(6 DOWNTO 0);
SIGNAL \ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL ALT_INV_cont20 : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;

BEGIN

ww_clock <= clock;
out20 <= ww_out20;
out200 <= ww_out200;
out2k <= ww_out2k;
out20k <= ww_out20k;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
ALT_INV_cont20k(0) <= NOT cont20k(0);
ALT_INV_cont20k(1) <= NOT cont20k(1);
\ALT_INV_LessThan2~0_combout\ <= NOT \LessThan2~0_combout\;
ALT_INV_cont2k(1) <= NOT cont2k(1);
ALT_INV_cont2k(2) <= NOT cont2k(2);
ALT_INV_cont2k(3) <= NOT cont2k(3);
\ALT_INV_LessThan1~1_combout\ <= NOT \LessThan1~1_combout\;
\ALT_INV_LessThan1~0_combout\ <= NOT \LessThan1~0_combout\;
ALT_INV_cont200(0) <= NOT cont200(0);
ALT_INV_cont200(1) <= NOT cont200(1);
ALT_INV_cont200(2) <= NOT cont200(2);
ALT_INV_cont200(3) <= NOT cont200(3);
ALT_INV_cont200(4) <= NOT cont200(4);
ALT_INV_cont200(5) <= NOT cont200(5);
ALT_INV_cont200(6) <= NOT cont200(6);
\ALT_INV_LessThan0~1_combout\ <= NOT \LessThan0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
ALT_INV_cont20(0) <= NOT cont20(0);
\ALT_INV_Add1~25_sumout\ <= NOT \Add1~25_sumout\;
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
ALT_INV_cont20(5) <= NOT cont20(5);
ALT_INV_cont20(6) <= NOT cont20(6);
ALT_INV_cont20(7) <= NOT cont20(7);
ALT_INV_cont20(8) <= NOT cont20(8);
ALT_INV_cont20(1) <= NOT cont20(1);
ALT_INV_cont20(2) <= NOT cont20(2);
ALT_INV_cont20(3) <= NOT cont20(3);
ALT_INV_cont20(4) <= NOT cont20(4);
ALT_INV_cont20(9) <= NOT cont20(9);

\out20~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_LessThan0~1_combout\,
	devoe => ww_devoe,
	o => \out20~output_o\);

\out200~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_LessThan1~1_combout\,
	devoe => ww_devoe,
	o => \out200~output_o\);

\out2k~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_LessThan2~0_combout\,
	devoe => ww_devoe,
	o => \out2k~output_o\);

\out20k~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal3~0_combout\,
	devoe => ww_devoe,
	o => \out20k~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( !cont20(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~18\ = CARRY(( !cont20(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(0),
	cin => GND,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

\cont20[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont20[0]~0_combout\ = !\Add0~17_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~17_sumout\,
	combout => \cont20[0]~0_combout\);

\cont20[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont20[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(0));

\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( cont20(1) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( cont20(1) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(1),
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (cont20(8) & (cont20(7) & (cont20(6) & cont20(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20(8),
	datab => ALT_INV_cont20(7),
	datac => ALT_INV_cont20(6),
	datad => ALT_INV_cont20(5),
	combout => \Equal0~0_combout\);

\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (cont20(9) & (!cont20(4) & (cont20(3) & !cont20(2))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000000000001000000000000000100000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20(9),
	datab => ALT_INV_cont20(4),
	datac => ALT_INV_cont20(3),
	datad => ALT_INV_cont20(2),
	combout => \Equal0~1_combout\);

\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (cont20(0) & (!cont20(1) & (\Equal0~0_combout\ & \Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000001000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20(0),
	datab => ALT_INV_cont20(1),
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_Equal0~1_combout\,
	combout => \Equal0~2_combout\);

\cont20[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~21_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(1));

\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( cont20(2) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~14\ = CARRY(( cont20(2) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(2),
	cin => \Add0~22\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

\cont20[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~13_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(2));

\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( cont20(3) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~10\ = CARRY(( cont20(3) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(3),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

\cont20[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~9_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(3));

\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( cont20(4) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~6\ = CARRY(( cont20(4) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(4),
	cin => \Add0~10\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

\cont20[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~5_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(4));

\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( cont20(5) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~38\ = CARRY(( cont20(5) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(5),
	cin => \Add0~6\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

\cont20[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~37_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(5));

\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( cont20(6) ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~34\ = CARRY(( cont20(6) ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(6),
	cin => \Add0~38\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

\cont20[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~33_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(6));

\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( cont20(7) ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~30\ = CARRY(( cont20(7) ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(7),
	cin => \Add0~34\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

\cont20[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~29_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(7));

\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( cont20(8) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~26\ = CARRY(( cont20(8) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(8),
	cin => \Add0~30\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

\cont20[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~25_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(8));

\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( cont20(9) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont20(9),
	cin => \Add0~26\,
	sumout => \Add0~1_sumout\);

\cont20[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add0~1_sumout\,
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20(9));

\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!cont20(3) & ((!cont20(2)) # ((cont20(0) & !cont20(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000101010001000100010101000100010001010100010001000101010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20(3),
	datab => ALT_INV_cont20(2),
	datac => ALT_INV_cont20(0),
	datad => ALT_INV_cont20(1),
	combout => \LessThan0~0_combout\);

\LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!cont20(9) & ((!cont20(4)) # ((!\Equal0~0_combout\) # (\LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010001010101010101000101010101010100010101010101010001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20(9),
	datab => ALT_INV_cont20(4),
	datac => \ALT_INV_LessThan0~0_combout\,
	datad => \ALT_INV_Equal0~0_combout\,
	combout => \LessThan0~1_combout\);

\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( !cont200(0) ) + ( VCC ) + ( !VCC ))
-- \Add1~26\ = CARRY(( !cont200(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont200(0),
	cin => GND,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

\cont200[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont200[0]~3_combout\ = !\Add1~25_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~25_sumout\,
	combout => \cont200[0]~3_combout\);

\cont200[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont200[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont200(0));

\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( cont200(1) ) + ( GND ) + ( \Add1~26\ ))
-- \Add1~22\ = CARRY(( cont200(1) ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont200(1),
	cin => \Add1~26\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

\cont200[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add1~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont200(1));

\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( cont200(2) ) + ( GND ) + ( \Add1~22\ ))
-- \Add1~18\ = CARRY(( cont200(2) ) + ( GND ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont200(2),
	cin => \Add1~22\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( cont200(3) ) + ( GND ) + ( \Add1~18\ ))
-- \Add1~14\ = CARRY(( cont200(3) ) + ( GND ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont200(3),
	cin => \Add1~18\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

\cont200[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add1~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont200(3));

\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( cont200(4) ) + ( GND ) + ( \Add1~14\ ))
-- \Add1~10\ = CARRY(( cont200(4) ) + ( GND ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont200(4),
	cin => \Add1~14\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

\cont200[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Add1~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont200(4));

\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( cont200(5) ) + ( GND ) + ( \Add1~10\ ))
-- \Add1~6\ = CARRY(( cont200(5) ) + ( GND ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont200(5),
	cin => \Add1~10\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

\cont200~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont200~1_combout\ = ( \Add1~5_sumout\ & ( (!cont200(2)) # (((!cont200(0)) # (!\Equal1~0_combout\)) # (cont200(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111101100000000000000001111111111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont200(2),
	datab => ALT_INV_cont200(1),
	datac => ALT_INV_cont200(0),
	datad => \ALT_INV_Equal1~0_combout\,
	datae => \ALT_INV_Add1~5_sumout\,
	combout => \cont200~1_combout\);

\cont200[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont200~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont200(5));

\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (cont200(6) & (cont200(5) & (!cont200(4) & !cont200(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000100000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont200(6),
	datab => ALT_INV_cont200(5),
	datac => ALT_INV_cont200(4),
	datad => ALT_INV_cont200(3),
	combout => \Equal1~0_combout\);

\cont200~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont200~2_combout\ = ( \Add1~17_sumout\ & ( (!cont200(2)) # (((!cont200(0)) # (!\Equal1~0_combout\)) # (cont200(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111101100000000000000001111111111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont200(2),
	datab => ALT_INV_cont200(1),
	datac => ALT_INV_cont200(0),
	datad => \ALT_INV_Equal1~0_combout\,
	datae => \ALT_INV_Add1~17_sumout\,
	combout => \cont200~2_combout\);

\cont200[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont200~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont200(2));

\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( cont200(6) ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_cont200(6),
	cin => \Add1~6\,
	sumout => \Add1~1_sumout\);

\cont200~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont200~0_combout\ = ( \Equal1~0_combout\ & ( (\Add1~1_sumout\ & ((!cont200(2)) # ((!cont200(0)) # (cont200(1))))) ) ) # ( !\Equal1~0_combout\ & ( \Add1~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111101100000000111111110000000011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont200(2),
	datab => ALT_INV_cont200(1),
	datac => ALT_INV_cont200(0),
	datad => \ALT_INV_Add1~1_sumout\,
	datae => \ALT_INV_Equal1~0_combout\,
	combout => \cont200~0_combout\);

\cont200[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont200~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont200(6));

\LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!cont200(3) & (!cont200(2) & ((!cont200(1)) # (cont200(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010001000100000001000100010000000100010001000000010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont200(3),
	datab => ALT_INV_cont200(2),
	datac => ALT_INV_cont200(1),
	datad => ALT_INV_cont200(0),
	combout => \LessThan1~0_combout\);

\LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!cont200(6) & ((!cont200(5)) # ((!cont200(4)) # (\LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100010101010101010001010101010101000101010101010100010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont200(6),
	datab => ALT_INV_cont200(5),
	datac => ALT_INV_cont200(4),
	datad => \ALT_INV_LessThan1~0_combout\,
	combout => \LessThan1~1_combout\);

\cont20k[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont20k[0]~2_combout\ = !cont20k(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20k(0),
	combout => \cont20k[0]~2_combout\);

\cont20k[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont20k[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20k(0));

\cont2k~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont2k~2_combout\ = (!cont2k(1) & (((!cont20k(0))))) # (cont2k(1) & (cont20k(0) & ((!cont2k(3)) # (cont2k(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001011111100000000101111110000000010111111000000001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont2k(3),
	datab => ALT_INV_cont2k(2),
	datac => ALT_INV_cont2k(1),
	datad => ALT_INV_cont20k(0),
	combout => \cont2k~2_combout\);

\cont2k[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont2k~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont2k(1));

\cont2k[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont2k[2]~1_combout\ = !cont2k(2) $ (((!cont2k(1)) # (cont20k(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010101100101011001010110010101100101011001010110010101100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont2k(2),
	datab => ALT_INV_cont2k(1),
	datac => ALT_INV_cont20k(0),
	combout => \cont2k[2]~1_combout\);

\cont2k[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont2k[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont2k(2));

\cont2k~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont2k~0_combout\ = (!cont2k(3) & (cont2k(2) & (cont2k(1) & !cont20k(0)))) # (cont2k(3) & ((!cont2k(1)) # (!cont2k(2) $ (cont20k(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001010001010101100101000101010110010100010101011001010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont2k(3),
	datab => ALT_INV_cont2k(2),
	datac => ALT_INV_cont2k(1),
	datad => ALT_INV_cont20k(0),
	combout => \cont2k~0_combout\);

\cont2k[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont2k~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont2k(3));

\LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (!cont2k(3) & ((!cont2k(2)) # (!cont2k(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100010101000101010001010100010101000101010001010100010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont2k(3),
	datab => ALT_INV_cont2k(2),
	datac => ALT_INV_cont2k(1),
	combout => \LessThan2~0_combout\);

\cont20k~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont20k~0_combout\ = (!cont20k(1) & !cont20k(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20k(1),
	datab => ALT_INV_cont20k(0),
	combout => \cont20k~0_combout\);

\cont20k[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont20k~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont20k(1));

\Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (cont20k(1) & cont20k(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont20k(1),
	datab => ALT_INV_cont20k(0),
	combout => \Equal3~0_combout\);

ww_out20 <= \out20~output_o\;

ww_out200 <= \out200~output_o\;

ww_out2k <= \out2k~output_o\;

ww_out20k <= \out20k~output_o\;
END structure;


