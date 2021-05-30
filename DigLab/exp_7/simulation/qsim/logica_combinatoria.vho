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

-- DATE "05/03/2020 23:05:11"

-- 
-- Device: Altera 5CEFA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	logica_combinatoria IS
    PORT (
	VdA : OUT std_logic;
	Q1 : IN std_logic;
	Q0 : IN std_logic;
	Q2 : IN std_logic;
	AmA : OUT std_logic;
	VmA : OUT std_logic;
	VdB : OUT std_logic;
	AmB : OUT std_logic;
	VmB : OUT std_logic;
	trigger_1s : OUT std_logic;
	trigger_5s : OUT std_logic;
	trigger_1min : OUT std_logic
	);
END logica_combinatoria;

ARCHITECTURE structure OF logica_combinatoria IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_VdA : std_logic;
SIGNAL ww_Q1 : std_logic;
SIGNAL ww_Q0 : std_logic;
SIGNAL ww_Q2 : std_logic;
SIGNAL ww_AmA : std_logic;
SIGNAL ww_VmA : std_logic;
SIGNAL ww_VdB : std_logic;
SIGNAL ww_AmB : std_logic;
SIGNAL ww_VmB : std_logic;
SIGNAL ww_trigger_1s : std_logic;
SIGNAL ww_trigger_5s : std_logic;
SIGNAL ww_trigger_1min : std_logic;
SIGNAL \VdA~output_o\ : std_logic;
SIGNAL \AmA~output_o\ : std_logic;
SIGNAL \VmA~output_o\ : std_logic;
SIGNAL \VdB~output_o\ : std_logic;
SIGNAL \AmB~output_o\ : std_logic;
SIGNAL \VmB~output_o\ : std_logic;
SIGNAL \trigger_1s~output_o\ : std_logic;
SIGNAL \trigger_5s~output_o\ : std_logic;
SIGNAL \trigger_1min~output_o\ : std_logic;
SIGNAL \Q0~input_o\ : std_logic;
SIGNAL \Q1~input_o\ : std_logic;
SIGNAL \Q2~input_o\ : std_logic;
SIGNAL \inst3~combout\ : std_logic;
SIGNAL \inst5~combout\ : std_logic;
SIGNAL \inst6~0_combout\ : std_logic;
SIGNAL \inst8~combout\ : std_logic;
SIGNAL \inst12~combout\ : std_logic;
SIGNAL \inst15~combout\ : std_logic;
SIGNAL \inst4~combout\ : std_logic;
SIGNAL \inst22~combout\ : std_logic;
SIGNAL \inst19~combout\ : std_logic;
SIGNAL \ALT_INV_inst8~combout\ : std_logic;
SIGNAL \ALT_INV_Q0~input_o\ : std_logic;
SIGNAL \ALT_INV_Q2~input_o\ : std_logic;
SIGNAL \ALT_INV_Q1~input_o\ : std_logic;
SIGNAL \ALT_INV_inst3~combout\ : std_logic;

BEGIN

VdA <= ww_VdA;
ww_Q1 <= Q1;
ww_Q0 <= Q0;
ww_Q2 <= Q2;
AmA <= ww_AmA;
VmA <= ww_VmA;
VdB <= ww_VdB;
AmB <= ww_AmB;
VmB <= ww_VmB;
trigger_1s <= ww_trigger_1s;
trigger_5s <= ww_trigger_5s;
trigger_1min <= ww_trigger_1min;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_inst8~combout\ <= NOT \inst8~combout\;
\ALT_INV_Q0~input_o\ <= NOT \Q0~input_o\;
\ALT_INV_Q2~input_o\ <= NOT \Q2~input_o\;
\ALT_INV_Q1~input_o\ <= NOT \Q1~input_o\;
\ALT_INV_inst3~combout\ <= NOT \inst3~combout\;

\VdA~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_inst3~combout\,
	devoe => ww_devoe,
	o => \VdA~output_o\);

\AmA~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5~combout\,
	devoe => ww_devoe,
	o => \AmA~output_o\);

\VmA~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6~0_combout\,
	devoe => ww_devoe,
	o => \VmA~output_o\);

