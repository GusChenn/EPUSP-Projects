library IEEE;
use IEEE.std_logic_1164.all;

entity temporizador is
    port (
        clock, zera : in std_logic;
        um_seg, cinco_seg, um_min : out std_logic
    );
end temporizador;

architecture comportamental of temporizador is
    signal IQ: integer range 0 to 49999999;
begin

    process (clock, zera)
    begin
        if zera = '1' then IQ <= 0
        elsif clock'event and clock = '1' then
            if IQ = 49999999 then IQ <= 0;
            else IQ <= IQ + 1;
            end if;
        end if;
    end process;

    um_seg <= '1' when IQ = 49999999 else '0';

end comportamental;