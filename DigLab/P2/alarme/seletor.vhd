library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity seletor is
 port(
 
     A,B,C,D : in STD_LOGIC;
     S0,S1,ENABLE : in STD_LOGIC;
     Z: out STD_LOGIC
  );
end seletor;
 
architecture bhv of seletor is
begin

process (A,B,C,D,S0,S1) is
begin

  if ENABLE = '0' then Z <= '0'; end if;
  
  if (S0 ='0' and S1 = '0' and ENABLE = '1') then
      Z <= A;
  elsif (S0 ='1' and S1 = '0' and ENABLE = '1') then
      Z <= B;
  elsif (S0 ='0' and S1 = '1' and ENABLE = '1') then
      Z <= C;
  elsif (ENABLE = '1') then
      Z <= D;
  end if;
 
end process;
end bhv;
