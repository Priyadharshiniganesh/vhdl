
library ieee;
use ieee.std_logic_1164.all;

entity dff is

  port (
    clk, rst, d : in  std_logic;
    q, qn       : out std_logic);

end entity dff;


architecture behav of dff is

begin  -- architecture behav

  process (clk, rst) is
  begin  -- process
    if rst = '0' then                   -- asynchronous reset (active low)
      q  <= '0';
      qn <= '1';


    elsif clk'event and clk = '1' then  -- rising clock edge
      q  <= d;
      qn <= not d;
    end if;
  end process;

end architecture behav;
