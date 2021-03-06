library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity fluxo_dados is
    port (
        clock : in std_logic;
        zera1, conta1 : in std_logic;
        conta2, carrega2 : in std_logic;
        fim1, condicao1 : out std_logic;
        saida : out std_logic_vector(3 downto 0);
        db_fim2 : out std_logic;
        db_contagem1 : out std_logic_vector(3 downto 0)
    );
end fluxo_dados;

architecture comportamental of fluxo_dados is
    signal IQ1: integer range 0 to 15;
    signal IQ2: integer range 0 to 15;
	signal aux : std_logic_vector (3 downto 0);
    signal contagem32: std_logic_vector (1 downto 0);
    signal contagem10: std_logic_vector (1 downto 0);
    begin
        process (clock, zera1, conta1, IQ1)
        begin     
            if zera1 = '1' then IQ1 <= 0;
            elsif rising_edge(clock) then
                if conta1 = '1' then
                    if IQ1 = 15 then IQ1 <= 0;
                    else IQ1 <= IQ1 + 1;
                    end if;
                else IQ1 <= IQ1;
                end if;
            end if;
        end process;

        process (clock, conta2, carrega2, IQ2)
        begin     
            if rising_edge(clock) then
                if carrega2 = '1' then
                    IQ2 <= 0;
                    elsif conta2 = '1' then
                        if IQ2 = 15 then IQ2 <= 0;
                        else IQ2 <= IQ2 + 1;
                        end if;
                    else IQ2 <= IQ2;
                end if;
			end if;
    end process;

        --variável aux segura o valor da saída para podermos atribuir seu valor a contagem10 e conatgem32
        aux <= std_logic_vector(to_unsigned(IQ1, db_contagem1'length));

        --variáveis auxiliares pra comparar bits da contagem
        contagem10 <= aux(1 downto 0);
        contagem32 <= aux(3 downto 2);
       
        --saídas do contador_comparador
        fim1 <= '1' when IQ1 = 15 else '0';
        condicao1 <= '1' when contagem32 = contagem10 else '0';
        db_contagem1 <= aux;

        --saídas do contador 2
        db_fim2 <= '1' when IQ2 = 15 else '0';
        saida <= std_logic_vector(to_unsigned(IQ2, saida'length));
        
    end comportamental;