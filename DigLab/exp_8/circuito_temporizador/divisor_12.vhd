library IEEE;
use IEEE.std_logic_1164.all;
use Ieee.numeric_std.all;

entity divisor_12 is
    port (
        clock, zera : in std_logic;
        divisor12_out: out std_logic
    );
end divisor_12;

architecture comportamental of divisor_12 is

    signal conta_ciclo: integer range 0 to 12;
	 
begin

--para fins de simulação, fizemos o divisor dividir por 2 ao invés de 12. Para dividir por 12, bastaria trocar os "2" por
--"12" nas linhas 27 e 33.

    process (clock, zera)
    begin
			if zera = '1' then
				conta_ciclo <= 0;
        elsif clock'event and clock = '1' then
				conta_ciclo <= conta_ciclo + 1;
				if conta_ciclo = 2 then
					conta_ciclo <= 0;
				end if;
		  end if;
	 end process;
	
	 divisor12_out <= '1' when conta_ciclo = 2 else '0';

end comportamental;