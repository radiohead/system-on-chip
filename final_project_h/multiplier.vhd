library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity multiplier is
port (
  x, y: in STD_LOGIC_VECTOR(3 downto 0);
  clock, reset, enable: in STD_LOGIC;
  z: out STD_LOGIC_VECTOR(7 downto 0));
end multiplier;

architecture dataflow of multiplier is
 signal pp0, pp1, pp2, pp3: STD_LOGIC_VECTOR(7 downto 0);
begin
 multiplier_process: process (clock)
  begin
   if reset = '1' then
    z <= "00000000";
   end if;
  
   if (clock'event and clock = '1') then
    if enable = '0' then
      z <= "00000000";
    end if;
    
    if enable = '1' then
      pp0(0) <= y(0) AND x(0);
      pp0(1) <= y(0) AND x(1);
      pp0(2) <= y(0) AND x(2);
      pp0(3) <= y(0) AND x(3);
      pp0(4) <= '0';
      pp0(5) <= '0';
      pp0(6) <= '0';
      pp0(7) <= '0';
      
            
      pp1(1) <= y(1) AND x(0);
      pp1(2) <= y(1) AND x(1);
      pp1(3) <= y(1) AND x(2);
      pp1(4) <= y(1) AND x(3);
      pp1(5) <= '0';
      pp1(6) <= '0';
      pp1(7) <= '0';
      pp1(0) <= '0';
            
            
      pp2(2) <= y(2) AND x(0);
      pp2(3) <= y(2) AND x(1);
      pp2(4) <= y(2) AND x(2);
      pp2(5) <= y(2) AND x(3);
      pp2(6) <= '0';
      pp2(7) <= '0';
      pp2(0) <= '0';
      pp2(1) <= '0';
                 
      pp3(3) <= y(3) AND x(0);
      pp3(4) <= y(3) AND x(1);
      pp3(5) <= y(3) AND x(2);
      pp3(6) <= y(3) AND x(3);
      pp3(7) <= '0';
      pp3(0) <= '0';
      pp3(1) <= '0';
      pp3(2) <= '0';
      
      z <= (pp3 + pp2) + (pp1 + pp0);
     end if;
   end if;
 end process;

end dataflow;