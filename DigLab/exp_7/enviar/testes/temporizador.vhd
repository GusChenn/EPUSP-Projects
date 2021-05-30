--circuito_temporizador.vhd
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity circuito_temporizador is
	port(	clock 	:		in std_logic;
			zera 		:	in std_logic;
			trigger_1s	:	in std_logic;
			trigger_5s	:	in std_logic;
			trigger_1min :	in std_logic;
			saida		:	out std_logic);
end circuito_temporizador;
			
			
architecture comportamental of circuito_temporizador is

	variable tempo1s:	natural range 	0 to 50 := '0';
	variable tempo5s:	natural range	0 to 5 := '0';
	variable tempo1min:	natural range	0 to 12 := '0';
begin 

	process (clock, zera, saida)
	begin
		
		if clock'event and clock = '1' then
		
			if trigger_1s = '1' then
				
				tempo1s <= tempo1s + 1;
				
				if tempo1s = '50' then
					saida <= 1;
				end if;
			end if;
			
			if trigger_5s = '1' then
				
				tempo1s <= tempo1s + 1;
				
				if tempo1s = '50' then
					tempo1s <= 0;
					tempo5s <= tempo5s + 1;
				end if;
				
				if tempo5s = '5' then 
					saida <= 1;
				end if;
			end if;
			
			if trigger_1min = '1' then
				
				tempo1s <= tempo1s + 1;
				
				if tempo1s = '50' then
					tempo1s <= 0;
					tempo5s <= tempo5s + 1;
				end if;
				
				if tempo5s = '5' then 
					tempo5s <= 0;
					tempo1min <= tempo1min +1;
				end if;
				
				if tempo1min = '12' then 
					saida <= 1;
				end if;
			end if;
			
			if zera = 1 or saida = 1 then
				tempo1s <= 0;
				tempo5s <= 0;
				tempo1min <= 0;
			end if;
			
		end if;
	end process;
	



