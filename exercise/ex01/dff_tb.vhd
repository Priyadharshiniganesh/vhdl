library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is

end entity dff_tb;

architecture tb of dff_tb is

  component dff is
    port (
      clk, rst, d : in  std_logic;
      q, qn       : out std_logic);
  end component dff;

  signal clk, rst, d, q, qn : std_logic;


begin  -- architecture tb
  mapping : dff port map (
    clk => clk,
    rst => rst,
    d   => d,
    q   => q,
    qn  => qn);

  clockgen : process is
  begin  -- process clockgen
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process clockgen;

  process is
  begin  -- process
    d   <= '0';
    rst <= '1';
    wait for 15 ns;
    d   <= '1';
    wait for 9 ns;
    d   <= '0';
    wait for 5 ns;
    d   <= '1';
    rst <= '0';
    wait for 13 ns;
  end process;

end architecture tb;
