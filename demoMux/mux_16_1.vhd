library ieee;
use ieee.std_logic_1164.all;

Entity mux_16_1 is 
port( inps: in std_logic_vector(15 downto 0);
	sel : in std_logic_vector(3 downto 0);
	opt: out std_logic);
end mux_16_1;

architecture str of mux_16_1 is
component mux_4_1 is
port( i0, i1, i2, i3: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	opt: out std_logic);
end component; 
signal m0_o, m1_o, m2_0, m3_0: std_logic;

m0: mux_4_1 port map (sel => sel(1 downto 0), i0 => inps(0), i1 => inps(1), i2 => inps(2), i3 => inps(3), opt => m0_o);
m1: mux_4_1 port map (i0 => inps(4), i1 => inps(5), i2 => inps(6), i3 => inps(7), opt => m1_o, sel => sel(1 downto 0),);
m2: mux_4_1 port map (sel => sel(1 downto 0), i0 => inps(8), i1 => inps(9), i2 => inps(10), i3 => inps(11), opt => m0_o);
m3: mux_4_1 port map (sel => sel(1 downto 0), i0 => inps(12), i1 => inps(13), i2 => inps(14), i3 => inps(15), opt => m0_o);
m4: mux_4_1 port map (m0_o, m1_o, m2_o, m3_o, sel(3 downto 2), opt);
end str;
