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

-- DATE "05/24/2020 23:56:16"

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

ENTITY 	circuito_temporizador IS
    PORT (
	out_segundo : OUT std_logic;
	clock : IN std_logic;
	Reset : IN std_logic;
	out_minuto : OUT std_logic;
	out_hora : OUT std_logic;
	out_12horas : OUT std_logic;
	lampada : OUT std_logic;
	Liga : IN std_logic;
	Desliga : IN std_logic
	);
END circuito_temporizador;

ARCHITECTURE structure OF circuito_temporizador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_out_segundo : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_out_minuto : std_logic;
SIGNAL ww_out_hora : std_logic;
SIGNAL ww_out_12horas : std_logic;
SIGNAL ww_lampada : std_logic;
SIGNAL ww_Liga : std_logic;
SIGNAL ww_Desliga : std_logic;
SIGNAL \out_segundo~output_o\ : std_logic;
SIGNAL \out_minuto~output_o\ : std_logic;
SIGNAL \out_hora~output_o\ : std_logic;
SIGNAL \out_12horas~output_o\ : std_logic;
SIGNAL \lampada~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \inst|conta_ciclo~4_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \inst|conta_ciclo~0_combout\ : std_logic;
SIGNAL \inst|conta_ciclo~1_combout\ : std_logic;
SIGNAL \inst|conta_ciclo~2_combout\ : std_logic;
SIGNAL \inst|Add0~0_combout\ : std_logic;
SIGNAL \inst|conta_ciclo~3_combout\ : std_logic;
SIGNAL \inst|conta_ciclo~5_combout\ : std_logic;
SIGNAL \inst|Equal0~combout\ : std_logic;
SIGNAL \inst1|conta_ciclo~4_combout\ : std_logic;
SIGNAL \inst1|conta_ciclo~0_combout\ : std_logic;
SIGNAL \inst1|conta_ciclo~1_combout\ : std_logic;
SIGNAL \inst1|conta_ciclo~2_combout\ : std_logic;
SIGNAL \inst1|Add0~0_combout\ : std_logic;
SIGNAL \inst1|conta_ciclo~3_combout\ : std_logic;
SIGNAL \inst1|conta_ciclo~5_combout\ : std_logic;
SIGNAL \inst1|Equal0~combout\ : std_logic;
SIGNAL \inst2|conta_ciclo~4_combout\ : std_logic;
SIGNAL \inst2|conta_ciclo~0_combout\ : std_logic;
SIGNAL \inst2|conta_ciclo~1_combout\ : std_logic;
SIGNAL \inst2|conta_ciclo~2_combout\ : std_logic;
SIGNAL \inst2|Add0~0_combout\ : std_logic;
SIGNAL \inst2|conta_ciclo~3_combout\ : std_logic;
SIGNAL \inst2|conta_ciclo~5_combout\ : std_logic;
SIGNAL \inst2|Equal0~combout\ : std_logic;
SIGNAL \inst3|conta_ciclo~2_combout\ : std_logic;
SIGNAL \inst3|conta_ciclo~0_combout\ : std_logic;
SIGNAL \inst3|conta_ciclo~1_combout\ : std_logic;
SIGNAL \inst3|conta_ciclo~3_combout\ : std_logic;
SIGNAL \inst3|Equal0~combout\ : std_logic;
SIGNAL \Desliga~input_o\ : std_logic;
SIGNAL \inst5~0_combout\ : std_logic;
SIGNAL \inst5~q\ : std_logic;
SIGNAL \Liga~input_o\ : std_logic;
SIGNAL \inst13~0_combout\ : std_logic;
SIGNAL \inst|conta_ciclo\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst1|conta_ciclo\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|conta_ciclo\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst3|conta_ciclo\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Reset~input_o\ : std_logic;
SIGNAL \ALT_INV_Liga~input_o\ : std_logic;
SIGNAL \ALT_INV_Desliga~input_o\ : std_logic;
SIGNAL \inst2|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \inst3|ALT_INV_Equal0~combout\ : std_logic;
SIGNAL \inst3|ALT_INV_conta_ciclo\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|ALT_INV_Equal0~combout\ : std_logic;
SIGNAL \inst2|ALT_INV_conta_ciclo\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst1|ALT_INV_Equal0~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_conta_ciclo\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst|ALT_INV_Equal0~combout\ : std_logic;
SIGNAL \inst|ALT_INV_conta_ciclo\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_inst5~q\ : std_logic;

