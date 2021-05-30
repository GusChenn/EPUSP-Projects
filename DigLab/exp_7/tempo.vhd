library IEEE;
use IEEE.std_logic_1164.all;

entity temporizador is
    port (
        clock, zera : in std_logic;
        um_seg, cinco_seg, um_min : out std_logic
    );
end temporizador;

architecture comportamental of temporizador is
    signal cont1: integer range 0 to 49999999;
	 signal cont2: integer range 0 to 4;
	 signal cont3: integer range 0 to 59;
begin

    process (clock, zera)
    begin
        if zera = '1' then conta1 <= 0;
        elsif clock'event and clock = '1' then
            if conta1 = 49999999 then conta1 <= 0;
            else conta1 <= conta1 + 1;
				end if;
		  end if;
	 end process;		

    um_seg <= '1' when IQ = 49999999 else '0';

end comportamental;