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

-- DATE "04/26/2020 21:09:03"

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

ENTITY 	fluxo_dados IS
    PORT (
	clock : IN std_logic;
	zera1 : IN std_logic;
	conta1 : IN std_logic;
	conta2 : IN std_logic;
	carrega2 : IN std_logic;
	fim1 : BUFFER std_logic;
	condicao1 : BUFFER std_logic;
	saida : BUFFER std_logic_vector(3 DOWNTO 0);
	db_fim2 : BUFFER std_logic;
	db_contagem1 : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END fluxo_dados;

ARCHITECTURE structure OF fluxo_dados IS
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
SIGNAL ww_zera1 : std_logic;
SIGNAL ww_conta1 : std_logic;
SIGNAL ww_conta2 : std_logic;
SIGNAL ww_carrega2 : std_logic;
SIGNAL ww_fim1 : std_logic;
SIGNAL ww_condicao1 : std_logic;
SIGNAL ww_saida : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_db_fim2 : std_logic;
SIGNAL ww_db_contagem1 : std_logic_vector(3 DOWNTO 0);
SIGNAL \fim1~output_o\ : std_logic;
SIGNAL \condicao1~output_o\ : std_logic;
SIGNAL \saida[0]~output_o\ : std_logic;
SIGNAL \saida[1]~output_o\ : std_logic;
SIGNAL \saida[2]~output_o\ : std_logic;
SIGNAL \saida[3]~output_o\ : std_logic;
SIGNAL \db_fim2~output_o\ : std_logic;
SIGNAL \db_contagem1[0]~output_o\ : std_logic;
SIGNAL \db_contagem1[1]~output_o\ : std_logic;
SIGNAL \db_contagem1[2]~output_o\ : std_logic;
SIGNAL \db_contagem1[3]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \conta1~input_o\ : std_logic;
SIGNAL \IQ1[0]~3_combout\ : std_logic;
SIGNAL \zera1~input_o\ : std_logic;
SIGNAL \IQ1[1]~2_combout\ : std_logic;
SIGNAL \IQ1[2]~1_combout\ : std_logic;
SIGNAL \IQ1[3]~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \carrega2~input_o\ : std_logic;
SIGNAL \IQ2~0_combout\ : std_logic;
SIGNAL \conta2~input_o\ : std_logic;
SIGNAL \IQ2[0]~1_combout\ : std_logic;
SIGNAL \IQ2~2_combout\ : std_logic;
SIGNAL \IQ2~3_combout\ : std_logic;
SIGNAL \IQ2~4_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL IQ1 : std_logic_vector(3 DOWNTO 0);
SIGNAL IQ2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_IQ1 : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL ALT_INV_IQ2 : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_conta1~input_o\ : std_logic;
SIGNAL \ALT_INV_zera1~input_o\ : std_logic;
SIGNAL \ALT_INV_carrega2~input_o\ : std_logic;
SIGNAL \ALT_INV_conta2~input_o\ : std_logic;

BEGIN

ww_clock <= clock;
ww_zera1 <= zera1;
ww_conta1 <= conta1;
ww_conta2 <= conta2;
ww_carrega2 <= carrega2;
fim1 <= ww_fim1;
condicao1 <= ww_condicao1;
saida <= ww_saida;
db_fim2 <= ww_db_fim2;
db_contagem1 <= ww_db_contagem1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_IQ1(3) <= NOT IQ1(3);
ALT_INV_IQ1(1) <= NOT IQ1(1);
ALT_INV_IQ1(2) <= NOT IQ1(2);
ALT_INV_IQ1(0) <= NOT IQ1(0);
\ALT_INV_Equal2~0_combout\ <= NOT \Equal2~0_combout\;
ALT_INV_IQ2(0) <= NOT IQ2(0);
ALT_INV_IQ2(1) <= NOT IQ2(1);
ALT_INV_IQ2(2) <= NOT IQ2(2);
ALT_INV_IQ2(3) <= NOT IQ2(3);
\ALT_INV_conta1~input_o\ <= NOT \conta1~input_o\;
\ALT_INV_zera1~input_o\ <= NOT \zera1~input_o\;
\ALT_INV_carrega2~input_o\ <= NOT \carrega2~input_o\;
\ALT_INV_conta2~input_o\ <= NOT \conta2~input_o\;

\fim1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~0_combout\,
	devoe => ww_devoe,
	o => \fim1~output_o\);

\condicao1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Equal2~0_combout\,
	devoe => ww_devoe,
	o => \condicao1~output_o\);

\saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ2(0),
	devoe => ww_devoe,
	o => \saida[0]~output_o\);

\saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ2(1),
	devoe => ww_devoe,
	o => \saida[1]~output_o\);

\saida[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ2(2),
	devoe => ww_devoe,
	o => \saida[2]~output_o\);

\saida[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ2(3),
	devoe => ww_devoe,
	o => \saida[3]~output_o\);

\db_fim2~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~0_combout\,
	devoe => ww_devoe,
	o => \db_fim2~output_o\);

\db_contagem1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ1(0),
	devoe => ww_devoe,
	o => \db_contagem1[0]~output_o\);

\db_contagem1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ1(1),
	devoe => ww_devoe,
	o => \db_contagem1[1]~output_o\);

\db_contagem1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ1(2),
	devoe => ww_devoe,
	o => \db_contagem1[2]~output_o\);

\db_contagem1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ1(3),
	devoe => ww_devoe,
	o => \db_contagem1[3]~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\conta1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta1,
	o => \conta1~input_o\);

