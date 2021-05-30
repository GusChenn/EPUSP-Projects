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

-- DATE "06/23/2020 17:06:18"

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

ENTITY 	logica_combinatoria IS
    PORT (
	reset : IN std_logic;
	clock : IN std_logic;
	noturno : IN std_logic;
	PvA : IN std_logic;
	PvB : IN std_logic;
	Q : OUT std_logic_vector(2 DOWNTO 0)
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
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_noturno : std_logic;
SIGNAL ww_PvA : std_logic;
SIGNAL ww_PvB : std_logic;
SIGNAL ww_Q : std_logic_vector(2 DOWNTO 0);
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \PvB~input_o\ : std_logic;
SIGNAL \noturno~input_o\ : std_logic;
SIGNAL \PvA~input_o\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \reg_fstate.VmA_VdB_328~combout\ : std_logic;
SIGNAL \fstate.VmA_VdB~q\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \reg_fstate.VmA_VmB_265~combout\ : std_logic;
SIGNAL \fstate.VmA_VmB~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \reg_fstate.VmA_AmB_286~combout\ : std_logic;
SIGNAL \fstate.VmA_AmB~q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \reg_fstate.Apagado_244~combout\ : std_logic;
SIGNAL \fstate.Apagado~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \reg_fstate.AmA_AmB_223~combout\ : std_logic;
SIGNAL \fstate.AmA_AmB~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \reg_fstate.VdA_Vmb_349~combout\ : std_logic;
SIGNAL \fstate.VdA_Vmb~0_combout\ : std_logic;
SIGNAL \fstate.VdA_Vmb~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \reg_fstate.AmA_VmB_307~combout\ : std_logic;
SIGNAL \fstate.AmA_VmB~q\ : std_logic;
SIGNAL \Q~0_combout\ : std_logic;
SIGNAL \Q~1_combout\ : std_logic;
SIGNAL \Q~2_combout\ : std_logic;
SIGNAL \ALT_INV_PvA~input_o\ : std_logic;
SIGNAL \ALT_INV_noturno~input_o\ : std_logic;
SIGNAL \ALT_INV_PvB~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_reg_fstate.VdA_Vmb_349~combout\ : std_logic;
SIGNAL \ALT_INV_reg_fstate.Apagado_244~combout\ : std_logic;
SIGNAL \ALT_INV_reg_fstate.VmA_VmB_265~combout\ : std_logic;
SIGNAL \ALT_INV_reg_fstate.VmA_VdB_328~combout\ : std_logic;
SIGNAL \ALT_INV_reg_fstate.AmA_AmB_223~combout\ : std_logic;
SIGNAL \ALT_INV_Selector2~1_combout\ : std_logic;
SIGNAL \ALT_INV_fstate.AmA_VmB~q\ : std_logic;
SIGNAL \ALT_INV_fstate.VmA_AmB~q\ : std_logic;
SIGNAL \ALT_INV_fstate.AmA_AmB~q\ : std_logic;
SIGNAL \ALT_INV_reg_fstate.AmA_VmB_307~combout\ : std_logic;
SIGNAL \ALT_INV_reg_fstate.VmA_AmB_286~combout\ : std_logic;
SIGNAL \ALT_INV_fstate.VmA_VdB~q\ : std_logic;
SIGNAL \ALT_INV_fstate.VmA_VmB~q\ : std_logic;
SIGNAL \ALT_INV_fstate.Apagado~q\ : std_logic;
SIGNAL \ALT_INV_fstate.VdA_Vmb~q\ : std_logic;
SIGNAL \ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector2~0_combout\ : std_logic;

BEGIN

ww_reset <= reset;
ww_clock <= clock;
ww_noturno <= noturno;
ww_PvA <= PvA;
ww_PvB <= PvB;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_PvA~input_o\ <= NOT \PvA~input_o\;
\ALT_INV_noturno~input_o\ <= NOT \noturno~input_o\;
\ALT_INV_PvB~input_o\ <= NOT \PvB~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_reg_fstate.VdA_Vmb_349~combout\ <= NOT \reg_fstate.VdA_Vmb_349~combout\;
\ALT_INV_reg_fstate.Apagado_244~combout\ <= NOT \reg_fstate.Apagado_244~combout\;
\ALT_INV_reg_fstate.VmA_VmB_265~combout\ <= NOT \reg_fstate.VmA_VmB_265~combout\;
\ALT_INV_reg_fstate.VmA_VdB_328~combout\ <= NOT \reg_fstate.VmA_VdB_328~combout\;
\ALT_INV_reg_fstate.AmA_AmB_223~combout\ <= NOT \reg_fstate.AmA_AmB_223~combout\;
\ALT_INV_Selector2~1_combout\ <= NOT \Selector2~1_combout\;
\ALT_INV_fstate.AmA_VmB~q\ <= NOT \fstate.AmA_VmB~q\;
\ALT_INV_fstate.VmA_AmB~q\ <= NOT \fstate.VmA_AmB~q\;
\ALT_INV_fstate.AmA_AmB~q\ <= NOT \fstate.AmA_AmB~q\;
\ALT_INV_reg_fstate.AmA_VmB_307~combout\ <= NOT \reg_fstate.AmA_VmB_307~combout\;
\ALT_INV_reg_fstate.VmA_AmB_286~combout\ <= NOT \reg_fstate.VmA_AmB_286~combout\;
\ALT_INV_fstate.VmA_VdB~q\ <= NOT \fstate.VmA_VdB~q\;
\ALT_INV_fstate.VmA_VmB~q\ <= NOT \fstate.VmA_VmB~q\;
\ALT_INV_fstate.Apagado~q\ <= NOT \fstate.Apagado~q\;
\ALT_INV_fstate.VdA_Vmb~q\ <= NOT \fstate.VdA_Vmb~q\;
\ALT_INV_Selector4~0_combout\ <= NOT \Selector4~0_combout\;
\ALT_INV_Selector10~0_combout\ <= NOT \Selector10~0_combout\;
\ALT_INV_Selector5~0_combout\ <= NOT \Selector5~0_combout\;
\ALT_INV_Selector0~0_combout\ <= NOT \Selector0~0_combout\;
\ALT_INV_Selector3~0_combout\ <= NOT \Selector3~0_combout\;
\ALT_INV_Selector6~0_combout\ <= NOT \Selector6~0_combout\;
\ALT_INV_Selector7~0_combout\ <= NOT \Selector7~0_combout\;
\ALT_INV_Selector2~0_combout\ <= NOT \Selector2~0_combout\;

\Q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Q~0_combout\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

\Q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Q~1_combout\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

\Q[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Q~2_combout\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

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

\PvB~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PvB,
	o => \PvB~input_o\);

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

\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \fstate.VdA_Vmb~q\ & ( (\fstate.VmA_VmB~q\ & (!\PvB~input_o\ & (!\noturno~input_o\ & !\PvA~input_o\))) ) ) # ( !\fstate.VdA_Vmb~q\ & ( (!\PvB~input_o\ & (!\noturno~input_o\ & !\PvA~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000010000000000000011000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.VmA_VmB~q\,
	datab => \ALT_INV_PvB~input_o\,
	datac => \ALT_INV_noturno~input_o\,
	datad => \ALT_INV_PvA~input_o\,
	datae => \ALT_INV_fstate.VdA_Vmb~q\,
	combout => \Selector6~0_combout\);

