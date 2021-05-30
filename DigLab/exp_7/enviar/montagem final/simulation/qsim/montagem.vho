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

-- DATE "06/23/2020 18:21:22"

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

ENTITY 	montagem IS
    PORT (
	VdA : OUT std_logic;
	reset : IN std_logic;
	clock : IN std_logic;
	noturno : IN std_logic;
	PvA : IN std_logic;
	PvB : IN std_logic;
	AmA : OUT std_logic;
	VmA : OUT std_logic;
	VdB : OUT std_logic;
	AmB : OUT std_logic;
	VmB : OUT std_logic;
	pin_name1 : OUT std_logic;
	trigger_1s : OUT std_logic;
	trigger_5s : OUT std_logic;
	trigger_1min : OUT std_logic
	);
END montagem;

ARCHITECTURE structure OF montagem IS
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
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_noturno : std_logic;
SIGNAL ww_PvA : std_logic;
SIGNAL ww_PvB : std_logic;
SIGNAL ww_AmA : std_logic;
SIGNAL ww_VmA : std_logic;
SIGNAL ww_VdB : std_logic;
SIGNAL ww_AmB : std_logic;
SIGNAL ww_VmB : std_logic;
SIGNAL ww_pin_name1 : std_logic;
SIGNAL ww_trigger_1s : std_logic;
SIGNAL ww_trigger_5s : std_logic;
SIGNAL ww_trigger_1min : std_logic;
SIGNAL \VdA~output_o\ : std_logic;
SIGNAL \AmA~output_o\ : std_logic;
SIGNAL \VmA~output_o\ : std_logic;
SIGNAL \VdB~output_o\ : std_logic;
SIGNAL \AmB~output_o\ : std_logic;
SIGNAL \VmB~output_o\ : std_logic;
SIGNAL \pin_name1~output_o\ : std_logic;
SIGNAL \trigger_1s~output_o\ : std_logic;
SIGNAL \trigger_5s~output_o\ : std_logic;
SIGNAL \trigger_1min~output_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \noturno~input_o\ : std_logic;
SIGNAL \PvA~input_o\ : std_logic;
SIGNAL \inst1|Selector5~0_combout\ : std_logic;
SIGNAL \PvB~input_o\ : std_logic;
SIGNAL \inst1|Selector10~0_combout\ : std_logic;
SIGNAL \inst1|reg_fstate.VmA_AmB_286~combout\ : std_logic;
SIGNAL \inst1|fstate.VmA_AmB~q\ : std_logic;
SIGNAL \inst1|Selector6~0_combout\ : std_logic;
SIGNAL \inst1|reg_fstate.VmA_VmB_265~combout\ : std_logic;
SIGNAL \inst1|fstate.VmA_VmB~q\ : std_logic;
SIGNAL \inst1|Selector7~0_combout\ : std_logic;
SIGNAL \inst1|reg_fstate.Apagado_244~combout\ : std_logic;
SIGNAL \inst1|fstate.Apagado~q\ : std_logic;
SIGNAL \inst1|Selector0~0_combout\ : std_logic;
SIGNAL \inst1|reg_fstate.AmA_AmB_223~combout\ : std_logic;
SIGNAL \inst1|fstate.AmA_AmB~q\ : std_logic;
SIGNAL \inst1|Selector2~0_combout\ : std_logic;
SIGNAL \inst1|Selector2~1_combout\ : std_logic;
SIGNAL \inst1|reg_fstate.VdA_Vmb_349~combout\ : std_logic;
SIGNAL \inst1|fstate.VdA_Vmb~0_combout\ : std_logic;
SIGNAL \inst1|fstate.VdA_Vmb~q\ : std_logic;
SIGNAL \inst1|Selector4~0_combout\ : std_logic;
SIGNAL \inst1|reg_fstate.AmA_VmB_307~combout\ : std_logic;
SIGNAL \inst1|fstate.AmA_VmB~q\ : std_logic;
SIGNAL \inst1|Q[0]~0_combout\ : std_logic;
SIGNAL \inst|trigger_1s~0_combout\ : std_logic;
SIGNAL \inst2|flag~0_combout\ : std_logic;
SIGNAL \inst2|conta1[2]~2_combout\ : std_logic;
SIGNAL \inst2|conta1[3]~3_combout\ : std_logic;
SIGNAL \inst2|conta1~5_combout\ : std_logic;
SIGNAL \inst2|conta1~4_combout\ : std_logic;
SIGNAL \inst2|conta1~1_combout\ : std_logic;
SIGNAL \inst2|conta1~0_combout\ : std_logic;
SIGNAL \inst2|Equal2~0_combout\ : std_logic;
SIGNAL \inst2|conta2[0]~1_combout\ : std_logic;
SIGNAL \inst2|conta2[1]~2_combout\ : std_logic;
SIGNAL \inst2|conta2[2]~0_combout\ : std_logic;
SIGNAL \inst2|Equal0~0_combout\ : std_logic;
SIGNAL \inst2|conta3[0]~0_combout\ : std_logic;
SIGNAL \inst2|conta3[1]~1_combout\ : std_logic;
SIGNAL \inst2|conta3[2]~2_combout\ : std_logic;
SIGNAL \inst2|Add1~0_combout\ : std_logic;
SIGNAL \inst2|conta3[3]~3_combout\ : std_logic;
SIGNAL \inst2|conta3[4]~4_combout\ : std_logic;
SIGNAL \inst2|Add1~1_combout\ : std_logic;
SIGNAL \inst2|conta3[5]~5_combout\ : std_logic;
SIGNAL \inst2|Equal1~0_combout\ : std_logic;
SIGNAL \inst2|flag~1_combout\ : std_logic;
SIGNAL \inst2|flag~q\ : std_logic;
SIGNAL \inst1|Selector3~0_combout\ : std_logic;
SIGNAL \inst1|reg_fstate.VmA_VdB_328~combout\ : std_logic;
SIGNAL \inst1|fstate.VmA_VdB~q\ : std_logic;
SIGNAL \inst1|WideOr2~combout\ : std_logic;
SIGNAL \inst1|WideOr3~combout\ : std_logic;
SIGNAL \inst1|WideOr1~combout\ : std_logic;
SIGNAL \inst|VdA~0_combout\ : std_logic;
SIGNAL \inst|AmA~combout\ : std_logic;
SIGNAL \inst|VmA~combout\ : std_logic;
SIGNAL \inst|VdB~0_combout\ : std_logic;
SIGNAL \inst|AmB~combout\ : std_logic;
SIGNAL \inst|VmB~0_combout\ : std_logic;
SIGNAL \inst|trigger_1min~0_combout\ : std_logic;
SIGNAL \inst2|conta1\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|conta2\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst2|conta3\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_PvA~input_o\ : std_logic;
SIGNAL \ALT_INV_noturno~input_o\ : std_logic;
SIGNAL \ALT_INV_PvB~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \inst1|ALT_INV_reg_fstate.VdA_Vmb_349~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_reg_fstate.Apagado_244~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_reg_fstate.AmA_AmB_223~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_reg_fstate.AmA_VmB_307~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_reg_fstate.VmA_VmB_265~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_reg_fstate.VmA_AmB_286~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_reg_fstate.VmA_VdB_328~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector2~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Add1~1_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_fstate.VdA_Vmb~q\ : std_logic;
SIGNAL \inst2|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_conta3\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_conta2\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst2|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_conta1\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst1|ALT_INV_fstate.VmA_VdB~q\ : std_logic;
SIGNAL \inst1|ALT_INV_fstate.VmA_AmB~q\ : std_logic;
SIGNAL \inst1|ALT_INV_fstate.VmA_VmB~q\ : std_logic;
SIGNAL \inst1|ALT_INV_WideOr2~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_fstate.AmA_VmB~q\ : std_logic;
SIGNAL \inst1|ALT_INV_fstate.AmA_AmB~q\ : std_logic;
SIGNAL \inst1|ALT_INV_WideOr3~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_fstate.Apagado~q\ : std_logic;
SIGNAL \inst1|ALT_INV_WideOr1~combout\ : std_logic;
SIGNAL \inst|ALT_INV_AmA~combout\ : std_logic;
SIGNAL \inst|ALT_INV_VdA~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_VmA~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Q[0]~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_VdB~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_trigger_1s~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_flag~q\ : std_logic;
SIGNAL \inst2|ALT_INV_flag~0_combout\ : std_logic;

