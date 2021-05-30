library IEEE;
use IEEE.std_logic_1164.all;

entity temporizador is
    port (
        clock, zera : in std_logic;
		  trigger_1s, trigger_5s, trigger_1min : in std_logic;
        saida : out std_logic
    );
end temporizador;

architecture comportamental of temporizador is
--	 adaptamos os períodos de operação do farol para 10e-6 dos períodos originais para podermos simular. 
--	 Para obtermos um circuito temporizador igual ao descrito no enunciado, precisaríamos trocar todos os
--	 "50" deste programa por "50000000", porém o quartus não conseguiria simular.
    signal conta1: integer range 0 to 50;
	 signal conta2: integer range 0 to 5;
	 signal conta3: integer range 0 to 60;
	 signal flag: boolean;
begin

    process (clock, zera)
    begin
        
       if clock'event and clock = '1' then
				if zera = '1' then 
					conta1 <= 0;
					conta2 <= 0;
					conta3 <= 0;
					flag <= false;
				end if;
				if conta2 = 5 then 
					conta2 <= 0;
					if trigger_5s = '1' then flag <= true;
					end if;
				end if;
				if conta3 = 60 then 
				conta3 <= 0;
					if trigger_1min = '1' then flag <= true;
					end if;
				end if;
            if conta1 = 50 then 
					conta1 <= 0;
					conta2 <= conta2 + 1;
					conta3 <= conta3 + 1;
					if trigger_1s = '1' then flag <= true;
					end if;
            else conta1 <= conta1 + 1;
				end if;
		  end if;
	 end process;		
	 
	 saida <= '1' WHEN flag = true ELSE '0';

end comportamental;