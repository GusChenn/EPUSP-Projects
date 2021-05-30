LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY tb  IS 
END ; 
 
ARCHITECTURE tb_arch OF tb IS
  SIGNAL fim   :  STD_LOGIC  ; 
  SIGNAL clock   :  STD_LOGIC  ; 
  SIGNAL db_estado   :  std_logic_vector (2 downto 0)  ; 
  SIGNAL condicao1   :  STD_LOGIC  ; 
  SIGNAL conta1   :  STD_LOGIC  ; 
  SIGNAL pronto   :  STD_LOGIC  ; 
  SIGNAL carrega2   :  STD_LOGIC  ; 
  SIGNAL conta2   :  STD_LOGIC  ; 
  SIGNAL zera1   :  STD_LOGIC  ; 
  SIGNAL iniciar   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT maquina_estados  
    PORT ( 
      fim  : in STD_LOGIC ; 
      clock  : in STD_LOGIC ; 
      db_estado  : out std_logic_vector (2 downto 0) ; 
      condicao1  : in STD_LOGIC ; 
      conta1  : out STD_LOGIC ; 
      pronto  : out STD_LOGIC ; 
      carrega2  : out STD_LOGIC ; 
      conta2  : out STD_LOGIC ; 
      zera1  : out STD_LOGIC ; 
      iniciar  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : maquina_estados  
    PORT MAP ( 
      fim   => fim  ,
      clock   => clock  ,
      db_estado   => db_estado  ,
      condicao1   => condicao1  ,
      conta1   => conta1  ,
      pronto   => pronto  ,
      carrega2   => carrega2  ,
      conta2   => conta2  ,
      zera1   => zera1  ,
      iniciar   => iniciar  ,
      reset   => reset   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 2 us, Period = 100 ns
  Process
	Begin
	 clock  <= '0'  ;
	wait for 50 ns ;
-- 50 ns, single loop till start period.
	for Z in 1 to 19
	loop
	    clock  <= '1'  ;
	   wait for 50 ns ;
	    clock  <= '0'  ;
	   wait for 50 ns ;
-- 1950 ns, repeat pattern in loop.
	end  loop;
	 clock  <= '1'  ;
	wait for 50 ns ;
-- dumped values till 2 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 600 ns, End Time = 2 us, Period = 0 ns
  Process
	Begin
	 reset  <= '1'  ;
	wait for 600 ns ;
	 reset  <= '0'  ;
	wait for 1400 ns ;
-- dumped values till 2 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 1 us, End Time = 2 us, Period = 0 ns
  Process
	Begin
	 iniciar  <= '0'  ;
	wait for 300 ns ;
	 iniciar  <= '1'  ;
	wait for 300 ns ;
	 iniciar  <= '0'  ;
	wait for 200 ns ;
	 iniciar  <= '1'  ;
	wait for 200 ns ;
	 iniciar  <= 'X'  ;
	wait for 1 us ;
-- dumped values till 2 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 1400 ns, End Time = 2 us, Period = 0 ns
  Process
	Begin
	 condicao1  <= '0'  ;
	wait for 200 ns ;
	 condicao1  <= '1'  ;
	wait for 800 ns ;
	 condicao1  <= '0'  ;
	wait for 400 ns ;
	 condicao1  <= 'X'  ;
	wait for 600 ns ;
-- dumped values till 2 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 1200 ns, End Time = 2 us, Period = 0 ns
  Process
	Begin
	 fim  <= '1'  ;
	wait for 400 ns ;
	 fim  <= '0'  ;
	wait for 800 ns ;
	 fim  <= '1'  ;
	wait for 800 ns ;
-- dumped values till 2 us
	wait;
 End Process;
END;