BEGIN

VdA <= ww_VdA;
ww_reset <= reset;
ww_clock <= clock;
ww_noturno <= noturno;
ww_PvA <= PvA;
ww_PvB <= PvB;
AmA <= ww_AmA;
VmA <= ww_VmA;
VdB <= ww_VdB;
AmB <= ww_AmB;
VmB <= ww_VmB;
pin_name1 <= ww_pin_name1;
trigger_1s <= ww_trigger_1s;
trigger_5s <= ww_trigger_5s;
trigger_1min <= ww_trigger_1min;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_PvA~input_o\ <= NOT \PvA~input_o\;
\ALT_INV_noturno~input_o\ <= NOT \noturno~input_o\;
\ALT_INV_PvB~input_o\ <= NOT \PvB~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\inst1|ALT_INV_reg_fstate.VdA_Vmb_349~combout\ <= NOT \inst1|reg_fstate.VdA_Vmb_349~combout\;
\inst1|ALT_INV_reg_fstate.Apagado_244~combout\ <= NOT \inst1|reg_fstate.Apagado_244~combout\;
\inst1|ALT_INV_reg_fstate.AmA_AmB_223~combout\ <= NOT \inst1|reg_fstate.AmA_AmB_223~combout\;
\inst1|ALT_INV_reg_fstate.AmA_VmB_307~combout\ <= NOT \inst1|reg_fstate.AmA_VmB_307~combout\;
\inst1|ALT_INV_reg_fstate.VmA_VmB_265~combout\ <= NOT \inst1|reg_fstate.VmA_VmB_265~combout\;
\inst1|ALT_INV_reg_fstate.VmA_AmB_286~combout\ <= NOT \inst1|reg_fstate.VmA_AmB_286~combout\;
\inst1|ALT_INV_reg_fstate.VmA_VdB_328~combout\ <= NOT \inst1|reg_fstate.VmA_VdB_328~combout\;
\inst1|ALT_INV_Selector2~1_combout\ <= NOT \inst1|Selector2~1_combout\;
\inst1|ALT_INV_Selector2~0_combout\ <= NOT \inst1|Selector2~0_combout\;
\inst2|ALT_INV_Add1~1_combout\ <= NOT \inst2|Add1~1_combout\;
\inst2|ALT_INV_Add1~0_combout\ <= NOT \inst2|Add1~0_combout\;
\inst1|ALT_INV_Selector7~0_combout\ <= NOT \inst1|Selector7~0_combout\;
\inst1|ALT_INV_Selector0~0_combout\ <= NOT \inst1|Selector0~0_combout\;
\inst1|ALT_INV_Selector4~0_combout\ <= NOT \inst1|Selector4~0_combout\;
\inst1|ALT_INV_Selector6~0_combout\ <= NOT \inst1|Selector6~0_combout\;
\inst1|ALT_INV_Selector5~0_combout\ <= NOT \inst1|Selector5~0_combout\;
\inst1|ALT_INV_Selector10~0_combout\ <= NOT \inst1|Selector10~0_combout\;
\inst1|ALT_INV_Selector3~0_combout\ <= NOT \inst1|Selector3~0_combout\;
\inst1|ALT_INV_fstate.VdA_Vmb~q\ <= NOT \inst1|fstate.VdA_Vmb~q\;
\inst2|ALT_INV_Equal1~0_combout\ <= NOT \inst2|Equal1~0_combout\;
\inst2|ALT_INV_conta3\(5) <= NOT \inst2|conta3\(5);
\inst2|ALT_INV_conta3\(4) <= NOT \inst2|conta3\(4);
\inst2|ALT_INV_conta3\(3) <= NOT \inst2|conta3\(3);
\inst2|ALT_INV_conta3\(2) <= NOT \inst2|conta3\(2);
\inst2|ALT_INV_conta3\(1) <= NOT \inst2|conta3\(1);
\inst2|ALT_INV_conta3\(0) <= NOT \inst2|conta3\(0);
\inst2|ALT_INV_Equal0~0_combout\ <= NOT \inst2|Equal0~0_combout\;
\inst2|ALT_INV_conta2\(1) <= NOT \inst2|conta2\(1);
\inst2|ALT_INV_conta2\(0) <= NOT \inst2|conta2\(0);
\inst2|ALT_INV_conta2\(2) <= NOT \inst2|conta2\(2);
\inst2|ALT_INV_Equal2~0_combout\ <= NOT \inst2|Equal2~0_combout\;
\inst2|ALT_INV_conta1\(5) <= NOT \inst2|conta1\(5);
\inst2|ALT_INV_conta1\(4) <= NOT \inst2|conta1\(4);
\inst2|ALT_INV_conta1\(3) <= NOT \inst2|conta1\(3);
\inst2|ALT_INV_conta1\(2) <= NOT \inst2|conta1\(2);
\inst1|ALT_INV_fstate.VmA_VdB~q\ <= NOT \inst1|fstate.VmA_VdB~q\;
\inst1|ALT_INV_fstate.VmA_AmB~q\ <= NOT \inst1|fstate.VmA_AmB~q\;
\inst1|ALT_INV_fstate.VmA_VmB~q\ <= NOT \inst1|fstate.VmA_VmB~q\;
\inst1|ALT_INV_WideOr2~combout\ <= NOT \inst1|WideOr2~combout\;
\inst1|ALT_INV_fstate.AmA_VmB~q\ <= NOT \inst1|fstate.AmA_VmB~q\;
\inst1|ALT_INV_fstate.AmA_AmB~q\ <= NOT \inst1|fstate.AmA_AmB~q\;
\inst1|ALT_INV_WideOr3~combout\ <= NOT \inst1|WideOr3~combout\;
\inst1|ALT_INV_fstate.Apagado~q\ <= NOT \inst1|fstate.Apagado~q\;
\inst1|ALT_INV_WideOr1~combout\ <= NOT \inst1|WideOr1~combout\;
\inst|ALT_INV_AmA~combout\ <= NOT \inst|AmA~combout\;
\inst|ALT_INV_VdA~0_combout\ <= NOT \inst|VdA~0_combout\;
\inst|ALT_INV_VmA~combout\ <= NOT \inst|VmA~combout\;
\inst1|ALT_INV_Q[0]~0_combout\ <= NOT \inst1|Q[0]~0_combout\;
\inst2|ALT_INV_conta1\(0) <= NOT \inst2|conta1\(0);
\inst2|ALT_INV_conta1\(1) <= NOT \inst2|conta1\(1);
\inst|ALT_INV_VdB~0_combout\ <= NOT \inst|VdB~0_combout\;
\inst|ALT_INV_trigger_1s~0_combout\ <= NOT \inst|trigger_1s~0_combout\;
\inst2|ALT_INV_flag~q\ <= NOT \inst2|flag~q\;
\inst2|ALT_INV_flag~0_combout\ <= NOT \inst2|flag~0_combout\;

