library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity multiplier_tb is
end multiplier_tb;

architecture test of multiplier_tb is
  signal reset_tb: std_logic;
  signal clock_tb: std_logic;
  signal enable_tb: std_logic;
  signal x_tb: std_logic_vector(3 downto 0);
  signal y_tb: std_logic_vector(3 downto 0);
  signal z_tb: std_logic_vector(7 downto 0);
  signal test_output: std_logic_vector(7 downto 0);
  
  component multiplier
    port (
      clock: in std_logic;
      reset: in std_logic;
      enable: in std_logic;
      x: in std_logic_vector(3 downto 0);
      y: in std_logic_vector(3 downto 0);
      z: out std_logic_vector(7 downto 0)
    );
  end component;
begin
  dut: multiplier
    port map(
      reset => reset_tb,
      clock => clock_tb,
      enable => enable_tb,
      x => x_tb,
      y => y_tb,
      z => z_tb
    );
    
  clocking: process
  begin
    clock_tb <= '0';
    wait for 10 ns;
    clock_tb <= '1';
    wait for 10 ns;
  end process;
  
  testing: process
  begin
    reset_tb <= '1';
    enable_tb <= '0';
    x_tb <= "0000";
    y_tb <= "0000";
    wait for 20 ns;
    reset_tb <= '0';
    wait for 20 ns;
    enable_tb <= '1';
    wait for 20 ns;
    
    test_loop: for i in 0 to 15 loop
      x_tb <= x_tb + '1';
      test_loop2: for j in 0 to 15 loop
        y_tb <= y_tb + '1';
        wait for 40 ns;
      end loop;
    end loop;
  end process;
end test;