\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \PvA~input_o\ & ( \fstate.VdA_Vmb~q\ & ( \fstate.AmA_VmB~q\ ) ) ) # ( !\PvA~input_o\ & ( \fstate.VdA_Vmb~q\ & ( ((\fstate.VmA_VdB~q\ & !\noturno~input_o\)) # (\fstate.AmA_VmB~q\) ) ) ) # ( \PvA~input_o\ & ( !\fstate.VdA_Vmb~q\ & 
-- ( \fstate.AmA_VmB~q\ ) ) ) # ( !\PvA~input_o\ & ( !\fstate.VdA_Vmb~q\ & ( ((!\noturno~input_o\ & ((\PvB~input_o\) # (\fstate.VmA_VdB~q\)))) # (\fstate.AmA_VmB~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101010101010101010101010101110111010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.AmA_VmB~q\,
	datab => \ALT_INV_fstate.VmA_VdB~q\,
	datac => \ALT_INV_PvB~input_o\,
	datad => \ALT_INV_noturno~input_o\,
	datae => \ALT_INV_PvA~input_o\,
	dataf => \ALT_INV_fstate.VdA_Vmb~q\,
	combout => \Selector3~0_combout\);

\reg_fstate.VmA_VdB_328\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_fstate.VmA_VdB_328~combout\ = ( \Selector10~0_combout\ & ( !\reset~input_o\ & ( \Selector3~0_combout\ ) ) ) # ( !\Selector10~0_combout\ & ( !\reset~input_o\ & ( \reg_fstate.VmA_VdB_328~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector3~0_combout\,
	datad => \ALT_INV_reg_fstate.VmA_VdB_328~combout\,
	datae => \ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \reg_fstate.VmA_VdB_328~combout\);

