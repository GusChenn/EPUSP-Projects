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

-- Generated by Quartus Prime Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition
-- Created on Sat May 02 22:07:09 2020

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY logica_combinatoria IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        noturno : IN STD_LOGIC := '0';
        PvA : IN STD_LOGIC := '0';
        PvB : IN STD_LOGIC := '0';
        Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END logica_combinatoria;

ARCHITECTURE BEHAVIOR OF logica_combinatoria IS
    TYPE type_fstate IS (VdA_Vmb,VmA_VdB,AmA_VmB,VmA_AmB,VmA_VmB,Apagado,AmA_AmB);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,noturno,PvA,PvB)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= VdA_Vmb;
            Q <= "000";
        ELSE
            Q <= "000";
            CASE fstate IS
                WHEN VdA_Vmb =>
                    IF ((((PvA = '1') AND (PvB = '1')) AND (noturno = '0'))) THEN
                        reg_fstate <= AmA_VmB;
                    ELSIF ((((PvA = '0') AND (PvB = '0')) AND (noturno = '0'))) THEN
                        reg_fstate <= VmA_VmB;
                    ELSIF ((((PvA = '1') AND (PvB = '0')) AND (noturno = '0'))) THEN
                        reg_fstate <= VdA_Vmb;
                    ELSIF ((((PvA = '0') AND (PvB = '1')) AND (noturno = '0'))) THEN
                        reg_fstate <= VmA_VdB;
                    ELSIF ((noturno = '1')) THEN
                        reg_fstate <= AmA_AmB;
                    END IF;

                    Q <= "000";
                WHEN VmA_VdB =>
                    IF (((noturno = '1') OR (PvA = '1'))) THEN
                        reg_fstate <= VmA_AmB;
                    ELSIF ((((PvA = '0') AND (PvB = '1')) AND (noturno = '0'))) THEN
                        reg_fstate <= VmA_VdB;
                    END IF;

                    Q <= "010";
                WHEN AmA_VmB =>
                    reg_fstate <= VmA_VdB;

                    Q <= "001";
                WHEN VmA_AmB =>
                    reg_fstate <= VdA_Vmb;

                    Q <= "011";
                WHEN VmA_VmB =>
                    IF ((((PvA = '1') OR (PvB = '1')) OR (noturno = '1'))) THEN
                        reg_fstate <= VdA_Vmb;
                    ELSIF ((((PvA = '0') AND (PvB = '0')) AND (noturno = '0'))) THEN
                        reg_fstate <= VmA_VmB;
                    END IF;

                    Q <= "110";
                WHEN Apagado =>
                    reg_fstate <= AmA_AmB;

                    Q <= "100";
                WHEN AmA_AmB =>
                    IF ((noturno = '1')) THEN
                        reg_fstate <= Apagado;
                    ELSIF ((noturno = '0')) THEN
                        reg_fstate <= VdA_Vmb;
                    END IF;

                    Q <= "101";
                WHEN OTHERS => 
                    Q <= "XXX";
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;