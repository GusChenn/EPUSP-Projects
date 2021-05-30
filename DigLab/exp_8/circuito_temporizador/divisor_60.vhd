library IEEE;
use IEEE.std_logic_1164.all;
use Ieee.numeric_std.all;

entity divisor_60 is
    port (
        clock, zera, flag : in std_logic;
        divisor60_out: out std_logic
    );
end divisor_60;

architecture comportamental of divisor_60 is

    signal conta_ciclo: integer range 0 to 60;
	 
begin

--para fins de simulação, fizemos o divisor dividir por 6 ao invés de 60. Para dividir por 60, bastaria trocar os "6" por
--"60" nas linhas 27 e 33.

    process (clock, zera)
    begin
			if zera = '1' then
				conta_ciclo <= 0;
        elsif clock'event and clock = '1' then
				conta_ciclo <= conta_ciclo + 1;
				if conta_ciclo = 6 then
					conta_ciclo <= 0;
				end if;
		  end if;
	 end process;
	
	 divisor60_out <= '1' when conta_ciclo = 6 else '0';

end comportamental;