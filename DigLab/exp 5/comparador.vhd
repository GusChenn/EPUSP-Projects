library IEEE;
use IEEE.std_logic_1164.all;

entity comparador is
    port (
                                                            --declaração das entradas e saídas do componente que estamos projetando
        A, B: in std_logic_vector (1 downto 0);             --dois barramentos de entrada de 2 bits cada
        igual: out STD_LOGIC                                --um bit de saída 
    );
end comparador;

architecture comportamental of comparador is
begin

    igual <= '1' when A=B else '0';

end comportamental;