\VdA~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_VdA~0_combout\,
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
	i => \inst|ALT_INV_AmA~combout\,
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
	i => \inst|ALT_INV_VmA~combout\,
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
	i => \inst|ALT_INV_VdB~0_combout\,
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
	i => \inst|AmB~combout\,
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
	i => \inst|VmB~0_combout\,
	devoe => ww_devoe,
	o => \VmB~output_o\);

\pin_name1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|flag~q\,
	devoe => ww_devoe,
	o => \pin_name1~output_o\);

\trigger_1s~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|trigger_1s~0_combout\,
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
	i => \inst2|flag~0_combout\,
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
	i => \inst|trigger_1min~0_combout\,
	devoe => ww_devoe,
	o => \trigger_1min~output_o\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\noturno~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_noturno,
	o => \noturno~input_o\);

\PvA~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PvA,
	o => \PvA~input_o\);

\inst1|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector5~0_combout\ = (\inst1|fstate.VmA_VdB~q\ & ((\PvA~input_o\) # (\noturno~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100010101000101010001010100010101000101010001010100010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_VdB~q\,
	datab => \ALT_INV_noturno~input_o\,
	datac => \ALT_INV_PvA~input_o\,
	combout => \inst1|Selector5~0_combout\);

\PvB~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PvB,
	o => \PvB~input_o\);

\inst1|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector10~0_combout\ = (!\inst1|fstate.VmA_VdB~q\) # (((\PvA~input_o\) # (\noturno~input_o\)) # (\PvB~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111111111111101111111111111110111111111111111011111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_VdB~q\,
	datab => \ALT_INV_PvB~input_o\,
	datac => \ALT_INV_noturno~input_o\,
	datad => \ALT_INV_PvA~input_o\,
	combout => \inst1|Selector10~0_combout\);

\inst1|reg_fstate.VmA_AmB_286\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|reg_fstate.VmA_AmB_286~combout\ = ( \inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|Selector5~0_combout\ ) ) ) # ( !\inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|reg_fstate.VmA_AmB_286~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Selector5~0_combout\,
	datad => \inst1|ALT_INV_reg_fstate.VmA_AmB_286~combout\,
	datae => \inst1|ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \inst1|reg_fstate.VmA_AmB_286~combout\);

\inst1|fstate.VmA_AmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|flag~q\,
	d => \inst1|reg_fstate.VmA_AmB_286~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|fstate.VmA_AmB~q\);

\inst1|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector6~0_combout\ = ( !\PvA~input_o\ & ( (!\PvB~input_o\ & (!\noturno~input_o\ & ((!\inst1|fstate.VdA_Vmb~q\) # (\inst1|fstate.VmA_VmB~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010000000000000000000000000011000100000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_VmB~q\,
	datab => \ALT_INV_PvB~input_o\,
	datac => \inst1|ALT_INV_fstate.VdA_Vmb~q\,
	datad => \ALT_INV_noturno~input_o\,
	datae => \ALT_INV_PvA~input_o\,
	combout => \inst1|Selector6~0_combout\);

\inst1|reg_fstate.VmA_VmB_265\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|reg_fstate.VmA_VmB_265~combout\ = ( \inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|Selector6~0_combout\ ) ) ) # ( !\inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|reg_fstate.VmA_VmB_265~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Selector6~0_combout\,
	datad => \inst1|ALT_INV_reg_fstate.VmA_VmB_265~combout\,
	datae => \inst1|ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \inst1|reg_fstate.VmA_VmB_265~combout\);

\inst1|fstate.VmA_VmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|flag~q\,
	d => \inst1|reg_fstate.VmA_VmB_265~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|fstate.VmA_VmB~q\);

\inst1|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector7~0_combout\ = (\inst1|fstate.AmA_AmB~q\ & \noturno~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	datab => \ALT_INV_noturno~input_o\,
	combout => \inst1|Selector7~0_combout\);

\inst1|reg_fstate.Apagado_244\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|reg_fstate.Apagado_244~combout\ = ( \inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|Selector7~0_combout\ ) ) ) # ( !\inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|reg_fstate.Apagado_244~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Selector7~0_combout\,
	datad => \inst1|ALT_INV_reg_fstate.Apagado_244~combout\,
	datae => \inst1|ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \inst1|reg_fstate.Apagado_244~combout\);

\inst1|fstate.Apagado\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|flag~q\,
	d => \inst1|reg_fstate.Apagado_244~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|fstate.Apagado~q\);

\inst1|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector0~0_combout\ = ((!\inst1|fstate.VdA_Vmb~q\ & \noturno~input_o\)) # (\inst1|fstate.Apagado~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101011101010111010101110101011101010111010101110101011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.Apagado~q\,
	datab => \inst1|ALT_INV_fstate.VdA_Vmb~q\,
	datac => \ALT_INV_noturno~input_o\,
	combout => \inst1|Selector0~0_combout\);

