library ieee;
use ieee.numeric_bit.all;


entity Exercise05 is
end entity;


architecture behaviour of Exercise05 is
  signal clk, rst : bit;

  signal sig, var                         : bit_vector(3 downto 0);  -- Aufgabe Signale und Variablen
  signal a1, b1, c1                       : bit;  -- Aufgabe Processe a 
  signal a2, b2, c2, d2                   : bit;  -- Aufgabe Processe b
  signal input, output1, output2, output3 : bit;  -- Aufgabe Signalverlaeufe a
  signal dti, dto, dto2                   : bit;  -- Aufgabe Signalverlaeufe b

begin

  process
  begin
    rst <= '1';
    wait for 5 ns;
    rst <= '0';
    wait;
  end process;

  -- Aufgabe Signale und Variablen  
  process
  begin
    clk <= '1';
    wait for 2.5 ns;
    clk <= '0';
    wait for 2.5 ns;
  end process;


  process(clk, rst)
    variable temp : bit_vector(3 downto 0) := "0000";
  begin
    if (rst = '1') then
      temp := "0000";
      sig  <= "0000";
    elsif (clk'event and clk = '1') then
      temp := bit_vector(unsigned(temp) + 1);
      sig  <= bit_vector(unsigned(sig) + 1);
      temp := bit_vector(unsigned(temp) + 1);
      sig  <= bit_vector(unsigned(sig) + 1);
    end if;
    var <= temp;
  end process;



-- Aufgabe Processe a 
  process
  begin
    a1 <= '1' after 5 ns;
    b1 <= a1  after 5 ns;
    c1 <= b1  after 5 ns;
    wait;
  end process;

-- Aufgabe Processe b
  process (a2, b2)
  begin
    a2 <= '1' after 5 ns;
    b2 <= a2  after 5 ns;
    c2 <= b2  after 5 ns;
    d2 <= c2  after 5 ns;
  end process;


-- Aufgabe Signalverlaeufe a
  process
  begin
    input <= '1';
    wait for 5 ns;
    input <= '0';
    wait for 3 ns;
    input <= '1';
    wait for 3 ns;
    input <= '0';
    wait for 2 ns;
    input <= '1';
    wait for 6 ns;
    input <= '0';
    wait;
  end process;

  process (input)
  begin
    output1 <= transport not input              after 4 ns;
    output2 <= reject 2.5 ns inertial not input after 4 ns;
    output3 <= inertial not input               after 4 ns;
  end process;


-- Aufgabe Signalverlaeufe b
  stim_proc : process(dto2)
  begin
    dti <= transport '1' after 3 ns, '0' after 5 ns, '1' after 12 ns;
  end process;

  dto  <= reject 2 ns inertial not dti after 4 ns;
  dto2 <= transport not dti            after 3 ns;


end architecture;
