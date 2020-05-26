library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity leds is port (
mux : in std_logic_vector (7 downto 0); 
led_out	: out std_logic_vector (7 downto 0)
); 
end entity leds; 

architecture leds of leds is 
begin 
	
led_out(7 downto 0) <= mux(7 downto 0); 

end leds; 