\fstate.VmA_VdB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \reg_fstate.VmA_VdB_328~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.VmA_VdB~q\);

\Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (!\fstate.VmA_VdB~q\) # (((\PvA~input_o\) # (\noturno~input_o\)) # (\PvB~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111111111111101111111111111110111111111111111011111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.VmA_VdB~q\,
	datab => \ALT_INV_PvB~input_o\,
	datac => \ALT_INV_noturno~input_o\,
	datad => \ALT_INV_PvA~input_o\,
	combout => \Selector10~0_combout\);

\reg_fstate.VmA_VmB_265\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_fstate.VmA_VmB_265~combout\ = ( \Selector10~0_combout\ & ( !\reset~input_o\ & ( \Selector6~0_combout\ ) ) ) # ( !\Selector10~0_combout\ & ( !\reset~input_o\ & ( \reg_fstate.VmA_VmB_265~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector6~0_combout\,
	datad => \ALT_INV_reg_fstate.VmA_VmB_265~combout\,
	datae => \ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \reg_fstate.VmA_VmB_265~combout\);

\fstate.VmA_VmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \reg_fstate.VmA_VmB_265~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.VmA_VmB~q\);

\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\fstate.VmA_VdB~q\ & ((\PvA~input_o\) # (\noturno~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100010101000101010001010100010101000101010001010100010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.VmA_VdB~q\,
	datab => \ALT_INV_noturno~input_o\,
	datac => \ALT_INV_PvA~input_o\,
	combout => \Selector5~0_combout\);

\reg_fstate.VmA_AmB_286\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_fstate.VmA_AmB_286~combout\ = ( \Selector10~0_combout\ & ( !\reset~input_o\ & ( \Selector5~0_combout\ ) ) ) # ( !\Selector10~0_combout\ & ( !\reset~input_o\ & ( \reg_fstate.VmA_AmB_286~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector5~0_combout\,
	datad => \ALT_INV_reg_fstate.VmA_AmB_286~combout\,
	datae => \ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \reg_fstate.VmA_AmB_286~combout\);

\fstate.VmA_AmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \reg_fstate.VmA_AmB_286~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.VmA_AmB~q\);

\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\fstate.AmA_AmB~q\ & \noturno~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.AmA_AmB~q\,
	datab => \ALT_INV_noturno~input_o\,
	combout => \Selector7~0_combout\);

\reg_fstate.Apagado_244\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_fstate.Apagado_244~combout\ = ( \Selector10~0_combout\ & ( !\reset~input_o\ & ( \Selector7~0_combout\ ) ) ) # ( !\Selector10~0_combout\ & ( !\reset~input_o\ & ( \reg_fstate.Apagado_244~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector7~0_combout\,
	datad => \ALT_INV_reg_fstate.Apagado_244~combout\,
	datae => \ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \reg_fstate.Apagado_244~combout\);

\fstate.Apagado\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \reg_fstate.Apagado_244~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.Apagado~q\);

\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ((\noturno~input_o\ & !\fstate.VdA_Vmb~q\)) # (\fstate.Apagado~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010101110101011101010111010101110101011101010111010101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.Apagado~q\,
	datab => \ALT_INV_noturno~input_o\,
	datac => \ALT_INV_fstate.VdA_Vmb~q\,
	combout => \Selector0~0_combout\);

\reg_fstate.AmA_AmB_223\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_fstate.AmA_AmB_223~combout\ = ( \Selector10~0_combout\ & ( !\reset~input_o\ & ( \Selector0~0_combout\ ) ) ) # ( !\Selector10~0_combout\ & ( !\reset~input_o\ & ( \reg_fstate.AmA_AmB_223~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector0~0_combout\,
	datad => \ALT_INV_reg_fstate.AmA_AmB_223~combout\,
	datae => \ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \reg_fstate.AmA_AmB_223~combout\);

\fstate.AmA_AmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \reg_fstate.AmA_AmB_223~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.AmA_AmB~q\);

