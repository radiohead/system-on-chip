library ieee;

use ieee.std_logic_1164.all;

entity shift_adder_testbench is
end shift_adder_testbench;

architecture testing of shift_adder_testbench is
  signal clock_tb: std_logic := '0';
  signal reset_tb: std_logic := '0';
  signal result_tb: std_logic_vector(8 downto 0);
  signal input_a: std_logic_vector(7 downto 0);
  signal input_b: std_logic_vector(7 downto 0);
  
  component shift_adder
     port (
      clock: in std_logic;
      reset: in std_logic;
      lefthand: in std_logic_vector (7 downto 0);
      righthand: in std_logic_vector (7 downto 0);
      result: out std_logic_vector(8 DOWNTO 0)
     );
  end component;
begin
  dut: shift_adder
    port map(
      reset => reset_tb,
      clock => clock_tb,
      lefthand => input_a,
      righthand => input_b,
      result => result_tb
    );

    clocking: process
    begin
      clock_tb <= not clock_tb;
      wait for 2 ns;
    end process;

    testing: process
    begin
      reset_tb <= '1';
      wait for 4 ns;
      reset_tb <= '0';

      input_a <= "00011101";
      input_b <= "01100101";
      wait for 4 ns;

      input_a <= "00000000";
      input_b <= "00000000";
      wait for 4 ns;

      input_a <= "00011101";
      input_b <= "01100101";
      wait for 4 ns;
    end process;
end testing;
