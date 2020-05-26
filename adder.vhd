library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--ADDER
entity adder is
port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);

		sum: out std_logic_vector(7 downto 0)
		);

end adder;

architecture adder of adder is
begin

	sum (7 downto 0)<= std_logic_vector(unsigned("0000" & A) + unsigned("0000" & B));

end adder;
--ADDER