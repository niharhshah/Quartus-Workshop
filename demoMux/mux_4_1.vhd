library ieee;
use ieee.std_logic_1164.all;

entity mux_4_1 is
port( i0, i1, i2, i3: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	opt: out std_logic);
end mux_4_1;

architecture a1 of mux_4_1 is
begin
opt <= ((i0 and (not sel(0) and (not sel(1)))) or (i1 and sel(0) and (not sel(1))) or
(i2 and (not sel(0) and sel(1))) or (i3 and sel(0) and sel(1)));
end a1;