BEGIN

out_segundo <= ww_out_segundo;
ww_clock <= clock;
ww_Reset <= Reset;
out_minuto <= ww_out_minuto;
out_hora <= ww_out_hora;
out_12horas <= ww_out_12horas;
lampada <= ww_lampada;
ww_Liga <= Liga;
ww_Desliga <= Desliga;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Reset~input_o\ <= NOT \Reset~input_o\;
\ALT_INV_Liga~input_o\ <= NOT \Liga~input_o\;
\ALT_INV_Desliga~input_o\ <= NOT \Desliga~input_o\;
\inst2|ALT_INV_Add0~0_combout\ <= NOT \inst2|Add0~0_combout\;
\inst1|ALT_INV_Add0~0_combout\ <= NOT \inst1|Add0~0_combout\;
\inst|ALT_INV_Add0~0_combout\ <= NOT \inst|Add0~0_combout\;
\inst3|ALT_INV_Equal0~combout\ <= NOT \inst3|Equal0~combout\;
\inst3|ALT_INV_conta_ciclo\(3) <= NOT \inst3|conta_ciclo\(3);
\inst3|ALT_INV_conta_ciclo\(0) <= NOT \inst3|conta_ciclo\(0);
\inst3|ALT_INV_conta_ciclo\(2) <= NOT \inst3|conta_ciclo\(2);
\inst3|ALT_INV_conta_ciclo\(1) <= NOT \inst3|conta_ciclo\(1);
\inst2|ALT_INV_Equal0~combout\ <= NOT \inst2|Equal0~combout\;
\inst2|ALT_INV_conta_ciclo\(5) <= NOT \inst2|conta_ciclo\(5);
\inst2|ALT_INV_conta_ciclo\(0) <= NOT \inst2|conta_ciclo\(0);
\inst2|ALT_INV_conta_ciclo\(4) <= NOT \inst2|conta_ciclo\(4);
\inst2|ALT_INV_conta_ciclo\(3) <= NOT \inst2|conta_ciclo\(3);
\inst2|ALT_INV_conta_ciclo\(2) <= NOT \inst2|conta_ciclo\(2);
\inst2|ALT_INV_conta_ciclo\(1) <= NOT \inst2|conta_ciclo\(1);
\inst1|ALT_INV_Equal0~combout\ <= NOT \inst1|Equal0~combout\;
\inst1|ALT_INV_conta_ciclo\(5) <= NOT \inst1|conta_ciclo\(5);
\inst1|ALT_INV_conta_ciclo\(0) <= NOT \inst1|conta_ciclo\(0);
\inst1|ALT_INV_conta_ciclo\(4) <= NOT \inst1|conta_ciclo\(4);
\inst1|ALT_INV_conta_ciclo\(3) <= NOT \inst1|conta_ciclo\(3);
\inst1|ALT_INV_conta_ciclo\(2) <= NOT \inst1|conta_ciclo\(2);
\inst1|ALT_INV_conta_ciclo\(1) <= NOT \inst1|conta_ciclo\(1);
\inst|ALT_INV_Equal0~combout\ <= NOT \inst|Equal0~combout\;
\inst|ALT_INV_conta_ciclo\(5) <= NOT \inst|conta_ciclo\(5);
\inst|ALT_INV_conta_ciclo\(0) <= NOT \inst|conta_ciclo\(0);
\inst|ALT_INV_conta_ciclo\(4) <= NOT \inst|conta_ciclo\(4);
\inst|ALT_INV_conta_ciclo\(3) <= NOT \inst|conta_ciclo\(3);
\inst|ALT_INV_conta_ciclo\(2) <= NOT \inst|conta_ciclo\(2);
\inst|ALT_INV_conta_ciclo\(1) <= NOT \inst|conta_ciclo\(1);
\ALT_INV_inst5~q\ <= NOT \inst5~q\;

