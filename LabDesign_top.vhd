library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity Lab2Design_top is port (
clkin_50		: in std_logic; 
pb				: in std_logic_vector(3 downto 0); 
sw				: in std_logic_vector(7 downto 0); 
led			: out std_logic_vector(7 downto 0); 

seg7_data		: out std_logic_vector(6 downto 0); --DO WE REALL NEED THIS??
seg7_char1		: out std_logic; 
seg7_char2		: out std_logic
); 

end Lab2Design_top; 

architecture difficultCircuit of Lab2Design_top is 


--COMPONENT SevenSegment
component SevenSegment port(
hex		: in std_logic_vector(3 downto 0); 
sevenseg: out std_logic_vector(6 downto 0)
); 
end component; 

--COMPONENT Segment7_mux
component segment7_mux port (
clk 	: in std_logic := '0'; 
DIN2	: in std_logic_vector(6 downto 0); 
DIN1	: in std_logic_vector(6 downto 0); 
DOUT	: out std_logic_vector(6 downto 0); 
DIG2	: out std_logic; 
DIG1	: out std_logic
); 
end component; 


-- COMPONENT new_mux
component new_mux port (
	conc_hex : in std_logic_vector(7 downto 0); -- concatenated 8 bit hex_A and hex_B
	sum: in std_logic_vector(7 downto 0); --8 bit sum from adder
	pb3 : in std_logic_vector(3 downto 0); --control variable
	mux_out : out std_logic_vector(7 downto 0) --8 bit output
	);
end component; 


--COMPONENT adder
component adder port (
	A : in std_logic_vector(3 downto 0);
	B : in std_logic_vector(3 downto 0);
	sum: out std_logic_vector(7 downto 0)
); 
end component; 


--COMPONENT logic_processor
component logic_processor port (
	HexA : in std_logic_vector(3 downto 0);
	HexB : in std_logic_vector(3 downto 0);
	pb : in std_logic_vector(3 downto 0);
	logic_out : out std_logic_vector(3 downto 0)
); 
end component;

--COMPONENT digitsplit 
component digitsplit port (
mux_vector	: in std_logic_vector(7 downto 0); 
tens	: out std_logic_vector(3 downto 0); 
ones	: out std_logic_vector(3 downto 0)
); 
end component;

--COMPONENT leds 
component leds port (
mux : in std_logic_vector (7 downto 0); 
led_out	: out std_logic_vector (7 downto 0)
);
end component; 

--SIGNAL CREATION 
signal seg7_A	: std_logic_vector(6 downto 0); 
signal hex_A	: std_logic_vector(3 downto 0); 
signal seg7_B	: std_logic_vector(6 downto 0); 
signal hex_B	: std_logic_vector(3 downto 0); --tbc 
signal pb_bar	: std_logic_vector(3 downto 0); 
signal sum_adder: std_logic_vector(7 downto 0); 
signal mux_result	: std_logic_vector(7 downto 0); 
signal ten 	: std_logic_vector(3 downto 0); 
signal one	: std_logic_vector(3 downto 0); 
signal logic_result	: std_logic_vector(3 downto 0); 
signal led_muxout	: std_logic_vector(7 downto 0); 


--And so it began.... (the circuit begins) 

begin 

hex_A <= sw(3 downto 0); 
hex_B <= sw(7 downto 4); 
pb_bar <= NOT(pb); 

-- component hookup 

INST1: adder port map (hex_A, hex_B, sum_adder); 
INST2: new_mux port map ((hex_A & hex_B), sum_adder, pb_bar, mux_result); 
INST3: digitsplit port map (mux_result, ten, one); 
INST4: SevenSegment port map (one, seg7_A); 
INST5: SevenSegment port map (ten, seg7_B); 
INST6: segment7_mux port map (clkin_50, seg7_A, seg7_B, seg7_data, seg7_char1, seg7_char2); 
INST7: logic_processor port map (hex_A, hex_B, pb_bar, logic_result); 
INST8: new_mux port map (sum_adder, ("0000" & logic_result), pb_bar, led_muxout);
INST9: leds port map (led_muxout, led); 

end difficultCircuit; 


