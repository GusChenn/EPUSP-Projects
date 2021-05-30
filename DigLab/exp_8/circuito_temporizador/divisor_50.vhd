library IEEE;
use IEEE.std_logic_1164.all;
use Ieee.numeric_std.all;

entity divisor_50 is
    port (
        clock, zera : in std_logic;
        divisor50_out: out std_logic
    );
end divisor_50;

architecture comportamental of divisor_50 is

    signal conta_ciclo: integer range 0 to 50;
	 
begin

--para fins de simulação, fizemos o divisor dividir por 5 ao invés de 50M. Para dividir por 50M, bastaria trocar os "5" por
--"50000000" nas linhas 27 e 33.

    process (clock, zera)
    begin
			if zera = '1' then
				conta_ciclo <= 0;
        elsif clock'event and clock = '1' then
				conta_ciclo <= conta_ciclo + 1;
				if conta_ciclo = 5 then
					conta_ciclo <= 0;
				end if;
		  end if;
	 end process;
	
	 divisor50_out <= '1' when conta_ciclo = 5 else '0';

end comportamental;