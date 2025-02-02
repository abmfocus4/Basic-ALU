library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--LOGIC_PROCESSOR
entity logic_processor is
port(

	HexA : in std_logic_vector(3 downto 0);
	HexB : in std_logic_vector(3 downto 0);
	pb : in std_logic_vector(3 downto 0);
	logic_out : out std_logic_vector(3 downto 0)

	);

end entity logic_processor;

architecture logic_processor of logic_processor is
begin 
	with pb(3 downto 0) select

		logic_out <= HexA AND HexB when "0001",
					HexA OR HexB when "0010",
					HexA XOR HexB when "0100",
					Hexa NAND HexB when others; --Don't Cares 

end logic_processor;
--LOGIC_PROCESSOR