\IQ1[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ1[0]~3_combout\ = !IQ1(0) $ (!\conta1~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ1(0),
	datab => \ALT_INV_conta1~input_o\,
	combout => \IQ1[0]~3_combout\);

\zera1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_zera1,
	o => \zera1~input_o\);

\IQ1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ1[0]~3_combout\,
	clrn => \ALT_INV_zera1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ1(0));

\IQ1[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ1[1]~2_combout\ = !IQ1(1) $ (((!IQ1(0)) # (!\conta1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001010110010101100101011001010110010101100101011001010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ1(1),
	datab => ALT_INV_IQ1(0),
	datac => \ALT_INV_conta1~input_o\,
	combout => \IQ1[1]~2_combout\);

\IQ1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ1[1]~2_combout\,
	clrn => \ALT_INV_zera1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ1(1));

\IQ1[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ1[2]~1_combout\ = !IQ1(2) $ (((!IQ1(1)) # ((!IQ1(0)) # (!\conta1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010110010101010101011001010101010101100101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ1(2),
	datab => ALT_INV_IQ1(1),
	datac => ALT_INV_IQ1(0),
	datad => \ALT_INV_conta1~input_o\,
	combout => \IQ1[2]~1_combout\);

\IQ1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ1[2]~1_combout\,
	clrn => \ALT_INV_zera1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ1(2));

\IQ1[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ1[3]~0_combout\ = ( \conta1~input_o\ & ( !IQ1(3) $ (((!IQ1(2)) # ((!IQ1(1)) # (!IQ1(0))))) ) ) # ( !\conta1~input_o\ & ( IQ1(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101011001010101010101010101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ1(3),
	datab => ALT_INV_IQ1(2),
	datac => ALT_INV_IQ1(1),
	datad => ALT_INV_IQ1(0),
	datae => \ALT_INV_conta1~input_o\,
	combout => \IQ1[3]~0_combout\);

\IQ1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ1[3]~0_combout\,
	clrn => \ALT_INV_zera1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ1(3));

\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (IQ1(3) & (IQ1(2) & (IQ1(1) & IQ1(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ1(3),
	datab => ALT_INV_IQ1(2),
	datac => ALT_INV_IQ1(1),
	datad => ALT_INV_IQ1(0),
	combout => \Equal1~0_combout\);

\Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!IQ1(3) & ((!IQ1(2) $ (!IQ1(0))) # (IQ1(1)))) # (IQ1(3) & ((!IQ1(1)) # (!IQ1(2) $ (!IQ1(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101111011110011110111101111001111011110111100111101111011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ1(3),
	datab => ALT_INV_IQ1(2),
	datac => ALT_INV_IQ1(1),
	datad => ALT_INV_IQ1(0),
	combout => \Equal2~0_combout\);

\carrega2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carrega2,
	o => \carrega2~input_o\);

\IQ2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ2~0_combout\ = (!IQ2(0) & !\carrega2~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ2(0),
	datab => \ALT_INV_carrega2~input_o\,
	combout => \IQ2~0_combout\);

\conta2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta2,
	o => \conta2~input_o\);

\IQ2[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ2[0]~1_combout\ = (\conta2~input_o\) # (\carrega2~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_carrega2~input_o\,
	datab => \ALT_INV_conta2~input_o\,
	combout => \IQ2[0]~1_combout\);

\IQ2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ2~0_combout\,
	ena => \IQ2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ2(0));

\IQ2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ2~2_combout\ = ( !\carrega2~input_o\ & ( !IQ2(0) $ (!IQ2(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110000000000000000001100110011001100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ2(0),
	datab => ALT_INV_IQ2(1),
	datae => \ALT_INV_carrega2~input_o\,
	combout => \IQ2~2_combout\);

\IQ2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ2~2_combout\,
	ena => \IQ2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ2(1));

\IQ2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ2~3_combout\ = ( !\carrega2~input_o\ & ( !IQ2(2) $ (((!IQ2(0)) # (!IQ2(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000011110000000000000000000011110000111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ2(0),
	datab => ALT_INV_IQ2(1),
	datac => ALT_INV_IQ2(2),
	datae => \ALT_INV_carrega2~input_o\,
	combout => \IQ2~3_combout\);

\IQ2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ2~3_combout\,
	ena => \IQ2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ2(2));

\IQ2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ2~4_combout\ = ( !\carrega2~input_o\ & ( !IQ2(3) $ (((!IQ2(0)) # ((!IQ2(1)) # (!IQ2(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000000000000000000000001111111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ2(0),
	datab => ALT_INV_IQ2(1),
	datac => ALT_INV_IQ2(2),
	datad => ALT_INV_IQ2(3),
	datae => \ALT_INV_carrega2~input_o\,
	combout => \IQ2~4_combout\);

\IQ2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \IQ2~4_combout\,
	ena => \IQ2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ2(3));

\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (IQ2(0) & (IQ2(1) & (IQ2(2) & IQ2(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ2(0),
	datab => ALT_INV_IQ2(1),
	datac => ALT_INV_IQ2(2),
	datad => ALT_INV_IQ2(3),
	combout => \Equal0~0_combout\);

ww_fim1 <= \fim1~output_o\;

ww_condicao1 <= \condicao1~output_o\;

ww_saida(0) <= \saida[0]~output_o\;

ww_saida(1) <= \saida[1]~output_o\;

ww_saida(2) <= \saida[2]~output_o\;

ww_saida(3) <= \saida[3]~output_o\;

ww_db_fim2 <= \db_fim2~output_o\;

ww_db_contagem1(0) <= \db_contagem1[0]~output_o\;

ww_db_contagem1(1) <= \db_contagem1[1]~output_o\;

ww_db_contagem1(2) <= \db_contagem1[2]~output_o\;

ww_db_contagem1(3) <= \db_contagem1[3]~output_o\;
END structure;