\VdB~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_inst8~combout\,
	devoe => ww_devoe,
	o => \VdB~output_o\);

\AmB~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12~combout\,
	devoe => ww_devoe,
	o => \AmB~output_o\);

\VmB~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15~combout\,
	devoe => ww_devoe,
	o => \VmB~output_o\);

\trigger_1s~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~combout\,
	devoe => ww_devoe,
	o => \trigger_1s~output_o\);

\trigger_5s~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst22~combout\,
	devoe => ww_devoe,
	o => \trigger_5s~output_o\);

\trigger_1min~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19~combout\,
	devoe => ww_devoe,
	o => \trigger_1min~output_o\);

\Q0~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Q0,
	o => \Q0~input_o\);

\Q1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Q1,
	o => \Q1~input_o\);

\Q2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Q2,
	o => \Q2~input_o\);

inst3 : cyclonev_lcell_comb
-- Equation(s):
-- \inst3~combout\ = ((\Q2~input_o\) # (\Q1~input_o\)) # (\Q0~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111101111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q1~input_o\,
	datac => \ALT_INV_Q2~input_o\,
	combout => \inst3~combout\);

inst5 : cyclonev_lcell_comb
-- Equation(s):
-- \inst5~combout\ = (\Q0~input_o\ & !\Q1~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q1~input_o\,
	combout => \inst5~combout\);

\inst6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6~0_combout\ = (\Q1~input_o\ & ((!\Q0~input_o\) # (!\Q2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000110010001100100011001000110010001100100011001000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q1~input_o\,
	datac => \ALT_INV_Q2~input_o\,
	combout => \inst6~0_combout\);

inst8 : cyclonev_lcell_comb
-- Equation(s):
-- \inst8~combout\ = ((!\Q1~input_o\) # (\Q2~input_o\)) # (\Q0~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101111111011111110111111101111111011111110111111101111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q1~input_o\,
	datac => \ALT_INV_Q2~input_o\,
	combout => \inst8~combout\);

inst12 : cyclonev_lcell_comb
-- Equation(s):
-- \inst12~combout\ = (\Q0~input_o\ & (!\Q1~input_o\ $ (!\Q2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000010100000101000001010000010100000101000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q1~input_o\,
	datac => \ALT_INV_Q2~input_o\,
	combout => \inst12~combout\);

inst15 : cyclonev_lcell_comb
-- Equation(s):
-- \inst15~combout\ = (!\Q1~input_o\ & ((!\Q2~input_o\))) # (\Q1~input_o\ & (!\Q0~input_o\ & \Q2~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001011000010110000101100001011000010110000101100001011000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q1~input_o\,
	datac => \ALT_INV_Q2~input_o\,
	combout => \inst15~combout\);

inst4 : cyclonev_lcell_comb
-- Equation(s):
-- \inst4~combout\ = (!\Q1~input_o\ & \Q2~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q1~input_o\,
	datab => \ALT_INV_Q2~input_o\,
	combout => \inst4~combout\);

inst22 : cyclonev_lcell_comb
-- Equation(s):
-- \inst22~combout\ = (\Q0~input_o\ & !\Q2~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q2~input_o\,
	combout => \inst22~combout\);

inst19 : cyclonev_lcell_comb
-- Equation(s):
-- \inst19~combout\ = (!\Q0~input_o\ & ((!\Q2~input_o\) # (\Q1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001010100010101000101010001010100010101000101010001010100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q0~input_o\,
	datab => \ALT_INV_Q1~input_o\,
	datac => \ALT_INV_Q2~input_o\,
	combout => \inst19~combout\);

ww_VdA <= \VdA~output_o\;

ww_AmA <= \AmA~output_o\;

ww_VmA <= \VmA~output_o\;

ww_VdB <= \VdB~output_o\;

ww_AmB <= \AmB~output_o\;

ww_VmB <= \VmB~output_o\;

ww_trigger_1s <= \trigger_1s~output_o\;

ww_trigger_5s <= \trigger_5s~output_o\;

ww_trigger_1min <= \trigger_1min~output_o\;
END structure;


