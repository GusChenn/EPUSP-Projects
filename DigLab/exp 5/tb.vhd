LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY tb  IS 
END ; 
 
ARCHITECTURE tb_arch OF tb IS
  SIGNAL A   :  std_logic_vector (1 downto 0)  ; 
  SIGNAL igual   :  STD_LOGIC  ; 
  SIGNAL B   :  std_logic_vector (1 downto 0)  ; 
  COMPONENT comparador  
    PORT ( 
      A  : in std_logic_vector (1 downto 0) ; 
      igual  : out STD_LOGIC ; 
      B  : in std_logic_vector (1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : comparador  
    PORT MAP ( 
      A   => A  ,
      igual   => igual  ,
      B   => B   ) ; 



-- "Constant Pattern"
-- Start Time = 1 ns, End Time = 1500 ps, Period = 0 ps
  Process
	Begin
	 A  <= "00"  ;
	wait for 500 ps ;
	 A  <= "01"  ;
	wait for 500 ps ;
	 A  <= "11"  ;
	wait for 500 ps ;
-- dumped values till 1500 ps
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 1 ns, End Time = 1500 ps, Period = 0 ps
  Process
	Begin
	 B  <= "00"  ;
	wait for 500 ps ;
	 B  <= "10"  ;
	wait for 500 ps ;
	 B  <= "11"  ;
	wait for 500 ps ;
-- dumped values till 1500 ps
	wait;
 End Process;
END;
