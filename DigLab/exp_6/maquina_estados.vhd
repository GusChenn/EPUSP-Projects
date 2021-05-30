library IEEE;
use IEEE.std_logic_1164.all;

entity maquina_estados is
	port (   clock, reset, iniciar, condicao1, fim   : in std_logic;
				pronto, zera1, conta1, conta2, carrega2 : out std_logic;
				db_estado : out std_logic_vector(2 downto 0)
			);
end maquina_estados;

architecture comportamental of maquina_estados is
	type tipo_estado is (inicial, zeraconts, testacondicao1, contacont2, contacont1, testafim, final);
	signal Eatual, Eprox : tipo_estado;

begin
	process (reset, clock) --definindo proximo estado
	begin
		if reset = '1' then
			Eatual <= inicial;
		elsif clock'event and clock = '1' then
			Eatual <= Eprox;
		end if;
	end process;
	
	process (iniciar, condicao1, fim, Eatual)
	begin
		case Eatual is 
			when inicial =>			if iniciar = '1'
											then Eprox <= zeraconts;
											else Eprox <= inicial;
											end if;
			
			when zeraconts =>			Eprox <= testacondicao1;
											
			when testacondicao1 => 	if condicao1 = '1'
											then Eprox <= contacont2;
											else Eprox <= contacont1;
											end if;
								
			when contacont2 => 		Eprox <= contacont1;
			
			when contacont1 =>		Eprox <= testafim;
			
			when testafim =>			if fim = '1'
											then Eprox <= final;
											else Eprox <= testacondicao1;
											end if;
										
			when final =>				Eprox <= inicial;
			
			when others =>				Eprox <= inicial;
		end case;
	end process;

	-- saidas
	with Eatual select
		zera1 <= '1' when zeraconts, '0' when others;

	with Eatual select
		carrega2 <= '1' when zeraconts, '0' when others;

	with Eatual select
		conta2 <= '1' when contacont2, '0' when others;

	with Eatual select
		conta1 <= '1' when contacont1, '0' when others;

	with Eatual select
		pronto <= '1' when final, '0' when others;

	with Eatual select
		db_estado <= "000" when inicial,
					 "001" when zeraconts,
					 "010" when testacondicao1,
					 "011" when contacont2,
					 "100" when contacont1,
					 "101" when testafim,
					 "110" when final,
					 "111" when others;
	end comportamental;