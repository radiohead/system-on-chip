library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_adder is
  generic(
    input_size: integer := 8
  );

  port(
    clock: in std_logic;
    reset: in std_logic;
    
    lefthand: in std_logic_vector((input_size - 1) downto 0);
    righthand: in std_logic_vector((input_size - 1) downto 0);
    result: out std_logic_vector((input_size) downto 0)
  );
end shift_adder;

architecture behavioral of shift_adder is
begin
  adding: process(clock)
    variable temp: integer;
  begin
    if (clock'event and clock = '1') then
      if reset = '1' then
        result <= (others => '0');
        temp := 0;
      else
        temp := to_integer(unsigned(lefthand) + unsigned(righthand));
        result <= std_logic_vector(to_unsigned(temp, result'length));
      end if;
    end if;
  end process;
end behavioral;
