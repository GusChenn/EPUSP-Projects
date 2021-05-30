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

-- DATE "01/30/2021 16:51:20"

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

ENTITY 	alarme IS
    PORT (
	alarme : OUT std_logic;
	ck : IN std_logic;
	a3 : IN std_logic;
	a2 : IN std_logic;
	a1 : IN std_logic;
	a0 : IN std_logic
	);
END alarme;

-- Design Ports Information
-- alarme	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a3	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a2	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a1	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a0	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ck	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF alarme IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_alarme : std_logic;
SIGNAL ww_ck : std_logic;
SIGNAL ww_a3 : std_logic;
SIGNAL ww_a2 : std_logic;
SIGNAL ww_a1 : std_logic;
SIGNAL ww_a0 : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \ck~input_o\ : std_logic;
SIGNAL \ck~inputCLKENA0_outclk\ : std_logic;
SIGNAL \inst1|Add1~21_sumout\ : std_logic;
SIGNAL \inst1|cont200[0]~3_combout\ : std_logic;
SIGNAL \inst1|cont200[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|Add1~22\ : std_logic;
SIGNAL \inst1|Add1~17_sumout\ : std_logic;
SIGNAL \inst1|cont200[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|Add1~18\ : std_logic;
SIGNAL \inst1|Add1~14\ : std_logic;
SIGNAL \inst1|Add1~9_sumout\ : std_logic;
SIGNAL \inst1|Add1~10\ : std_logic;
SIGNAL \inst1|Add1~5_sumout\ : std_logic;
SIGNAL \inst1|Add1~6\ : std_logic;
SIGNAL \inst1|Add1~2\ : std_logic;
SIGNAL \inst1|Add1~25_sumout\ : std_logic;
SIGNAL \inst1|cont200~2_combout\ : std_logic;
SIGNAL \inst1|Equal1~0_combout\ : std_logic;
SIGNAL \inst1|Add1~13_sumout\ : std_logic;
SIGNAL \inst1|cont200~1_combout\ : std_logic;
SIGNAL \inst1|cont200[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|Add1~1_sumout\ : std_logic;
SIGNAL \inst1|cont200~0_combout\ : std_logic;
SIGNAL \inst1|cont200[5]~DUPLICATE_q\ : std_logic;
SIGNAL \a1~input_o\ : std_logic;
SIGNAL \inst2|Z~2_combout\ : std_logic;
SIGNAL \inst2|Z~3_combout\ : std_logic;
SIGNAL \inst1|Add0~13_sumout\ : std_logic;
SIGNAL \inst1|cont20[0]~0_combout\ : std_logic;
SIGNAL \inst1|Add0~14\ : std_logic;
SIGNAL \inst1|Add0~17_sumout\ : std_logic;
SIGNAL \inst1|Equal0~1_combout\ : std_logic;
SIGNAL \inst1|Equal0~0_combout\ : std_logic;
SIGNAL \inst1|Equal0~2_combout\ : std_logic;
SIGNAL \inst1|Add0~18\ : std_logic;
SIGNAL \inst1|Add0~9_sumout\ : std_logic;
SIGNAL \inst1|Add0~10\ : std_logic;
SIGNAL \inst1|Add0~5_sumout\ : std_logic;
SIGNAL \inst1|Add0~6\ : std_logic;
SIGNAL \inst1|Add0~1_sumout\ : std_logic;
SIGNAL \inst1|Add0~2\ : std_logic;
SIGNAL \inst1|Add0~33_sumout\ : std_logic;
SIGNAL \inst1|Add0~34\ : std_logic;
SIGNAL \inst1|Add0~29_sumout\ : std_logic;
SIGNAL \inst1|Add0~30\ : std_logic;
SIGNAL \inst1|Add0~25_sumout\ : std_logic;
SIGNAL \inst1|Add0~26\ : std_logic;
SIGNAL \inst1|Add0~21_sumout\ : std_logic;
SIGNAL \inst1|Add0~22\ : std_logic;
SIGNAL \inst1|Add0~37_sumout\ : std_logic;
SIGNAL \a0~input_o\ : std_logic;
SIGNAL \inst2|Z~4_combout\ : std_logic;
SIGNAL \inst1|cont20k[0]~2_combout\ : std_logic;
SIGNAL \inst1|cont20k[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|cont20k~0_combout\ : std_logic;
SIGNAL \inst1|cont2k~0_combout\ : std_logic;
SIGNAL \inst1|cont2k~2_combout\ : std_logic;
SIGNAL \inst1|cont2k[2]~1_combout\ : std_logic;
SIGNAL \inst1|cont2k[2]~DUPLICATE_q\ : std_logic;
SIGNAL \a2~input_o\ : std_logic;
SIGNAL \a3~input_o\ : std_logic;
SIGNAL \inst1|cont2k[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|Z~6_combout\ : std_logic;
SIGNAL \inst1|cont20[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|Z~0_combout\ : std_logic;
SIGNAL \inst2|Z~1_combout\ : std_logic;
SIGNAL \inst2|Z~5_combout\ : std_logic;
SIGNAL \inst1|cont20\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst1|cont200\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \inst1|cont20k\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst1|cont2k\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|ALT_INV_cont20\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst1|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \inst1|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \inst1|ALT_INV_cont2k[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_cont2k[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_cont20k[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_cont200[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_cont200[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_cont200[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_cont200[5]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|ALT_INV_cont20[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_a0~input_o\ : std_logic;
SIGNAL \ALT_INV_a1~input_o\ : std_logic;
SIGNAL \ALT_INV_a2~input_o\ : std_logic;
SIGNAL \ALT_INV_a3~input_o\ : std_logic;
SIGNAL \inst1|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_cont2k\ : std_logic_vector(3 DOWNTO 1);
SIGNAL \inst1|ALT_INV_cont20k\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst2|ALT_INV_Z~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_cont200\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \inst2|ALT_INV_Z~3_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Z~2_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Z~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Z~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Z~6_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \inst1|ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \inst1|ALT_INV_Add1~13_sumout\ : std_logic;

BEGIN

alarme <= ww_alarme;
ww_ck <= ck;
ww_a3 <= a3;
ww_a2 <= a2;
ww_a1 <= a1;
ww_a0 <= a0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst1|ALT_INV_cont20\(4) <= NOT \inst1|cont20\(4);
\inst1|ALT_INV_cont20\(3) <= NOT \inst1|cont20\(3);
\inst1|ALT_INV_cont20\(2) <= NOT \inst1|cont20\(2);
\inst1|ALT_INV_cont20\(1) <= NOT \inst1|cont20\(1);
\inst1|ALT_INV_cont20\(8) <= NOT \inst1|cont20\(8);
\inst1|ALT_INV_cont20\(7) <= NOT \inst1|cont20\(7);
\inst1|ALT_INV_cont20\(5) <= NOT \inst1|cont20\(5);
\inst1|ALT_INV_cont20\(6) <= NOT \inst1|cont20\(6);
\inst1|ALT_INV_cont20\(9) <= NOT \inst1|cont20\(9);
\inst1|ALT_INV_Add0~13_sumout\ <= NOT \inst1|Add0~13_sumout\;
\inst1|ALT_INV_Add1~1_sumout\ <= NOT \inst1|Add1~1_sumout\;
\inst1|ALT_INV_cont2k[1]~DUPLICATE_q\ <= NOT \inst1|cont2k[1]~DUPLICATE_q\;
\inst1|ALT_INV_cont2k[2]~DUPLICATE_q\ <= NOT \inst1|cont2k[2]~DUPLICATE_q\;
\inst1|ALT_INV_cont20k[0]~DUPLICATE_q\ <= NOT \inst1|cont20k[0]~DUPLICATE_q\;
\inst1|ALT_INV_cont200[0]~DUPLICATE_q\ <= NOT \inst1|cont200[0]~DUPLICATE_q\;
\inst1|ALT_INV_cont200[1]~DUPLICATE_q\ <= NOT \inst1|cont200[1]~DUPLICATE_q\;
\inst1|ALT_INV_cont200[2]~DUPLICATE_q\ <= NOT \inst1|cont200[2]~DUPLICATE_q\;
\inst1|ALT_INV_cont200[5]~DUPLICATE_q\ <= NOT \inst1|cont200[5]~DUPLICATE_q\;
\inst1|ALT_INV_cont20[0]~DUPLICATE_q\ <= NOT \inst1|cont20[0]~DUPLICATE_q\;
\ALT_INV_a0~input_o\ <= NOT \a0~input_o\;
\ALT_INV_a1~input_o\ <= NOT \a1~input_o\;
\ALT_INV_a2~input_o\ <= NOT \a2~input_o\;
\ALT_INV_a3~input_o\ <= NOT \a3~input_o\;
\inst1|ALT_INV_Equal1~0_combout\ <= NOT \inst1|Equal1~0_combout\;
\inst1|ALT_INV_Equal0~1_combout\ <= NOT \inst1|Equal0~1_combout\;
\inst1|ALT_INV_cont2k\(1) <= NOT \inst1|cont2k\(1);
\inst1|ALT_INV_cont2k\(2) <= NOT \inst1|cont2k\(2);
\inst1|ALT_INV_cont2k\(3) <= NOT \inst1|cont2k\(3);
\inst1|ALT_INV_cont20k\(0) <= NOT \inst1|cont20k\(0);
\inst1|ALT_INV_cont20k\(1) <= NOT \inst1|cont20k\(1);
\inst2|ALT_INV_Z~4_combout\ <= NOT \inst2|Z~4_combout\;
\inst1|ALT_INV_cont200\(6) <= NOT \inst1|cont200\(6);
\inst2|ALT_INV_Z~3_combout\ <= NOT \inst2|Z~3_combout\;
\inst2|ALT_INV_Z~2_combout\ <= NOT \inst2|Z~2_combout\;
\inst1|ALT_INV_cont200\(0) <= NOT \inst1|cont200\(0);
\inst1|ALT_INV_cont200\(1) <= NOT \inst1|cont200\(1);
\inst1|ALT_INV_cont200\(2) <= NOT \inst1|cont200\(2);
\inst1|ALT_INV_cont200\(3) <= NOT \inst1|cont200\(3);
\inst1|ALT_INV_cont200\(4) <= NOT \inst1|cont200\(4);
\inst1|ALT_INV_cont200\(5) <= NOT \inst1|cont200\(5);
\inst2|ALT_INV_Z~1_combout\ <= NOT \inst2|Z~1_combout\;
\inst1|ALT_INV_Equal0~0_combout\ <= NOT \inst1|Equal0~0_combout\;
\inst2|ALT_INV_Z~0_combout\ <= NOT \inst2|Z~0_combout\;
\inst1|ALT_INV_cont20\(0) <= NOT \inst1|cont20\(0);
\inst2|ALT_INV_Z~6_combout\ <= NOT \inst2|Z~6_combout\;
\inst1|ALT_INV_Add1~25_sumout\ <= NOT \inst1|Add1~25_sumout\;
\inst1|ALT_INV_Add1~21_sumout\ <= NOT \inst1|Add1~21_sumout\;
\inst1|ALT_INV_Add1~13_sumout\ <= NOT \inst1|Add1~13_sumout\;

-- Location: IOOBUF_X54_Y20_N39
\alarme~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Z~5_combout\,
	devoe => ww_devoe,
	o => ww_alarme);

-- Location: IOIBUF_X54_Y18_N61
\ck~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ck,
	o => \ck~input_o\);

-- Location: CLKCTRL_G10
\ck~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \ck~input_o\,
	outclk => \ck~inputCLKENA0_outclk\);

-- Location: FF_X52_Y20_N35
\inst1|cont200[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add1~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200\(1));

-- Location: LABCELL_X52_Y20_N30
\inst1|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add1~21_sumout\ = SUM(( !\inst1|cont200[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))
-- \inst1|Add1~22\ = CARRY(( !\inst1|cont200[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont200[0]~DUPLICATE_q\,
	cin => GND,
	sumout => \inst1|Add1~21_sumout\,
	cout => \inst1|Add1~22\);

-- Location: LABCELL_X52_Y20_N21
\inst1|cont200[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont200[0]~3_combout\ = ( !\inst1|Add1~21_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst1|ALT_INV_Add1~21_sumout\,
	combout => \inst1|cont200[0]~3_combout\);

-- Location: FF_X52_Y20_N23
\inst1|cont200[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont200[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200[0]~DUPLICATE_q\);

-- Location: LABCELL_X52_Y20_N33
\inst1|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add1~17_sumout\ = SUM(( \inst1|cont200\(1) ) + ( GND ) + ( \inst1|Add1~22\ ))
-- \inst1|Add1~18\ = CARRY(( \inst1|cont200\(1) ) + ( GND ) + ( \inst1|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont200\(1),
	cin => \inst1|Add1~22\,
	sumout => \inst1|Add1~17_sumout\,
	cout => \inst1|Add1~18\);

-- Location: FF_X52_Y20_N34
\inst1|cont200[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add1~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200[1]~DUPLICATE_q\);

-- Location: FF_X52_Y20_N7
\inst1|cont200[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont200~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200\(2));

-- Location: LABCELL_X52_Y20_N36
\inst1|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add1~13_sumout\ = SUM(( \inst1|cont200\(2) ) + ( GND ) + ( \inst1|Add1~18\ ))
-- \inst1|Add1~14\ = CARRY(( \inst1|cont200\(2) ) + ( GND ) + ( \inst1|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont200\(2),
	cin => \inst1|Add1~18\,
	sumout => \inst1|Add1~13_sumout\,
	cout => \inst1|Add1~14\);

-- Location: LABCELL_X52_Y20_N39
\inst1|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add1~9_sumout\ = SUM(( \inst1|cont200\(3) ) + ( GND ) + ( \inst1|Add1~14\ ))
-- \inst1|Add1~10\ = CARRY(( \inst1|cont200\(3) ) + ( GND ) + ( \inst1|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont200\(3),
	cin => \inst1|Add1~14\,
	sumout => \inst1|Add1~9_sumout\,
	cout => \inst1|Add1~10\);

-- Location: FF_X52_Y20_N41
\inst1|cont200[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add1~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200\(3));

-- Location: LABCELL_X52_Y20_N42
\inst1|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add1~5_sumout\ = SUM(( \inst1|cont200\(4) ) + ( GND ) + ( \inst1|Add1~10\ ))
-- \inst1|Add1~6\ = CARRY(( \inst1|cont200\(4) ) + ( GND ) + ( \inst1|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont200\(4),
	cin => \inst1|Add1~10\,
	sumout => \inst1|Add1~5_sumout\,
	cout => \inst1|Add1~6\);

-- Location: FF_X52_Y20_N43
\inst1|cont200[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add1~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200\(4));

-- Location: FF_X52_Y20_N14
\inst1|cont200[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont200~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200\(5));

-- Location: LABCELL_X52_Y20_N45
\inst1|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add1~1_sumout\ = SUM(( \inst1|cont200\(5) ) + ( GND ) + ( \inst1|Add1~6\ ))
-- \inst1|Add1~2\ = CARRY(( \inst1|cont200\(5) ) + ( GND ) + ( \inst1|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_cont200\(5),
	cin => \inst1|Add1~6\,
	sumout => \inst1|Add1~1_sumout\,
	cout => \inst1|Add1~2\);

-- Location: LABCELL_X52_Y20_N48
\inst1|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add1~25_sumout\ = SUM(( \inst1|cont200\(6) ) + ( GND ) + ( \inst1|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont200\(6),
	cin => \inst1|Add1~2\,
	sumout => \inst1|Add1~25_sumout\);

-- Location: LABCELL_X52_Y20_N57
\inst1|cont200~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont200~2_combout\ = ( \inst1|cont200[0]~DUPLICATE_q\ & ( \inst1|Add1~25_sumout\ & ( (!\inst1|Equal1~0_combout\) # ((!\inst1|cont200[2]~DUPLICATE_q\) # (\inst1|cont200\(1))) ) ) ) # ( !\inst1|cont200[0]~DUPLICATE_q\ & ( \inst1|Add1~25_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Equal1~0_combout\,
	datac => \inst1|ALT_INV_cont200[2]~DUPLICATE_q\,
	datad => \inst1|ALT_INV_cont200\(1),
	datae => \inst1|ALT_INV_cont200[0]~DUPLICATE_q\,
	dataf => \inst1|ALT_INV_Add1~25_sumout\,
	combout => \inst1|cont200~2_combout\);

-- Location: FF_X52_Y20_N59
\inst1|cont200[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont200~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200\(6));

-- Location: LABCELL_X52_Y20_N24
\inst1|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Equal1~0_combout\ = ( \inst1|cont200\(6) & ( \inst1|cont200[5]~DUPLICATE_q\ & ( (!\inst1|cont200\(3) & !\inst1|cont200\(4)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_cont200\(3),
	datad => \inst1|ALT_INV_cont200\(4),
	datae => \inst1|ALT_INV_cont200\(6),
	dataf => \inst1|ALT_INV_cont200[5]~DUPLICATE_q\,
	combout => \inst1|Equal1~0_combout\);

-- Location: FF_X52_Y20_N22
\inst1|cont200[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont200[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200\(0));

-- Location: LABCELL_X52_Y20_N6
\inst1|cont200~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont200~1_combout\ = ( \inst1|cont200\(2) & ( \inst1|Add1~13_sumout\ & ( ((!\inst1|Equal1~0_combout\) # (!\inst1|cont200\(0))) # (\inst1|cont200\(1)) ) ) ) # ( !\inst1|cont200\(2) & ( \inst1|Add1~13_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_cont200\(1),
	datab => \inst1|ALT_INV_Equal1~0_combout\,
	datad => \inst1|ALT_INV_cont200\(0),
	datae => \inst1|ALT_INV_cont200\(2),
	dataf => \inst1|ALT_INV_Add1~13_sumout\,
	combout => \inst1|cont200~1_combout\);

-- Location: FF_X52_Y20_N8
\inst1|cont200[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont200~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200[2]~DUPLICATE_q\);

-- Location: LABCELL_X52_Y20_N12
\inst1|cont200~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont200~0_combout\ = ( \inst1|Add1~1_sumout\ & ( ((!\inst1|cont200[2]~DUPLICATE_q\) # ((!\inst1|Equal1~0_combout\) # (!\inst1|cont200[0]~DUPLICATE_q\))) # (\inst1|cont200[1]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111011111111111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_cont200[1]~DUPLICATE_q\,
	datab => \inst1|ALT_INV_cont200[2]~DUPLICATE_q\,
	datac => \inst1|ALT_INV_Equal1~0_combout\,
	datad => \inst1|ALT_INV_cont200[0]~DUPLICATE_q\,
	dataf => \inst1|ALT_INV_Add1~1_sumout\,
	combout => \inst1|cont200~0_combout\);

-- Location: FF_X52_Y20_N13
\inst1|cont200[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont200~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont200[5]~DUPLICATE_q\);

-- Location: IOIBUF_X54_Y20_N55
\a1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a1,
	o => \a1~input_o\);

-- Location: LABCELL_X52_Y20_N15
\inst2|Z~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Z~2_combout\ = ( !\inst1|cont200\(3) & ( (!\inst1|cont200[2]~DUPLICATE_q\ & ((!\inst1|cont200[1]~DUPLICATE_q\) # (\inst1|cont200\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110010001100100011001000110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_cont200[1]~DUPLICATE_q\,
	datab => \inst1|ALT_INV_cont200[2]~DUPLICATE_q\,
	datac => \inst1|ALT_INV_cont200\(0),
	dataf => \inst1|ALT_INV_cont200\(3),
	combout => \inst2|Z~2_combout\);

-- Location: LABCELL_X53_Y20_N9
\inst2|Z~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Z~3_combout\ = ( !\inst2|Z~2_combout\ & ( (\inst1|cont200[5]~DUPLICATE_q\ & (\inst1|cont200\(4) & \a1~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_cont200[5]~DUPLICATE_q\,
	datac => \inst1|ALT_INV_cont200\(4),
	datad => \ALT_INV_a1~input_o\,
	dataf => \inst2|ALT_INV_Z~2_combout\,
	combout => \inst2|Z~3_combout\);

-- Location: LABCELL_X53_Y20_N30
\inst1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~13_sumout\ = SUM(( !\inst1|cont20\(0) ) + ( VCC ) + ( !VCC ))
-- \inst1|Add0~14\ = CARRY(( !\inst1|cont20\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(0),
	cin => GND,
	sumout => \inst1|Add0~13_sumout\,
	cout => \inst1|Add0~14\);

-- Location: LABCELL_X53_Y20_N21
\inst1|cont20[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont20[0]~0_combout\ = ( !\inst1|Add0~13_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst1|ALT_INV_Add0~13_sumout\,
	combout => \inst1|cont20[0]~0_combout\);

-- Location: FF_X53_Y20_N23
\inst1|cont20[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont20[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(0));

-- Location: LABCELL_X53_Y20_N33
\inst1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~17_sumout\ = SUM(( \inst1|cont20\(1) ) + ( GND ) + ( \inst1|Add0~14\ ))
-- \inst1|Add0~18\ = CARRY(( \inst1|cont20\(1) ) + ( GND ) + ( \inst1|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(1),
	cin => \inst1|Add0~14\,
	sumout => \inst1|Add0~17_sumout\,
	cout => \inst1|Add0~18\);

-- Location: LABCELL_X53_Y20_N15
\inst1|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Equal0~1_combout\ = ( \inst1|cont20\(9) & ( (\inst1|cont20\(3) & (!\inst1|cont20\(4) & !\inst1|cont20\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110000000000000011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_cont20\(3),
	datac => \inst1|ALT_INV_cont20\(4),
	datad => \inst1|ALT_INV_cont20\(2),
	dataf => \inst1|ALT_INV_cont20\(9),
	combout => \inst1|Equal0~1_combout\);

-- Location: LABCELL_X53_Y20_N6
\inst1|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Equal0~0_combout\ = ( \inst1|cont20\(6) & ( (\inst1|cont20\(5) & (\inst1|cont20\(7) & \inst1|cont20\(8))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_cont20\(5),
	datac => \inst1|ALT_INV_cont20\(7),
	datad => \inst1|ALT_INV_cont20\(8),
	dataf => \inst1|ALT_INV_cont20\(6),
	combout => \inst1|Equal0~0_combout\);

-- Location: LABCELL_X53_Y20_N24
\inst1|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Equal0~2_combout\ = ( \inst1|Equal0~0_combout\ & ( (\inst1|Equal0~1_combout\ & (!\inst1|cont20\(1) & \inst1|cont20\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_Equal0~1_combout\,
	datac => \inst1|ALT_INV_cont20\(1),
	datad => \inst1|ALT_INV_cont20\(0),
	dataf => \inst1|ALT_INV_Equal0~0_combout\,
	combout => \inst1|Equal0~2_combout\);

-- Location: FF_X53_Y20_N35
\inst1|cont20[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~17_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(1));

-- Location: LABCELL_X53_Y20_N36
\inst1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~9_sumout\ = SUM(( \inst1|cont20\(2) ) + ( GND ) + ( \inst1|Add0~18\ ))
-- \inst1|Add0~10\ = CARRY(( \inst1|cont20\(2) ) + ( GND ) + ( \inst1|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(2),
	cin => \inst1|Add0~18\,
	sumout => \inst1|Add0~9_sumout\,
	cout => \inst1|Add0~10\);

-- Location: FF_X53_Y20_N38
\inst1|cont20[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~9_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(2));

-- Location: LABCELL_X53_Y20_N39
\inst1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~5_sumout\ = SUM(( \inst1|cont20\(3) ) + ( GND ) + ( \inst1|Add0~10\ ))
-- \inst1|Add0~6\ = CARRY(( \inst1|cont20\(3) ) + ( GND ) + ( \inst1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(3),
	cin => \inst1|Add0~10\,
	sumout => \inst1|Add0~5_sumout\,
	cout => \inst1|Add0~6\);

-- Location: FF_X53_Y20_N41
\inst1|cont20[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~5_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(3));

-- Location: LABCELL_X53_Y20_N42
\inst1|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~1_sumout\ = SUM(( \inst1|cont20\(4) ) + ( GND ) + ( \inst1|Add0~6\ ))
-- \inst1|Add0~2\ = CARRY(( \inst1|cont20\(4) ) + ( GND ) + ( \inst1|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(4),
	cin => \inst1|Add0~6\,
	sumout => \inst1|Add0~1_sumout\,
	cout => \inst1|Add0~2\);

-- Location: FF_X53_Y20_N44
\inst1|cont20[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~1_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(4));

-- Location: LABCELL_X53_Y20_N45
\inst1|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~33_sumout\ = SUM(( \inst1|cont20\(5) ) + ( GND ) + ( \inst1|Add0~2\ ))
-- \inst1|Add0~34\ = CARRY(( \inst1|cont20\(5) ) + ( GND ) + ( \inst1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(5),
	cin => \inst1|Add0~2\,
	sumout => \inst1|Add0~33_sumout\,
	cout => \inst1|Add0~34\);

-- Location: FF_X53_Y20_N47
\inst1|cont20[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~33_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(5));

-- Location: LABCELL_X53_Y20_N48
\inst1|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~29_sumout\ = SUM(( \inst1|cont20\(6) ) + ( GND ) + ( \inst1|Add0~34\ ))
-- \inst1|Add0~30\ = CARRY(( \inst1|cont20\(6) ) + ( GND ) + ( \inst1|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(6),
	cin => \inst1|Add0~34\,
	sumout => \inst1|Add0~29_sumout\,
	cout => \inst1|Add0~30\);

-- Location: FF_X53_Y20_N50
\inst1|cont20[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~29_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(6));

-- Location: LABCELL_X53_Y20_N51
\inst1|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~25_sumout\ = SUM(( \inst1|cont20\(7) ) + ( GND ) + ( \inst1|Add0~30\ ))
-- \inst1|Add0~26\ = CARRY(( \inst1|cont20\(7) ) + ( GND ) + ( \inst1|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(7),
	cin => \inst1|Add0~30\,
	sumout => \inst1|Add0~25_sumout\,
	cout => \inst1|Add0~26\);

-- Location: FF_X53_Y20_N53
\inst1|cont20[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~25_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(7));

-- Location: LABCELL_X53_Y20_N54
\inst1|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~21_sumout\ = SUM(( \inst1|cont20\(8) ) + ( GND ) + ( \inst1|Add0~26\ ))
-- \inst1|Add0~22\ = CARRY(( \inst1|cont20\(8) ) + ( GND ) + ( \inst1|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(8),
	cin => \inst1|Add0~26\,
	sumout => \inst1|Add0~21_sumout\,
	cout => \inst1|Add0~22\);

-- Location: FF_X53_Y20_N56
\inst1|cont20[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~21_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(8));

-- Location: LABCELL_X53_Y20_N57
\inst1|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~37_sumout\ = SUM(( \inst1|cont20\(9) ) + ( GND ) + ( \inst1|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|ALT_INV_cont20\(9),
	cin => \inst1|Add0~22\,
	sumout => \inst1|Add0~37_sumout\);

-- Location: FF_X53_Y20_N58
\inst1|cont20[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|Add0~37_sumout\,
	sclr => \inst1|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20\(9));

-- Location: IOIBUF_X54_Y20_N4
\a0~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a0,
	o => \a0~input_o\);

-- Location: LABCELL_X53_Y20_N27
\inst2|Z~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Z~4_combout\ = ( \inst1|cont200\(6) & ( ((\inst1|cont20\(9) & \a0~input_o\)) # (\a1~input_o\) ) ) # ( !\inst1|cont200\(6) & ( (\inst1|cont20\(9) & (\a0~input_o\ & !\a1~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000101111111110000010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_cont20\(9),
	datac => \ALT_INV_a0~input_o\,
	datad => \ALT_INV_a1~input_o\,
	dataf => \inst1|ALT_INV_cont200\(6),
	combout => \inst2|Z~4_combout\);

-- Location: FF_X53_Y19_N10
\inst1|cont20k[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont20k[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20k\(0));

-- Location: LABCELL_X53_Y19_N9
\inst1|cont20k[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont20k[0]~2_combout\ = ( !\inst1|cont20k\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst1|ALT_INV_cont20k\(0),
	combout => \inst1|cont20k[0]~2_combout\);

-- Location: FF_X53_Y19_N11
\inst1|cont20k[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont20k[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20k[0]~DUPLICATE_q\);

-- Location: LABCELL_X53_Y19_N48
\inst1|cont20k~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont20k~0_combout\ = ( !\inst1|cont20k\(1) & ( !\inst1|cont20k[0]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst1|ALT_INV_cont20k\(1),
	dataf => \inst1|ALT_INV_cont20k[0]~DUPLICATE_q\,
	combout => \inst1|cont20k~0_combout\);

-- Location: FF_X53_Y19_N50
\inst1|cont20k[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont20k~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20k\(1));

-- Location: FF_X53_Y19_N58
\inst1|cont2k[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont2k[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont2k\(2));

-- Location: LABCELL_X53_Y19_N12
\inst1|cont2k~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont2k~0_combout\ = ( \inst1|cont2k\(3) & ( \inst1|cont2k\(1) & ( !\inst1|cont2k[2]~DUPLICATE_q\ $ (\inst1|cont20k[0]~DUPLICATE_q\) ) ) ) # ( !\inst1|cont2k\(3) & ( \inst1|cont2k\(1) & ( (\inst1|cont2k[2]~DUPLICATE_q\ & 
-- !\inst1|cont20k[0]~DUPLICATE_q\) ) ) ) # ( \inst1|cont2k\(3) & ( !\inst1|cont2k\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100110011000000001100110000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_cont2k[2]~DUPLICATE_q\,
	datad => \inst1|ALT_INV_cont20k[0]~DUPLICATE_q\,
	datae => \inst1|ALT_INV_cont2k\(3),
	dataf => \inst1|ALT_INV_cont2k\(1),
	combout => \inst1|cont2k~0_combout\);

-- Location: FF_X53_Y19_N14
\inst1|cont2k[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont2k~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont2k\(3));

-- Location: LABCELL_X53_Y19_N30
\inst1|cont2k~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont2k~2_combout\ = ( \inst1|cont2k\(1) & ( \inst1|cont2k\(2) & ( \inst1|cont20k[0]~DUPLICATE_q\ ) ) ) # ( !\inst1|cont2k\(1) & ( \inst1|cont2k\(2) & ( !\inst1|cont20k[0]~DUPLICATE_q\ ) ) ) # ( \inst1|cont2k\(1) & ( !\inst1|cont2k\(2) & ( 
-- (\inst1|cont20k[0]~DUPLICATE_q\ & !\inst1|cont2k\(3)) ) ) ) # ( !\inst1|cont2k\(1) & ( !\inst1|cont2k\(2) & ( !\inst1|cont20k[0]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100001100110000000011001100110011000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_cont20k[0]~DUPLICATE_q\,
	datad => \inst1|ALT_INV_cont2k\(3),
	datae => \inst1|ALT_INV_cont2k\(1),
	dataf => \inst1|ALT_INV_cont2k\(2),
	combout => \inst1|cont2k~2_combout\);

-- Location: FF_X53_Y19_N31
\inst1|cont2k[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont2k~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont2k\(1));

-- Location: LABCELL_X53_Y19_N57
\inst1|cont2k[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|cont2k[2]~1_combout\ = ( \inst1|cont2k\(2) & ( \inst1|cont2k\(1) & ( \inst1|cont20k[0]~DUPLICATE_q\ ) ) ) # ( !\inst1|cont2k\(2) & ( \inst1|cont2k\(1) & ( !\inst1|cont20k[0]~DUPLICATE_q\ ) ) ) # ( \inst1|cont2k\(2) & ( !\inst1|cont2k\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_cont20k[0]~DUPLICATE_q\,
	datae => \inst1|ALT_INV_cont2k\(2),
	dataf => \inst1|ALT_INV_cont2k\(1),
	combout => \inst1|cont2k[2]~1_combout\);

-- Location: FF_X53_Y19_N59
\inst1|cont2k[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont2k[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont2k[2]~DUPLICATE_q\);

-- Location: IOIBUF_X54_Y20_N21
\a2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a2,
	o => \a2~input_o\);

-- Location: IOIBUF_X54_Y19_N38
\a3~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a3,
	o => \a3~input_o\);

-- Location: FF_X53_Y19_N32
\inst1|cont2k[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont2k~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont2k[1]~DUPLICATE_q\);

-- Location: LABCELL_X53_Y19_N42
\inst2|Z~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Z~6_combout\ = ( !\a3~input_o\ & ( ((\a2~input_o\ & (((\inst1|cont2k[2]~DUPLICATE_q\ & \inst1|cont2k[1]~DUPLICATE_q\)) # (\inst1|cont2k\(3))))) ) ) # ( \a3~input_o\ & ( (\inst1|cont20k\(1) & (((\inst1|cont20k\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000011000001010000010100000000111111110000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_cont20k\(1),
	datab => \inst1|ALT_INV_cont2k[2]~DUPLICATE_q\,
	datac => \inst1|ALT_INV_cont20k\(0),
	datad => \ALT_INV_a2~input_o\,
	datae => \ALT_INV_a3~input_o\,
	dataf => \inst1|ALT_INV_cont2k\(3),
	datag => \inst1|ALT_INV_cont2k[1]~DUPLICATE_q\,
	combout => \inst2|Z~6_combout\);

-- Location: FF_X53_Y20_N22
\inst1|cont20[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputCLKENA0_outclk\,
	d => \inst1|cont20[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|cont20[0]~DUPLICATE_q\);

-- Location: LABCELL_X53_Y20_N12
\inst2|Z~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Z~0_combout\ = ( \inst1|cont20[0]~DUPLICATE_q\ & ( (!\inst1|cont20\(3) & ((!\inst1|cont20\(2)) # (!\inst1|cont20\(1)))) ) ) # ( !\inst1|cont20[0]~DUPLICATE_q\ & ( (!\inst1|cont20\(2) & !\inst1|cont20\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100011001000110010001100100011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_cont20\(2),
	datab => \inst1|ALT_INV_cont20\(3),
	datac => \inst1|ALT_INV_cont20\(1),
	dataf => \inst1|ALT_INV_cont20[0]~DUPLICATE_q\,
	combout => \inst2|Z~0_combout\);

-- Location: LABCELL_X53_Y20_N18
\inst2|Z~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Z~1_combout\ = ( \inst1|cont20\(4) & ( (\inst1|Equal0~0_combout\ & (!\inst2|Z~0_combout\ & (!\a1~input_o\ & \a0~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Equal0~0_combout\,
	datab => \inst2|ALT_INV_Z~0_combout\,
	datac => \ALT_INV_a1~input_o\,
	datad => \ALT_INV_a0~input_o\,
	dataf => \inst1|ALT_INV_cont20\(4),
	combout => \inst2|Z~1_combout\);

-- Location: LABCELL_X53_Y20_N0
\inst2|Z~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Z~5_combout\ = ( \a3~input_o\ & ( \a2~input_o\ & ( \inst2|Z~6_combout\ ) ) ) # ( !\a3~input_o\ & ( \a2~input_o\ & ( \inst2|Z~6_combout\ ) ) ) # ( \a3~input_o\ & ( !\a2~input_o\ & ( \inst2|Z~6_combout\ ) ) ) # ( !\a3~input_o\ & ( !\a2~input_o\ & ( 
-- (((\inst2|Z~1_combout\) # (\inst2|Z~6_combout\)) # (\inst2|Z~4_combout\)) # (\inst2|Z~3_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111111111111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_Z~3_combout\,
	datab => \inst2|ALT_INV_Z~4_combout\,
	datac => \inst2|ALT_INV_Z~6_combout\,
	datad => \inst2|ALT_INV_Z~1_combout\,
	datae => \ALT_INV_a3~input_o\,
	dataf => \ALT_INV_a2~input_o\,
	combout => \inst2|Z~5_combout\);

-- Location: LABCELL_X12_Y1_N0
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