\inst1|reg_fstate.AmA_AmB_223\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|reg_fstate.AmA_AmB_223~combout\ = ( \inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|Selector0~0_combout\ ) ) ) # ( !\inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|reg_fstate.AmA_AmB_223~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Selector0~0_combout\,
	datad => \inst1|ALT_INV_reg_fstate.AmA_AmB_223~combout\,
	datae => \inst1|ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \inst1|reg_fstate.AmA_AmB_223~combout\);

\inst1|fstate.AmA_AmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|flag~q\,
	d => \inst1|reg_fstate.AmA_AmB_223~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|fstate.AmA_AmB~q\);

\inst1|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector2~0_combout\ = (!\inst1|fstate.VmA_AmB~q\ & ((!\inst1|fstate.AmA_AmB~q\) # (\noturno~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000101010001010100010101000101010001010100010101000101010001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_AmB~q\,
	datab => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	datac => \ALT_INV_noturno~input_o\,
	combout => \inst1|Selector2~0_combout\);

\inst1|Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector2~1_combout\ = ( \PvA~input_o\ & ( \inst1|Selector2~0_combout\ & ( ((!\PvB~input_o\ & (!\inst1|fstate.VdA_Vmb~q\ & !\noturno~input_o\))) # (\inst1|fstate.VmA_VmB~q\) ) ) ) # ( !\PvA~input_o\ & ( \inst1|Selector2~0_combout\ & ( 
-- (\inst1|fstate.VmA_VmB~q\ & ((\noturno~input_o\) # (\PvB~input_o\))) ) ) ) # ( \PvA~input_o\ & ( !\inst1|Selector2~0_combout\ ) ) # ( !\PvA~input_o\ & ( !\inst1|Selector2~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100010001010101011101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_VmB~q\,
	datab => \ALT_INV_PvB~input_o\,
	datac => \inst1|ALT_INV_fstate.VdA_Vmb~q\,
	datad => \ALT_INV_noturno~input_o\,
	datae => \ALT_INV_PvA~input_o\,
	dataf => \inst1|ALT_INV_Selector2~0_combout\,
	combout => \inst1|Selector2~1_combout\);

\inst1|reg_fstate.VdA_Vmb_349\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|reg_fstate.VdA_Vmb_349~combout\ = ( \inst1|Selector10~0_combout\ & ( \reset~input_o\ ) ) # ( !\inst1|Selector10~0_combout\ & ( \reset~input_o\ ) ) # ( \inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|Selector2~1_combout\ ) ) ) # ( 
-- !\inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|reg_fstate.VdA_Vmb_349~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Selector2~1_combout\,
	datad => \inst1|ALT_INV_reg_fstate.VdA_Vmb_349~combout\,
	datae => \inst1|ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \inst1|reg_fstate.VdA_Vmb_349~combout\);

\inst1|fstate.VdA_Vmb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|fstate.VdA_Vmb~0_combout\ = !\inst1|reg_fstate.VdA_Vmb_349~combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_reg_fstate.VdA_Vmb_349~combout\,
	combout => \inst1|fstate.VdA_Vmb~0_combout\);

\inst1|fstate.VdA_Vmb\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|flag~q\,
	d => \inst1|fstate.VdA_Vmb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|fstate.VdA_Vmb~q\);

\inst1|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector4~0_combout\ = (\PvB~input_o\ & (!\inst1|fstate.VdA_Vmb~q\ & (!\noturno~input_o\ & \PvA~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PvB~input_o\,
	datab => \inst1|ALT_INV_fstate.VdA_Vmb~q\,
	datac => \ALT_INV_noturno~input_o\,
	datad => \ALT_INV_PvA~input_o\,
	combout => \inst1|Selector4~0_combout\);

\inst1|reg_fstate.AmA_VmB_307\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|reg_fstate.AmA_VmB_307~combout\ = ( \inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|Selector4~0_combout\ ) ) ) # ( !\inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|reg_fstate.AmA_VmB_307~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Selector4~0_combout\,
	datad => \inst1|ALT_INV_reg_fstate.AmA_VmB_307~combout\,
	datae => \inst1|ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \inst1|reg_fstate.AmA_VmB_307~combout\);

\inst1|fstate.AmA_VmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|flag~q\,
	d => \inst1|reg_fstate.AmA_VmB_307~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|fstate.AmA_VmB~q\);

