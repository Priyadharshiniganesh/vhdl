library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------
entity ADDER is
  port(A   : in  std_logic_vector(3 downto 0);
       B   : in  std_logic_vector(3 downto 0);
       carry :
       out std_logic;
       sum : out std_logic_vector(3 downto 0)
       );
end ADDER;
--------------------------------------------------------
architecture behv of ADDER is
  signal result : std_logic_vector(4 downto 0);
begin
  result <= std_logic_vector(unsigned('0' & A)+unsigned('0' & B));
  sum    <= result(3 downto 0);
  carry  <= result(4);
end behv;
