library IEEE;
use IEEE.std_logic_1164.all;

entity contador is
    port (
        clock : in std_logic;
        out20, out200, out2k, out20k : out std_logic
    );
end contador;

architecture comportamental of contador is
--	 signal cont20: integer range 1 to 2500000; 
--	 signal cont200: integer range 1 to 250000;
--	 signal cont2k: integer range 1 to 25000;
--	 signal cont20k: integer range 1 to 2500;       --valores originais

	 signal cont20: integer range 1 to 1000; 
  	 signal cont200: integer range 1 to 100;
	 signal cont2k: integer range 1 to 10;
	 signal cont20k: integer range 1 to 2;

	 signal aux20: std_logic;
	 signal aux200: std_logic;
	 signal aux2k: std_logic;
	 signal aux20k: std_logic;
	 
begin
	 
    process (clock)
    begin
		  
        if clock'event and clock = '1' then
            if cont20 = 1000 then --original: 2500000
					cont20 <= 1;
            else cont20 <= cont20 + 1;
				end if;
				
				if cont200 = 100 then --original: 250000
					cont200 <= 1;
            else cont200 <= cont200 + 1;
				end if;
				
				if cont2k = 10 then --original: 25000
					cont2k <= 1;
            else cont2k <= cont2k + 1;
				end if;
				
				if cont20k = 2 then --original: 2500
					cont20k <= 1;
            else cont20k <= cont20k + 1;
				end if;
		  end if;
		  
		  if cont20 < 501 then aux20 <= '0'; else aux20 <= '1'; end if; --original: 1250001
		  if cont200 < 51 then aux200 <= '0'; else aux200 <= '1'; end if; --original: 125001
		  if cont2k < 6 then aux2k <= '0'; else aux2k <= '1'; end if; --original: 12501
		  --if cont20k < 1 then aux20k <= '0'; else aux20k <= '1'; end if; --original
		  if cont20k = 2 then aux20k <= '1'; else aux20k <= '0'; end if;
	 end process;		

    out20 <= aux20;
	 out200 <= aux200;
	 out2k <= aux2k;
	 out20k <= aux20k;

end comportamental;