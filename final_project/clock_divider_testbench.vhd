library ieee;
use ieee.std_logic_1164.all;

entity clock_divider_testbench is
end clock_divider_testbench;

architecture behavioral of clock_divider_testbench is
  component clock_divider
    port(
      clock       :in std_logic;
      reset       :in std_logic;
      enable_all  :in std_logic;
      enable_clk1 :in std_logic;
      enable_clk2 :in std_logic;
      enable_clk3 :in std_logic;
      clk1        :out std_logic;
      clk2        :out std_logic;
      clk3        :out std_logic
    );
  end component;
  
  signal tb_reset :std_logic;
  signal tb_clock :std_logic;
  signal tb_enable_all :std_logic;
  signal tb_enable_clk1 :std_logic;
  signal tb_enable_clk2 :std_logic;
  signal tb_enable_clk3 :std_logic;

  signal tb_clk1 :std_logic;
  signal tb_clk2 :std_logic;
  signal tb_clk3 :std_logic;

  constant clock_period :time := 100 ns; 
begin
  clock_divider_dut: clock_divider
    port map(
      clock => tb_clock,
      reset => tb_reset,
      enable_all => tb_enable_all,
      enable_clk1 => tb_enable_clk1,
      enable_clk2 => tb_enable_clk2,
      enable_clk3 => tb_enable_clk3,
      clk1 => tb_clk1,
      clk2 => tb_clk2,
      clk3 => tb_clk3
    );

  generate_clock: process
  begin
    tb_clock <= '0';
    wait for clock_period / 2;
    tb_clock <= '1';
    wait for clock_period / 2;
  end process;

  testing: process
  begin
    tb_reset <= '1';
    tb_enable_all <= '0';
    tb_enable_clk1 <= '0';
    tb_enable_clk2 <= '0';
    tb_enable_clk3 <= '0';
    wait for clock_period;

    tb_reset <= '0';
    tb_enable_all <= '1';
    wait for clock_period * 16;

    tb_reset <= '0';
    tb_enable_all <= '0';
    tb_enable_clk1 <= '1';
    wait for clock_period * 16;

    tb_reset <= '0';
    tb_enable_all <= '0';
    tb_enable_clk2 <= '1';
    wait for clock_period * 16;

    tb_reset <= '0';
    tb_enable_all <= '0';
    tb_enable_clk3 <= '1';
    wait for clock_period * 16;
  end process;
end behavioral;