\out_segundo~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Equal0~combout\,
	devoe => ww_devoe,
	o => \out_segundo~output_o\);

\out_minuto~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Equal0~combout\,
	devoe => ww_devoe,
	o => \out_minuto~output_o\);

\out_hora~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Equal0~combout\,
	devoe => ww_devoe,
	o => \out_hora~output_o\);

\out_12horas~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Equal0~combout\,
	devoe => ww_devoe,
	o => \out_12horas~output_o\);

\lampada~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst13~0_combout\,
	devoe => ww_devoe,
	o => \lampada~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\inst|conta_ciclo~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|conta_ciclo~4_combout\ = (!\inst|conta_ciclo\(0) & !\inst|Equal0~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(0),
	datab => \inst|ALT_INV_Equal0~combout\,
	combout => \inst|conta_ciclo~4_combout\);

\Reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

\inst|conta_ciclo[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|conta_ciclo~4_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|conta_ciclo\(0));

\inst|conta_ciclo~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|conta_ciclo~0_combout\ = (!\inst|Equal0~combout\ & (!\inst|conta_ciclo\(1) $ (!\inst|conta_ciclo\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(1),
	datab => \inst|ALT_INV_conta_ciclo\(0),
	datac => \inst|ALT_INV_Equal0~combout\,
	combout => \inst|conta_ciclo~0_combout\);

\inst|conta_ciclo[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|conta_ciclo~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|conta_ciclo\(1));

\inst|conta_ciclo~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|conta_ciclo~1_combout\ = (!\inst|Equal0~combout\ & (!\inst|conta_ciclo\(2) $ (((!\inst|conta_ciclo\(1)) # (!\inst|conta_ciclo\(0))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000000000001101100000000000110110000000000011011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(1),
	datab => \inst|ALT_INV_conta_ciclo\(2),
	datac => \inst|ALT_INV_conta_ciclo\(0),
	datad => \inst|ALT_INV_Equal0~combout\,
	combout => \inst|conta_ciclo~1_combout\);

\inst|conta_ciclo[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|conta_ciclo~1_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|conta_ciclo\(2));

\inst|conta_ciclo~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|conta_ciclo~2_combout\ = ( !\inst|Equal0~combout\ & ( !\inst|conta_ciclo\(3) $ (((!\inst|conta_ciclo\(1)) # ((!\inst|conta_ciclo\(2)) # (!\inst|conta_ciclo\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100011110000000000000000000001111000111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(1),
	datab => \inst|ALT_INV_conta_ciclo\(2),
	datac => \inst|ALT_INV_conta_ciclo\(3),
	datad => \inst|ALT_INV_conta_ciclo\(0),
	datae => \inst|ALT_INV_Equal0~combout\,
	combout => \inst|conta_ciclo~2_combout\);

\inst|conta_ciclo[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|conta_ciclo~2_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|conta_ciclo\(3));

\inst|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~0_combout\ = (\inst|conta_ciclo\(1) & (\inst|conta_ciclo\(2) & (\inst|conta_ciclo\(3) & \inst|conta_ciclo\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(1),
	datab => \inst|ALT_INV_conta_ciclo\(2),
	datac => \inst|ALT_INV_conta_ciclo\(3),
	datad => \inst|ALT_INV_conta_ciclo\(0),
	combout => \inst|Add0~0_combout\);

\inst|conta_ciclo~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|conta_ciclo~3_combout\ = (!\inst|Equal0~combout\ & (!\inst|conta_ciclo\(4) $ (!\inst|Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000010010000100100001001000010010000100100001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(4),
	datab => \inst|ALT_INV_Equal0~combout\,
	datac => \inst|ALT_INV_Add0~0_combout\,
	combout => \inst|conta_ciclo~3_combout\);

\inst|conta_ciclo[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|conta_ciclo~3_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|conta_ciclo\(4));

\inst|conta_ciclo~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|conta_ciclo~5_combout\ = (!\inst|Equal0~combout\ & (!\inst|conta_ciclo\(5) $ (((!\inst|conta_ciclo\(4)) # (!\inst|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000001100000001100000110000000110000011000000011000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(4),
	datab => \inst|ALT_INV_conta_ciclo\(5),
	datac => \inst|ALT_INV_Equal0~combout\,
	datad => \inst|ALT_INV_Add0~0_combout\,
	combout => \inst|conta_ciclo~5_combout\);

\inst|conta_ciclo[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|conta_ciclo~5_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|conta_ciclo\(5));

\inst|Equal0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal0~combout\ = LCELL(( \inst|conta_ciclo\(0) & ( !\inst|conta_ciclo\(5) & ( (!\inst|conta_ciclo\(1) & (\inst|conta_ciclo\(2) & (!\inst|conta_ciclo\(3) & !\inst|conta_ciclo\(4)))) ) ) ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_conta_ciclo\(1),
	datab => \inst|ALT_INV_conta_ciclo\(2),
	datac => \inst|ALT_INV_conta_ciclo\(3),
	datad => \inst|ALT_INV_conta_ciclo\(4),
	datae => \inst|ALT_INV_conta_ciclo\(0),
	dataf => \inst|ALT_INV_conta_ciclo\(5),
	combout => \inst|Equal0~combout\);

\inst1|conta_ciclo~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|conta_ciclo~4_combout\ = (!\inst1|conta_ciclo\(0) & !\inst1|Equal0~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(0),
	datab => \inst1|ALT_INV_Equal0~combout\,
	combout => \inst1|conta_ciclo~4_combout\);

\inst1|conta_ciclo[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|Equal0~combout\,
	d => \inst1|conta_ciclo~4_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|conta_ciclo\(0));

\inst1|conta_ciclo~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|conta_ciclo~0_combout\ = (!\inst1|Equal0~combout\ & (!\inst1|conta_ciclo\(1) $ (!\inst1|conta_ciclo\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(1),
	datab => \inst1|ALT_INV_conta_ciclo\(0),
	datac => \inst1|ALT_INV_Equal0~combout\,
	combout => \inst1|conta_ciclo~0_combout\);

\inst1|conta_ciclo[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|Equal0~combout\,
	d => \inst1|conta_ciclo~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|conta_ciclo\(1));

\inst1|conta_ciclo~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|conta_ciclo~1_combout\ = (!\inst1|Equal0~combout\ & (!\inst1|conta_ciclo\(2) $ (((!\inst1|conta_ciclo\(1)) # (!\inst1|conta_ciclo\(0))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000000000001101100000000000110110000000000011011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(1),
	datab => \inst1|ALT_INV_conta_ciclo\(2),
	datac => \inst1|ALT_INV_conta_ciclo\(0),
	datad => \inst1|ALT_INV_Equal0~combout\,
	combout => \inst1|conta_ciclo~1_combout\);

\inst1|conta_ciclo[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|Equal0~combout\,
	d => \inst1|conta_ciclo~1_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|conta_ciclo\(2));

\inst1|conta_ciclo~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|conta_ciclo~2_combout\ = ( !\inst1|Equal0~combout\ & ( !\inst1|conta_ciclo\(3) $ (((!\inst1|conta_ciclo\(1)) # ((!\inst1|conta_ciclo\(2)) # (!\inst1|conta_ciclo\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100011110000000000000000000001111000111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(1),
	datab => \inst1|ALT_INV_conta_ciclo\(2),
	datac => \inst1|ALT_INV_conta_ciclo\(3),
	datad => \inst1|ALT_INV_conta_ciclo\(0),
	datae => \inst1|ALT_INV_Equal0~combout\,
	combout => \inst1|conta_ciclo~2_combout\);

\inst1|conta_ciclo[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|Equal0~combout\,
	d => \inst1|conta_ciclo~2_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|conta_ciclo\(3));

\inst1|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Add0~0_combout\ = (\inst1|conta_ciclo\(1) & (\inst1|conta_ciclo\(2) & (\inst1|conta_ciclo\(3) & \inst1|conta_ciclo\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(1),
	datab => \inst1|ALT_INV_conta_ciclo\(2),
	datac => \inst1|ALT_INV_conta_ciclo\(3),
	datad => \inst1|ALT_INV_conta_ciclo\(0),
	combout => \inst1|Add0~0_combout\);

\inst1|conta_ciclo~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|conta_ciclo~3_combout\ = (!\inst1|Equal0~combout\ & (!\inst1|conta_ciclo\(4) $ (!\inst1|Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000010010000100100001001000010010000100100001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(4),
	datab => \inst1|ALT_INV_Equal0~combout\,
	datac => \inst1|ALT_INV_Add0~0_combout\,
	combout => \inst1|conta_ciclo~3_combout\);

\inst1|conta_ciclo[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|Equal0~combout\,
	d => \inst1|conta_ciclo~3_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|conta_ciclo\(4));

\inst1|conta_ciclo~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|conta_ciclo~5_combout\ = (!\inst1|Equal0~combout\ & (!\inst1|conta_ciclo\(5) $ (((!\inst1|conta_ciclo\(4)) # (!\inst1|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000001100000001100000110000000110000011000000011000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(4),
	datab => \inst1|ALT_INV_conta_ciclo\(5),
	datac => \inst1|ALT_INV_Equal0~combout\,
	datad => \inst1|ALT_INV_Add0~0_combout\,
	combout => \inst1|conta_ciclo~5_combout\);

\inst1|conta_ciclo[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|Equal0~combout\,
	d => \inst1|conta_ciclo~5_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|conta_ciclo\(5));

\inst1|Equal0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Equal0~combout\ = LCELL(( !\inst1|conta_ciclo\(0) & ( !\inst1|conta_ciclo\(5) & ( (\inst1|conta_ciclo\(1) & (\inst1|conta_ciclo\(2) & (!\inst1|conta_ciclo\(3) & !\inst1|conta_ciclo\(4)))) ) ) ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_conta_ciclo\(1),
	datab => \inst1|ALT_INV_conta_ciclo\(2),
	datac => \inst1|ALT_INV_conta_ciclo\(3),
	datad => \inst1|ALT_INV_conta_ciclo\(4),
	datae => \inst1|ALT_INV_conta_ciclo\(0),
	dataf => \inst1|ALT_INV_conta_ciclo\(5),
	combout => \inst1|Equal0~combout\);

\inst2|conta_ciclo~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta_ciclo~4_combout\ = (!\inst2|conta_ciclo\(0) & !\inst2|Equal0~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(0),
	datab => \inst2|ALT_INV_Equal0~combout\,
	combout => \inst2|conta_ciclo~4_combout\);

\inst2|conta_ciclo[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|Equal0~combout\,
	d => \inst2|conta_ciclo~4_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta_ciclo\(0));

\inst2|conta_ciclo~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta_ciclo~0_combout\ = (!\inst2|Equal0~combout\ & (!\inst2|conta_ciclo\(1) $ (!\inst2|conta_ciclo\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(1),
	datab => \inst2|ALT_INV_conta_ciclo\(0),
	datac => \inst2|ALT_INV_Equal0~combout\,
	combout => \inst2|conta_ciclo~0_combout\);

\inst2|conta_ciclo[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|Equal0~combout\,
	d => \inst2|conta_ciclo~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta_ciclo\(1));

\inst2|conta_ciclo~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta_ciclo~1_combout\ = (!\inst2|Equal0~combout\ & (!\inst2|conta_ciclo\(2) $ (((!\inst2|conta_ciclo\(1)) # (!\inst2|conta_ciclo\(0))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000000000001101100000000000110110000000000011011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(1),
	datab => \inst2|ALT_INV_conta_ciclo\(2),
	datac => \inst2|ALT_INV_conta_ciclo\(0),
	datad => \inst2|ALT_INV_Equal0~combout\,
	combout => \inst2|conta_ciclo~1_combout\);

\inst2|conta_ciclo[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|Equal0~combout\,
	d => \inst2|conta_ciclo~1_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta_ciclo\(2));

\inst2|conta_ciclo~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta_ciclo~2_combout\ = ( !\inst2|Equal0~combout\ & ( !\inst2|conta_ciclo\(3) $ (((!\inst2|conta_ciclo\(1)) # ((!\inst2|conta_ciclo\(2)) # (!\inst2|conta_ciclo\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100011110000000000000000000001111000111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(1),
	datab => \inst2|ALT_INV_conta_ciclo\(2),
	datac => \inst2|ALT_INV_conta_ciclo\(3),
	datad => \inst2|ALT_INV_conta_ciclo\(0),
	datae => \inst2|ALT_INV_Equal0~combout\,
	combout => \inst2|conta_ciclo~2_combout\);

\inst2|conta_ciclo[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|Equal0~combout\,
	d => \inst2|conta_ciclo~2_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta_ciclo\(3));

\inst2|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Add0~0_combout\ = (\inst2|conta_ciclo\(1) & (\inst2|conta_ciclo\(2) & (\inst2|conta_ciclo\(3) & \inst2|conta_ciclo\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(1),
	datab => \inst2|ALT_INV_conta_ciclo\(2),
	datac => \inst2|ALT_INV_conta_ciclo\(3),
	datad => \inst2|ALT_INV_conta_ciclo\(0),
	combout => \inst2|Add0~0_combout\);

\inst2|conta_ciclo~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta_ciclo~3_combout\ = (!\inst2|Equal0~combout\ & (!\inst2|conta_ciclo\(4) $ (!\inst2|Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000010010000100100001001000010010000100100001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(4),
	datab => \inst2|ALT_INV_Equal0~combout\,
	datac => \inst2|ALT_INV_Add0~0_combout\,
	combout => \inst2|conta_ciclo~3_combout\);

\inst2|conta_ciclo[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|Equal0~combout\,
	d => \inst2|conta_ciclo~3_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta_ciclo\(4));

\inst2|conta_ciclo~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|conta_ciclo~5_combout\ = (!\inst2|Equal0~combout\ & (!\inst2|conta_ciclo\(5) $ (((!\inst2|conta_ciclo\(4)) # (!\inst2|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000001100000001100000110000000110000011000000011000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(4),
	datab => \inst2|ALT_INV_conta_ciclo\(5),
	datac => \inst2|ALT_INV_Equal0~combout\,
	datad => \inst2|ALT_INV_Add0~0_combout\,
	combout => \inst2|conta_ciclo~5_combout\);

\inst2|conta_ciclo[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|Equal0~combout\,
	d => \inst2|conta_ciclo~5_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|conta_ciclo\(5));

\inst2|Equal0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Equal0~combout\ = LCELL(( !\inst2|conta_ciclo\(0) & ( !\inst2|conta_ciclo\(5) & ( (\inst2|conta_ciclo\(1) & (\inst2|conta_ciclo\(2) & (!\inst2|conta_ciclo\(3) & !\inst2|conta_ciclo\(4)))) ) ) ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_conta_ciclo\(1),
	datab => \inst2|ALT_INV_conta_ciclo\(2),
	datac => \inst2|ALT_INV_conta_ciclo\(3),
	datad => \inst2|ALT_INV_conta_ciclo\(4),
	datae => \inst2|ALT_INV_conta_ciclo\(0),
	dataf => \inst2|ALT_INV_conta_ciclo\(5),
	combout => \inst2|Equal0~combout\);

\inst3|conta_ciclo~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|conta_ciclo~2_combout\ = (!\inst3|conta_ciclo\(0) & !\inst3|Equal0~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_conta_ciclo\(0),
	datab => \inst3|ALT_INV_Equal0~combout\,
	combout => \inst3|conta_ciclo~2_combout\);

\inst3|conta_ciclo[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|Equal0~combout\,
	d => \inst3|conta_ciclo~2_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|conta_ciclo\(0));

\inst3|conta_ciclo~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|conta_ciclo~0_combout\ = (!\inst3|Equal0~combout\ & (!\inst3|conta_ciclo\(1) $ (!\inst3|conta_ciclo\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_conta_ciclo\(1),
	datab => \inst3|ALT_INV_conta_ciclo\(0),
	datac => \inst3|ALT_INV_Equal0~combout\,
	combout => \inst3|conta_ciclo~0_combout\);

\inst3|conta_ciclo[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|Equal0~combout\,
	d => \inst3|conta_ciclo~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|conta_ciclo\(1));

\inst3|conta_ciclo~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|conta_ciclo~1_combout\ = (!\inst3|Equal0~combout\ & (!\inst3|conta_ciclo\(2) $ (((!\inst3|conta_ciclo\(1)) # (!\inst3|conta_ciclo\(0))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000000000001101100000000000110110000000000011011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_conta_ciclo\(1),
	datab => \inst3|ALT_INV_conta_ciclo\(2),
	datac => \inst3|ALT_INV_conta_ciclo\(0),
	datad => \inst3|ALT_INV_Equal0~combout\,
	combout => \inst3|conta_ciclo~1_combout\);

\inst3|conta_ciclo[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|Equal0~combout\,
	d => \inst3|conta_ciclo~1_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|conta_ciclo\(2));

\inst3|conta_ciclo~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|conta_ciclo~3_combout\ = ( !\inst3|Equal0~combout\ & ( !\inst3|conta_ciclo\(3) $ (((!\inst3|conta_ciclo\(1)) # ((!\inst3|conta_ciclo\(2)) # (!\inst3|conta_ciclo\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000000000000000000000001111111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_conta_ciclo\(1),
	datab => \inst3|ALT_INV_conta_ciclo\(2),
	datac => \inst3|ALT_INV_conta_ciclo\(0),
	datad => \inst3|ALT_INV_conta_ciclo\(3),
	datae => \inst3|ALT_INV_Equal0~combout\,
	combout => \inst3|conta_ciclo~3_combout\);

\inst3|conta_ciclo[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|Equal0~combout\,
	d => \inst3|conta_ciclo~3_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|conta_ciclo\(3));

\inst3|Equal0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|Equal0~combout\ = LCELL((\inst3|conta_ciclo\(1) & (!\inst3|conta_ciclo\(2) & (!\inst3|conta_ciclo\(0) & !\inst3|conta_ciclo\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000001000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_conta_ciclo\(1),
	datab => \inst3|ALT_INV_conta_ciclo\(2),
	datac => \inst3|ALT_INV_conta_ciclo\(0),
	datad => \inst3|ALT_INV_conta_ciclo\(3),
	combout => \inst3|Equal0~combout\);

\Desliga~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Desliga,
	o => \Desliga~input_o\);

\inst5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5~0_combout\ = !\inst5~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst5~q\,
	combout => \inst5~0_combout\);

inst5 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst3|Equal0~combout\,
	d => \inst5~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5~q\);

\Liga~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Liga,
	o => \Liga~input_o\);

\inst13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst13~0_combout\ = (!\Desliga~input_o\ & ((\Liga~input_o\) # (\inst5~q\))) # (\Desliga~input_o\ & (\inst5~q\ & \Liga~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100101011001010110010101100101011001010110010101100101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Desliga~input_o\,
	datab => \ALT_INV_inst5~q\,
	datac => \ALT_INV_Liga~input_o\,
	combout => \inst13~0_combout\);

ww_out_segundo <= \out_segundo~output_o\;

ww_out_minuto <= \out_minuto~output_o\;

ww_out_hora <= \out_hora~output_o\;

ww_out_12horas <= \out_12horas~output_o\;

ww_lampada <= \lampada~output_o\;
END structure;


