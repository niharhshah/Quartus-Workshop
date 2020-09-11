Library IEEE;
use IEEE.std_logic_1164.all;

entity Exor is
  port (
  A,B : IN std_logic;
  Y: OUT std_logic
  );
end entity;

architecture xor1 of Exor is

begin
Y <= A XOR B;
end architecture;
