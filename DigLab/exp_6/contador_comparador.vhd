library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_comparador is
    port (
        clock, zera, conta, carrega : in std_logic;
        entrada : in std_logic_vector (3 downto 0);
        contagem : out std_logic_vector (3 downto 0);
        fim, condicao1 : out std_logic
    );
end contador_comparador;

architecture comportamental of contador_comparador is
    signal IQ: integer range 0 to 15;
	signal aux : std_logic_vector (3 downto 0);
    signal contagem32: std_logic_vector (1 downto 0);
    signal contagem10: std_logic_vector (1 downto 0);
begin
	process (clock, zera, conta, carrega, entrada, IQ)
   begin     
		  if zera = '1' then IQ <= 0;
        elsif rising_edge(clock) then
            if carrega = '1' then
                IQ <= to_integer(unsigned(entrada));
            elsif conta = '1' then
                if IQ = 15 then IQ <= 0;
                else IQ <= IQ + 1;
                end if;
            else IQ <= IQ;
            end if;
			end if;
    end process;

	 aux <= std_logic_vector(to_unsigned(IQ, contagem'length));
    contagem <= aux;

    contagem10 <= aux(1 downto 0);
    contagem32 <= aux(3 downto 2);
   

    fim <= '1' when IQ = 15 else '0';

    condicao1 <= '1' when contagem32 = contagem10 else '0';

    
end comportamental;