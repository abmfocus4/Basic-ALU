library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--NEW_MUX
entity new_mux is port

	(
	conc_hex : in std_logic_vector(7 downto 0); -- concatenated 8 bit hex_A and hex_B
	sum: in std_logic_vector(7 downto 0); --8 bit sum from adder
	pb3 : in std_logic_vector(3 downto 0); --control variable
	mux_out : out std_logic_vector(7 downto 0) --8 bit output
	);

end entity new_mux;

architecture new_mux of new_mux is
begin 
	with pb3(3 downto 0) select

		mux_out <= sum when "1000",
					  conc_hex when others; 

end new_mux;
--NEW_MUX