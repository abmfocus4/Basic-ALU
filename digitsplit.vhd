library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--DIGITSPLIT
entity digitsplit is port (
mux_vector	: in std_logic_vector(7 downto 0); 
tens	: out std_logic_vector(3 downto 0); 
ones	: out std_logic_vector(3 downto 0)
); 
end entity digitsplit; 

architecture digitsplit of digitsplit is 
begin 
	--tens(3 downto 0) <= std_logic_vector((unsigned(mux_vector)) / 10); 
	--ones(3 downto 0) <= std_logic_vector((unsigned(mux_vector)) mod 10); 
	tens <= mux_vector(7 downto 4); 
	ones <= mux_vector(3 downto 0); 
end digitsplit; 
--DIGITSPLIT