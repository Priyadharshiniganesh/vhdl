library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity adder_tb is
end adder_tb;


architecture tst of adder_tb is
  component adder is
    port(A     : in  std_logic_vector(3 downto 0);
         B     : in  std_logic_vector(3 downto 0);
         carry : out std_logic;
         sum   : out std_logic_vector(3 downto 0)
         );
  end component adder;

  signal in1, in2, sum : std_logic_vector(3 downto 0);
  signal cout          : std_logic;

begin


  inst0 : adder port map (
    A     => in1,
    B     => in2,
    carry => cout,
    sum   => sum);

  stimuli: process is
  begin  -- process stimuli
    in1 <= "0100";
    in2 <= "0010";
    wait for 5 ns;
    in1 <= "0101";
    in2 <= "0011";
    wait for 5 ns;
    in1 <= "1100";
    in2 <= "0110";
    wait;    
  end process stimuli;


end tst;