\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (!\fstate.VmA_AmB~q\ & ((!\fstate.AmA_AmB~q\) # (\noturno~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000101010001010100010101000101010001010100010101000101010001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.VmA_AmB~q\,
	datab => \ALT_INV_fstate.AmA_AmB~q\,
	datac => \ALT_INV_noturno~input_o\,
	combout => \Selector2~0_combout\);

\Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = ( \fstate.VdA_Vmb~q\ & ( \Selector2~0_combout\ & ( (\fstate.VmA_VmB~q\ & (((\PvA~input_o\) # (\noturno~input_o\)) # (\PvB~input_o\))) ) ) ) # ( !\fstate.VdA_Vmb~q\ & ( \Selector2~0_combout\ & ( (!\PvB~input_o\ & 
-- ((!\noturno~input_o\ & ((\PvA~input_o\))) # (\noturno~input_o\ & (\fstate.VmA_VmB~q\)))) # (\PvB~input_o\ & (\fstate.VmA_VmB~q\)) ) ) ) # ( \fstate.VdA_Vmb~q\ & ( !\Selector2~0_combout\ ) ) # ( !\fstate.VdA_Vmb~q\ & ( !\Selector2~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100010101110101010001010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fstate.VmA_VmB~q\,
	datab => \ALT_INV_PvB~input_o\,
	datac => \ALT_INV_noturno~input_o\,
	datad => \ALT_INV_PvA~input_o\,
	datae => \ALT_INV_fstate.VdA_Vmb~q\,
	dataf => \ALT_INV_Selector2~0_combout\,
	combout => \Selector2~1_combout\);

\reg_fstate.VdA_Vmb_349\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_fstate.VdA_Vmb_349~combout\ = ( \Selector10~0_combout\ & ( \reset~input_o\ ) ) # ( !\Selector10~0_combout\ & ( \reset~input_o\ ) ) # ( \Selector10~0_combout\ & ( !\reset~input_o\ & ( \Selector2~1_combout\ ) ) ) # ( !\Selector10~0_combout\ & ( 
-- !\reset~input_o\ & ( \reg_fstate.VdA_Vmb_349~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector2~1_combout\,
	datad => \ALT_INV_reg_fstate.VdA_Vmb_349~combout\,
	datae => \ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \reg_fstate.VdA_Vmb_349~combout\);

\fstate.VdA_Vmb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fstate.VdA_Vmb~0_combout\ = !\reg_fstate.VdA_Vmb_349~combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_fstate.VdA_Vmb_349~combout\,
	combout => \fstate.VdA_Vmb~0_combout\);

\fstate.VdA_Vmb\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \fstate.VdA_Vmb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.VdA_Vmb~q\);

\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\PvB~input_o\ & (!\noturno~input_o\ & (\PvA~input_o\ & !\fstate.VdA_Vmb~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000000000001000000000000000100000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PvB~input_o\,
	datab => \ALT_INV_noturno~input_o\,
	datac => \ALT_INV_PvA~input_o\,
	datad => \ALT_INV_fstate.VdA_Vmb~q\,
	combout => \Selector4~0_combout\);

\reg_fstate.AmA_VmB_307\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_fstate.AmA_VmB_307~combout\ = ( \Selector10~0_combout\ & ( !\reset~input_o\ & ( \Selector4~0_combout\ ) ) ) # ( !\Selector10~0_combout\ & ( !\reset~input_o\ & ( \reg_fstate.AmA_VmB_307~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector4~0_combout\,
	datad => \ALT_INV_reg_fstate.AmA_VmB_307~combout\,
	datae => \ALT_INV_Selector10~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \reg_fstate.AmA_VmB_307~combout\);

\fstate.AmA_VmB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \reg_fstate.AmA_VmB_307~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.AmA_VmB~q\);

\Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Q~0_combout\ = (!\reset~input_o\ & (((\fstate.AmA_AmB~q\) # (\fstate.VmA_AmB~q\)) # (\fstate.AmA_VmB~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010101010101000101010101010100010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \ALT_INV_fstate.AmA_VmB~q\,
	datac => \ALT_INV_fstate.VmA_AmB~q\,
	datad => \ALT_INV_fstate.AmA_AmB~q\,
	combout => \Q~0_combout\);

\Q~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Q~1_combout\ = (!\reset~input_o\ & (((\fstate.VmA_VmB~q\) # (\fstate.VmA_VdB~q\)) # (\fstate.VmA_AmB~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010101010101000101010101010100010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \ALT_INV_fstate.VmA_AmB~q\,
	datac => \ALT_INV_fstate.VmA_VdB~q\,
	datad => \ALT_INV_fstate.VmA_VmB~q\,
	combout => \Q~1_combout\);

\Q~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Q~2_combout\ = (!\reset~input_o\ & (((\fstate.Apagado~q\) # (\fstate.VmA_VmB~q\)) # (\fstate.AmA_AmB~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101010101010001010101010101000101010101010100010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \ALT_INV_fstate.AmA_AmB~q\,
	datac => \ALT_INV_fstate.VmA_VmB~q\,
	datad => \ALT_INV_fstate.Apagado~q\,
	combout => \Q~2_combout\);

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;
END structure;


