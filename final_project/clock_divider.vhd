library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
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
end clock_divider;

architecture behavioral of clock_divider is
  signal clk1_internal: std_logic;
  signal clk2_internal: std_logic;
  signal clk3_internal: std_logic;

  signal clk1_counter: std_logic_vector(3 downto 0);
  signal clk2_counter: std_logic_vector(2 downto 0);
  signal clk3_counter: std_logic_vector(1 downto 0);
begin
  execute: process(clock)
  begin
    if rising_edge(clock) then
      if reset = '1' then
        clk1 <= 'Z';
        clk2 <= 'Z';
        clk3 <= 'Z';
      else
        if enable_all = '1' then
          clk1 <= clk1_internal;
          clk2 <= clk2_internal;
          clk3 <= clk3_internal;
        else
          if enable_clk1 = '1' then
            clk1 <= clk1_internal;
          else
            clk1 <= 'Z';
          end if;

          if enable_clk2 = '1' then
            clk2 <= clk2_internal;
          else
            clk2 <= 'Z';
          end if;

          if enable_clk3 = '1' then
            clk3 <= clk3_internal;
          else
            clk3 <= 'Z';
          end if;
        end if;
      end if;
    end if;
  end process;

  generate_clk1: process(clock)
  begin
    if rising_edge(clock) then
      if reset = '1' then
        clk1_internal <= '1';
        clk1_counter <= std_logic_vector(to_unsigned(1, clk1_counter'length));
      else
        clk1_counter <= std_logic_vector(unsigned(clk1_counter) + 1);

        if unsigned(clk1_counter) = 0 then
          clk1_counter <= std_logic_vector(to_unsigned(1, clk1_counter'length));
          clk1_internal <= not clk1_internal;
        end if;
      end if;
    end if;
  end process;

  generate_clk2: process(clock)
  begin
    if rising_edge(clock) then
      if reset = '1' then
        clk2_internal <= '1';
        clk2_counter <= std_logic_vector(to_unsigned(1, clk2_counter'length));
      else
        clk2_counter <= std_logic_vector(unsigned(clk2_counter) + 1);

        if unsigned(clk2_counter) = 0 then
          clk2_counter <= std_logic_vector(to_unsigned(1, clk2_counter'length));
          clk2_internal <= not clk2_internal;
        end if;
      end if;
    end if;
  end process;
  
  generate_clk3: process(clock)
  begin
    if rising_edge(clock) then
      if reset = '1' then
        clk3_internal <= '1';
        clk3_counter <= std_logic_vector(to_unsigned(1, clk3_counter'length));
      else
        clk3_counter <= std_logic_vector(unsigned(clk3_counter) + 1);

        if unsigned(clk3_counter) = 0 then
          clk3_counter <= std_logic_vector(to_unsigned(1, clk3_counter'length));
          clk3_internal <= not clk3_internal;
        end if;
      end if;
    end if;
  end process;
end behavioral;