\inst1|Q[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Q[0]~0_combout\ = (!\reset~input_o\ & (((\inst1|fstate.AmA_AmB~q\) # (\inst1|fstate.AmA_VmB~q\)) # (\inst1|fstate.VmA_AmB~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010101010101000101010101010100010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_fstate.VmA_AmB~q\,
	datac => \inst1|ALT_INV_fstate.AmA_VmB~q\,
	datad => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	combout => \inst1|Q[0]~0_combout\);

\inst|trigger_1s~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|trigger_1s~0_combout\ = ( \inst1|fstate.AmA_AmB~q\ & ( \inst1|fstate.Apagado~q\ & ( (!\reset~input_o\ & (!\inst1|fstate.VmA_VdB~q\ & (!\inst1|fstate.VmA_AmB~q\ & !\inst1|fstate.VmA_VmB~q\))) ) ) ) # ( !\inst1|fstate.AmA_AmB~q\ & ( 
-- \inst1|fstate.Apagado~q\ & ( (!\reset~input_o\ & (!\inst1|fstate.VmA_VdB~q\ & (!\inst1|fstate.VmA_AmB~q\ & !\inst1|fstate.VmA_VmB~q\))) ) ) ) # ( \inst1|fstate.AmA_AmB~q\ & ( !\inst1|fstate.Apagado~q\ & ( (!\reset~input_o\ & (!\inst1|fstate.VmA_VdB~q\ & 
-- (!\inst1|fstate.VmA_AmB~q\ & !\inst1|fstate.VmA_VmB~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_fstate.VmA_VdB~q\,
	datac => \inst1|ALT_INV_fstate.VmA_AmB~q\,
	datad => \inst1|ALT_INV_fstate.VmA_VmB~q\,
	datae => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	dataf => \inst1|ALT_INV_fstate.Apagado~q\,
	combout => \inst|trigger_1s~0_combout\);

\inst2|flag~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|flag~0_combout\ = ( !\inst1|fstate.AmA_AmB~q\ & ( !\inst1|fstate.Apagado~q\ & ( (!\reset~input_o\ & (!\inst1|fstate.VmA_VmB~q\ & ((\inst1|fstate.AmA_VmB~q\) # (\inst1|fstate.VmA_AmB~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000010100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_fstate.VmA_AmB~q\,
	datac => \inst1|ALT_INV_fstate.VmA_VmB~q\,
	datad => \inst1|ALT_INV_fstate.AmA_VmB~q\,
	datae => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	dataf => \inst1|ALT_INV_fstate.Apagado~q\,
	combout => \inst2|flag~0_combout\);

\inst2|conta1[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta1[2]~2_combout\ = !\inst2|conta1\(2) $ (((!\inst2|conta1\(0)) # (!\inst2|conta1\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000011110000111100001111000011110000111100001111000011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta1\(0),
	datab => \inst2|ALT_INV_conta1\(1),
	datac => \inst2|ALT_INV_conta1\(2),
	combout => \inst2|conta1[2]~2_combout\);

\inst2|conta1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta1[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta1\(2));

\inst2|conta1[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta1[3]~3_combout\ = !\inst2|conta1\(3) $ (((!\inst2|conta1\(0)) # ((!\inst2|conta1\(1)) # (!\inst2|conta1\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000000011111111000000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta1\(0),
	datab => \inst2|ALT_INV_conta1\(1),
	datac => \inst2|ALT_INV_conta1\(2),
	datad => \inst2|ALT_INV_conta1\(3),
	combout => \inst2|conta1[3]~3_combout\);

\inst2|conta1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta1[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta1\(3));

\inst2|conta1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta1~5_combout\ = ( \inst2|conta1\(4) & ( \inst2|conta1\(5) & ( (!\inst2|conta1\(1)) # ((!\inst2|conta1\(0) & ((\inst2|conta1\(3)) # (\inst2|conta1\(2)))) # (\inst2|conta1\(0) & ((!\inst2|conta1\(2)) # (!\inst2|conta1\(3))))) ) ) ) # ( 
-- !\inst2|conta1\(4) & ( \inst2|conta1\(5) ) ) # ( \inst2|conta1\(4) & ( !\inst2|conta1\(5) & ( (\inst2|conta1\(0) & (\inst2|conta1\(1) & (\inst2|conta1\(2) & \inst2|conta1\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000111111111111111111101111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta1\(0),
	datab => \inst2|ALT_INV_conta1\(1),
	datac => \inst2|ALT_INV_conta1\(2),
	datad => \inst2|ALT_INV_conta1\(3),
	datae => \inst2|ALT_INV_conta1\(4),
	dataf => \inst2|ALT_INV_conta1\(5),
	combout => \inst2|conta1~5_combout\);

\inst2|conta1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta1\(5));

\inst2|conta1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta1~4_combout\ = ( \inst2|conta1\(4) & ( \inst2|conta1\(5) & ( (!\inst2|conta1\(1)) # ((!\inst2|conta1\(0) & ((\inst2|conta1\(3)) # (\inst2|conta1\(2)))) # (\inst2|conta1\(0) & ((!\inst2|conta1\(2)) # (!\inst2|conta1\(3))))) ) ) ) # ( 
-- !\inst2|conta1\(4) & ( \inst2|conta1\(5) & ( (\inst2|conta1\(0) & (\inst2|conta1\(1) & (\inst2|conta1\(2) & \inst2|conta1\(3)))) ) ) ) # ( \inst2|conta1\(4) & ( !\inst2|conta1\(5) & ( (!\inst2|conta1\(0)) # ((!\inst2|conta1\(1)) # ((!\inst2|conta1\(2)) # 
-- (!\inst2|conta1\(3)))) ) ) ) # ( !\inst2|conta1\(4) & ( !\inst2|conta1\(5) & ( (\inst2|conta1\(0) & (\inst2|conta1\(1) & (\inst2|conta1\(2) & \inst2|conta1\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111111111000000000000000011101111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta1\(0),
	datab => \inst2|ALT_INV_conta1\(1),
	datac => \inst2|ALT_INV_conta1\(2),
	datad => \inst2|ALT_INV_conta1\(3),
	datae => \inst2|ALT_INV_conta1\(4),
	dataf => \inst2|ALT_INV_conta1\(5),
	combout => \inst2|conta1~4_combout\);

\inst2|conta1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta1\(4));

\inst2|conta1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta1~1_combout\ = ( \inst2|conta1\(4) & ( \inst2|conta1\(5) & ( (!\inst2|conta1\(0) & (\inst2|conta1\(1) & ((\inst2|conta1\(3)) # (\inst2|conta1\(2))))) # (\inst2|conta1\(0) & (!\inst2|conta1\(1))) ) ) ) # ( !\inst2|conta1\(4) & ( 
-- \inst2|conta1\(5) & ( !\inst2|conta1\(0) $ (!\inst2|conta1\(1)) ) ) ) # ( \inst2|conta1\(4) & ( !\inst2|conta1\(5) & ( !\inst2|conta1\(0) $ (!\inst2|conta1\(1)) ) ) ) # ( !\inst2|conta1\(4) & ( !\inst2|conta1\(5) & ( !\inst2|conta1\(0) $ 
-- (!\inst2|conta1\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100100011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta1\(0),
	datab => \inst2|ALT_INV_conta1\(1),
	datac => \inst2|ALT_INV_conta1\(2),
	datad => \inst2|ALT_INV_conta1\(3),
	datae => \inst2|ALT_INV_conta1\(4),
	dataf => \inst2|ALT_INV_conta1\(5),
	combout => \inst2|conta1~1_combout\);

\inst2|conta1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta1\(1));

\inst2|conta1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta1~0_combout\ = ( \inst2|conta1\(4) & ( \inst2|conta1\(5) & ( (!\inst2|conta1\(0) & ((!\inst2|conta1\(1)) # ((\inst2|conta1\(3)) # (\inst2|conta1\(2))))) ) ) ) # ( !\inst2|conta1\(4) & ( \inst2|conta1\(5) & ( !\inst2|conta1\(0) ) ) ) # ( 
-- \inst2|conta1\(4) & ( !\inst2|conta1\(5) & ( !\inst2|conta1\(0) ) ) ) # ( !\inst2|conta1\(4) & ( !\inst2|conta1\(5) & ( !\inst2|conta1\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101000101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta1\(0),
	datab => \inst2|ALT_INV_conta1\(1),
	datac => \inst2|ALT_INV_conta1\(2),
	datad => \inst2|ALT_INV_conta1\(3),
	datae => \inst2|ALT_INV_conta1\(4),
	dataf => \inst2|ALT_INV_conta1\(5),
	combout => \inst2|conta1~0_combout\);

\inst2|conta1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta1\(0));

\inst2|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Equal2~0_combout\ = ( \inst2|conta1\(4) & ( \inst2|conta1\(5) & ( (!\inst2|conta1\(0) & (\inst2|conta1\(1) & (!\inst2|conta1\(2) & !\inst2|conta1\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta1\(0),
	datab => \inst2|ALT_INV_conta1\(1),
	datac => \inst2|ALT_INV_conta1\(2),
	datad => \inst2|ALT_INV_conta1\(3),
	datae => \inst2|ALT_INV_conta1\(4),
	dataf => \inst2|ALT_INV_conta1\(5),
	combout => \inst2|Equal2~0_combout\);

\inst2|conta2[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta2[0]~1_combout\ = (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\ & (\inst2|conta2\(0) & !\inst2|Equal0~0_combout\))) # (\inst2|Equal2~0_combout\ & (((!\inst2|conta2\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011100000110000001110000011000000111000001100000011100000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta2\(0),
	datad => \inst2|ALT_INV_Equal0~0_combout\,
	combout => \inst2|conta2[0]~1_combout\);

\inst2|conta2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta2\(0));

\inst2|conta2[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta2[1]~2_combout\ = (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\ & ((\inst2|conta2\(1))))) # (\inst2|Equal2~0_combout\ & ((!\inst2|conta2\(0) $ (!\inst2|conta2\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001110111000000000111011100000000011101110000000001110111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta2\(0),
	datad => \inst2|ALT_INV_conta2\(1),
	combout => \inst2|conta2[1]~2_combout\);

\inst2|conta2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta2[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta2\(1));

\inst2|conta2[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta2[2]~0_combout\ = ( \inst2|conta2\(1) & ( (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\ & (\inst2|conta2\(2)))) # (\inst2|Equal2~0_combout\ & ((!\inst2|conta2\(2) $ (!\inst2|conta2\(0))))) ) ) # ( !\inst2|conta2\(1) & ( (\inst2|conta2\(2) & 
-- (((!\inst2|flag~q\ & !\inst2|conta2\(0))) # (\inst2|Equal2~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101100000011000010110011100000001011000000110000101100111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta2\(2),
	datad => \inst2|ALT_INV_conta2\(0),
	datae => \inst2|ALT_INV_conta2\(1),
	combout => \inst2|conta2[2]~0_combout\);

\inst2|conta2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta2[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta2\(2));

\inst2|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Equal0~0_combout\ = (\inst2|conta2\(2) & (\inst2|conta2\(0) & !\inst2|conta2\(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta2\(2),
	datab => \inst2|ALT_INV_conta2\(0),
	datac => \inst2|ALT_INV_conta2\(1),
	combout => \inst2|Equal0~0_combout\);

\inst2|conta3[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta3[0]~0_combout\ = (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\ & (\inst2|conta3\(0) & !\inst2|Equal1~0_combout\))) # (\inst2|Equal2~0_combout\ & (((!\inst2|conta3\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011100000110000001110000011000000111000001100000011100000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta3\(0),
	datad => \inst2|ALT_INV_Equal1~0_combout\,
	combout => \inst2|conta3[0]~0_combout\);

\inst2|conta3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta3[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta3\(0));

\inst2|conta3[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta3[1]~1_combout\ = ( \inst2|Equal1~0_combout\ & ( (\inst2|Equal2~0_combout\ & (!\inst2|conta3\(0) $ (!\inst2|conta3\(1)))) ) ) # ( !\inst2|Equal1~0_combout\ & ( (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\ & ((\inst2|conta3\(1))))) # 
-- (\inst2|Equal2~0_combout\ & ((!\inst2|conta3\(0) $ (!\inst2|conta3\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001110111000000000110011000000000011101110000000001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta3\(0),
	datad => \inst2|ALT_INV_conta3\(1),
	datae => \inst2|ALT_INV_Equal1~0_combout\,
	combout => \inst2|conta3[1]~1_combout\);

\inst2|conta3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta3[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta3\(1));

\inst2|conta3[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta3[2]~2_combout\ = ( \inst2|conta3\(2) & ( \inst2|Equal1~0_combout\ & ( (\inst2|Equal2~0_combout\ & ((!\inst2|conta3\(0)) # (!\inst2|conta3\(1)))) ) ) ) # ( !\inst2|conta3\(2) & ( \inst2|Equal1~0_combout\ & ( (\inst2|Equal2~0_combout\ & 
-- (\inst2|conta3\(0) & \inst2|conta3\(1))) ) ) ) # ( \inst2|conta3\(2) & ( !\inst2|Equal1~0_combout\ & ( (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\)) # (\inst2|Equal2~0_combout\ & (((!\inst2|conta3\(0)) # (!\inst2|conta3\(1))))) ) ) ) # ( 
-- !\inst2|conta3\(2) & ( !\inst2|Equal1~0_combout\ & ( (\inst2|Equal2~0_combout\ & (\inst2|conta3\(0) & \inst2|conta3\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011101110111011100000000000000000110011001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta3\(0),
	datad => \inst2|ALT_INV_conta3\(1),
	datae => \inst2|ALT_INV_conta3\(2),
	dataf => \inst2|ALT_INV_Equal1~0_combout\,
	combout => \inst2|conta3[2]~2_combout\);

\inst2|conta3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta3[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta3\(2));

\inst2|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Add1~0_combout\ = (\inst2|conta3\(0) & (\inst2|conta3\(1) & \inst2|conta3\(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta3\(0),
	datab => \inst2|ALT_INV_conta3\(1),
	datac => \inst2|ALT_INV_conta3\(2),
	combout => \inst2|Add1~0_combout\);

\inst2|conta3[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta3[3]~3_combout\ = ( \inst2|Add1~0_combout\ & ( (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\ & (\inst2|conta3\(3) & !\inst2|Equal1~0_combout\))) # (\inst2|Equal2~0_combout\ & (((!\inst2|conta3\(3))))) ) ) # ( !\inst2|Add1~0_combout\ & ( 
-- (\inst2|conta3\(3) & (((!\inst2|flag~q\ & !\inst2|Equal1~0_combout\)) # (\inst2|Equal2~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101100000011001110000011000000001011000000110011100000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta3\(3),
	datad => \inst2|ALT_INV_Equal1~0_combout\,
	datae => \inst2|ALT_INV_Add1~0_combout\,
	combout => \inst2|conta3[3]~3_combout\);

\inst2|conta3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta3[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta3\(3));

\inst2|conta3[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta3[4]~4_combout\ = ( \inst2|Equal1~0_combout\ & ( \inst2|Add1~0_combout\ & ( (\inst2|Equal2~0_combout\ & (!\inst2|conta3\(3) $ (!\inst2|conta3\(4)))) ) ) ) # ( !\inst2|Equal1~0_combout\ & ( \inst2|Add1~0_combout\ & ( (!\inst2|Equal2~0_combout\ 
-- & (!\inst2|flag~q\ & ((\inst2|conta3\(4))))) # (\inst2|Equal2~0_combout\ & ((!\inst2|conta3\(3) $ (!\inst2|conta3\(4))))) ) ) ) # ( \inst2|Equal1~0_combout\ & ( !\inst2|Add1~0_combout\ & ( (\inst2|Equal2~0_combout\ & \inst2|conta3\(4)) ) ) ) # ( 
-- !\inst2|Equal1~0_combout\ & ( !\inst2|Add1~0_combout\ & ( (\inst2|conta3\(4) & ((!\inst2|flag~q\) # (\inst2|Equal2~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010111011000000000011001100000011101110000000001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta3\(3),
	datad => \inst2|ALT_INV_conta3\(4),
	datae => \inst2|ALT_INV_Equal1~0_combout\,
	dataf => \inst2|ALT_INV_Add1~0_combout\,
	combout => \inst2|conta3[4]~4_combout\);

\inst2|conta3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta3[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta3\(4));

\inst2|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Add1~1_combout\ = ( \inst2|conta3\(4) & ( (\inst2|conta3\(0) & (\inst2|conta3\(1) & (\inst2|conta3\(2) & \inst2|conta3\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta3\(0),
	datab => \inst2|ALT_INV_conta3\(1),
	datac => \inst2|ALT_INV_conta3\(2),
	datad => \inst2|ALT_INV_conta3\(3),
	datae => \inst2|ALT_INV_conta3\(4),
	combout => \inst2|Add1~1_combout\);

\inst2|conta3[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta3[5]~5_combout\ = ( \inst2|Add1~1_combout\ & ( (!\inst2|Equal2~0_combout\ & (!\inst2|flag~q\ & (\inst2|conta3\(5) & !\inst2|Equal1~0_combout\))) # (\inst2|Equal2~0_combout\ & (((!\inst2|conta3\(5))))) ) ) # ( !\inst2|Add1~1_combout\ & ( 
-- (\inst2|conta3\(5) & (((!\inst2|flag~q\ & !\inst2|Equal1~0_combout\)) # (\inst2|Equal2~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101100000011001110000011000000001011000000110011100000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_flag~q\,
	datab => \inst2|ALT_INV_Equal2~0_combout\,
	datac => \inst2|ALT_INV_conta3\(5),
	datad => \inst2|ALT_INV_Equal1~0_combout\,
	datae => \inst2|ALT_INV_Add1~1_combout\,
	combout => \inst2|conta3[5]~5_combout\);

\inst2|conta3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|conta3[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta3\(5));

\inst2|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Equal1~0_combout\ = ( \inst2|conta3\(4) & ( \inst2|conta3\(5) & ( (!\inst2|conta3\(0) & (!\inst2|conta3\(1) & (\inst2|conta3\(2) & \inst2|conta3\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta3\(0),
	datab => \inst2|ALT_INV_conta3\(1),
	datac => \inst2|ALT_INV_conta3\(2),
	datad => \inst2|ALT_INV_conta3\(3),
	datae => \inst2|ALT_INV_conta3\(4),
	dataf => \inst2|ALT_INV_conta3\(5),
	combout => \inst2|Equal1~0_combout\);

\inst2|flag~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|flag~1_combout\ = ( \inst2|Equal0~0_combout\ & ( \inst2|Equal1~0_combout\ & ( ((!\inst|trigger_1s~0_combout\ & (!\inst1|Q[0]~0_combout\)) # (\inst|trigger_1s~0_combout\ & ((\inst2|Equal2~0_combout\)))) # (\inst2|flag~0_combout\) ) ) ) # ( 
-- !\inst2|Equal0~0_combout\ & ( \inst2|Equal1~0_combout\ & ( (!\inst|trigger_1s~0_combout\ & (!\inst1|Q[0]~0_combout\)) # (\inst|trigger_1s~0_combout\ & ((\inst2|Equal2~0_combout\))) ) ) ) # ( \inst2|Equal0~0_combout\ & ( !\inst2|Equal1~0_combout\ & ( 
-- ((\inst|trigger_1s~0_combout\ & \inst2|Equal2~0_combout\)) # (\inst2|flag~0_combout\) ) ) ) # ( !\inst2|Equal0~0_combout\ & ( !\inst2|Equal1~0_combout\ & ( (\inst|trigger_1s~0_combout\ & \inst2|Equal2~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000011110011111110001000101110111000111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Q[0]~0_combout\,
	datab => \inst|ALT_INV_trigger_1s~0_combout\,
	datac => \inst2|ALT_INV_flag~0_combout\,
	datad => \inst2|ALT_INV_Equal2~0_combout\,
	datae => \inst2|ALT_INV_Equal0~0_combout\,
	dataf => \inst2|ALT_INV_Equal1~0_combout\,
	combout => \inst2|flag~1_combout\);

\inst2|flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|flag~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|flag~q\);

\inst1|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Selector3~0_combout\ = ( \noturno~input_o\ & ( \PvA~input_o\ & ( \inst1|fstate.AmA_VmB~q\ ) ) ) # ( !\noturno~input_o\ & ( \PvA~input_o\ & ( \inst1|fstate.AmA_VmB~q\ ) ) ) # ( \noturno~input_o\ & ( !\PvA~input_o\ & ( \inst1|fstate.AmA_VmB~q\ ) ) ) 
-- # ( !\noturno~input_o\ & ( !\PvA~input_o\ & ( (((\PvB~input_o\ & !\inst1|fstate.VdA_Vmb~q\)) # (\inst1|fstate.AmA_VmB~q\)) # (\inst1|fstate.VmA_VdB~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101110111001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_VdB~q\,
	datab => \inst1|ALT_INV_fstate.AmA_VmB~q\,
	datac => \ALT_INV_PvB~input_o\,
	datad => \inst1|ALT_INV_fstate.VdA_Vmb~q\,
	datae => \ALT_INV_noturno~input_o\,
	dataf => \ALT_INV_PvA~input_o\,
	combout => \inst1|Selector3~0_combout\);

\inst1|reg_fstate.VmA_VdB_328\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|reg_fstate.VmA_VdB_328~combout\ = ( \inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|Selector3~0_combout\ ) ) ) # ( !\inst1|Selector10~0_combout\ & ( !\reset~input_o\ & ( \inst1|reg_fstate.VmA_VdB_328~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|ALT_INV_Selector3~0_combout\,
	datad => \inst1|ALT_INV_reg_fstate.VmA_VdB_328~combout\,
	datae => \inst1|ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \inst1|reg_fstate.VmA_VdB_328~combout\);

\inst1|fstate.VmA_VdB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|flag~q\,
	d => \inst1|reg_fstate.VmA_VdB_328~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|fstate.VmA_VdB~q\);

\inst1|WideOr2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|WideOr2~combout\ = (!\inst1|fstate.VmA_VdB~q\ & (!\inst1|fstate.VmA_AmB~q\ & !\inst1|fstate.VmA_VmB~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_VdB~q\,
	datab => \inst1|ALT_INV_fstate.VmA_AmB~q\,
	datac => \inst1|ALT_INV_fstate.VmA_VmB~q\,
	combout => \inst1|WideOr2~combout\);

\inst1|WideOr3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|WideOr3~combout\ = (!\inst1|fstate.VmA_AmB~q\ & (!\inst1|fstate.AmA_VmB~q\ & !\inst1|fstate.AmA_AmB~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_AmB~q\,
	datab => \inst1|ALT_INV_fstate.AmA_VmB~q\,
	datac => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	combout => \inst1|WideOr3~combout\);

\inst1|WideOr1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|WideOr1~combout\ = (!\inst1|fstate.VmA_VmB~q\ & (!\inst1|fstate.AmA_AmB~q\ & !\inst1|fstate.Apagado~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_fstate.VmA_VmB~q\,
	datab => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	datac => \inst1|ALT_INV_fstate.Apagado~q\,
	combout => \inst1|WideOr1~combout\);

\inst|VdA~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|VdA~0_combout\ = (!\reset~input_o\ & ((!\inst1|WideOr2~combout\) # ((!\inst1|WideOr3~combout\) # (!\inst1|WideOr1~combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101000101010101010100010101010101010001010101010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_WideOr2~combout\,
	datac => \inst1|ALT_INV_WideOr3~combout\,
	datad => \inst1|ALT_INV_WideOr1~combout\,
	combout => \inst|VdA~0_combout\);

\inst|AmA\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|AmA~combout\ = ( \inst1|fstate.AmA_VmB~q\ & ( \inst1|fstate.AmA_AmB~q\ & ( (((\inst1|fstate.VmA_VmB~q\) # (\inst1|fstate.VmA_AmB~q\)) # (\inst1|fstate.VmA_VdB~q\)) # (\reset~input_o\) ) ) ) # ( !\inst1|fstate.AmA_VmB~q\ & ( \inst1|fstate.AmA_AmB~q\ 
-- & ( (((\inst1|fstate.VmA_VmB~q\) # (\inst1|fstate.VmA_AmB~q\)) # (\inst1|fstate.VmA_VdB~q\)) # (\reset~input_o\) ) ) ) # ( \inst1|fstate.AmA_VmB~q\ & ( !\inst1|fstate.AmA_AmB~q\ & ( (((\inst1|fstate.VmA_VmB~q\) # (\inst1|fstate.VmA_AmB~q\)) # 
-- (\inst1|fstate.VmA_VdB~q\)) # (\reset~input_o\) ) ) ) # ( !\inst1|fstate.AmA_VmB~q\ & ( !\inst1|fstate.AmA_AmB~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111011111111111111101111111111111110111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_fstate.VmA_VdB~q\,
	datac => \inst1|ALT_INV_fstate.VmA_AmB~q\,
	datad => \inst1|ALT_INV_fstate.VmA_VmB~q\,
	datae => \inst1|ALT_INV_fstate.AmA_VmB~q\,
	dataf => \inst1|ALT_INV_fstate.AmA_AmB~q\,
	combout => \inst|AmA~combout\);

\inst|VmA\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|VmA~combout\ = (((!\inst1|WideOr3~combout\ & !\inst1|WideOr1~combout\)) # (\inst1|WideOr2~combout\)) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011101110111111101110111011111110111011101111111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_WideOr2~combout\,
	datac => \inst1|ALT_INV_WideOr3~combout\,
	datad => \inst1|ALT_INV_WideOr1~combout\,
	combout => \inst|VmA~combout\);

\inst|VdB~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|VdB~0_combout\ = (((!\inst1|WideOr3~combout\) # (!\inst1|WideOr1~combout\)) # (\inst1|WideOr2~combout\)) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111110111111111111111011111111111111101111111111111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_WideOr2~combout\,
	datac => \inst1|ALT_INV_WideOr3~combout\,
	datad => \inst1|ALT_INV_WideOr1~combout\,
	combout => \inst|VdB~0_combout\);

\inst|AmB\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|AmB~combout\ = (!\reset~input_o\ & (!\inst1|WideOr3~combout\ & (!\inst1|WideOr2~combout\ $ (!\inst1|WideOr1~combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000010000000001000001000000000100000100000000010000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_WideOr2~combout\,
	datac => \inst1|ALT_INV_WideOr3~combout\,
	datad => \inst1|ALT_INV_WideOr1~combout\,
	combout => \inst|AmB~combout\);

\inst|VmB~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|VmB~0_combout\ = ((!\inst1|WideOr2~combout\ & (\inst1|WideOr3~combout\ & !\inst1|WideOr1~combout\)) # (\inst1|WideOr2~combout\ & ((\inst1|WideOr1~combout\)))) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101110111010111010111011101011101011101110101110101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_WideOr2~combout\,
	datac => \inst1|ALT_INV_WideOr3~combout\,
	datad => \inst1|ALT_INV_WideOr1~combout\,
	combout => \inst|VmB~0_combout\);

\inst|trigger_1min~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|trigger_1min~0_combout\ = ((\inst1|WideOr3~combout\ & ((!\inst1|WideOr2~combout\) # (\inst1|WideOr1~combout\)))) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101011111010111010101111101011101010111110101110101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \inst1|ALT_INV_WideOr2~combout\,
	datac => \inst1|ALT_INV_WideOr3~combout\,
	datad => \inst1|ALT_INV_WideOr1~combout\,
	combout => \inst|trigger_1min~0_combout\);

ww_VdA <= \VdA~output_o\;

ww_AmA <= \AmA~output_o\;

ww_VmA <= \VmA~output_o\;

ww_VdB <= \VdB~output_o\;

ww_AmB <= \AmB~output_o\;

ww_VmB <= \VmB~output_o\;

ww_pin_name1 <= \pin_name1~output_o\;

ww_trigger_1s <= \trigger_1s~output_o\;

ww_trigger_5s <= \trigger_5s~output_o\;

ww_trigger_1min <= \trigger_1min~output_o\;
END structure;


