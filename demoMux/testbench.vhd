library ieee;  use ieee.std_logic_1164.all ;  use ieee.numeric_std.all ;
entity mux_test is    end mux_test ;
architecture behav of mux_test is
  component mux_4_1 is
  port( i0, i1, i2, i3: in std_logic;
  	sel: in std_logic_vector(1 downto 0);
  	opt: out std_logic);
  end component ;
  signal  mux_out : std_logic ;
  signal inputs : std_logic_vector(3 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  signal count16 : integer := 0 ;  --six bits in0,in1,sel = 2**6 = 64
  signal sim_time : time := 0 ns ;  --start simulation
  constant wait_period : time := 20 ns ; -- time bw two inputs
  constant sim_time_limit : time := 2000 ns ; -- total time must be > (not =) total ip x wait time
  signal wave: std_logic_vector(5 downto 0);
begin
    DUT : mux_4_1 port map ( inputs(0),inputs(1),inputs(2),inputs(3), sel , mux_out ) ;
main_proc : process
begin
  if (sim_time > sim_time_limit) then
    wait;
  else
  wave <=   std_logic_vector( to_unsigned( count16 ,6) ) ;  -- 0 000000 abcdef
  inputs <= wave (5 downto 2);  --abcd
  sel <= wave(1 downto 0);      --ef
  count16 <= count16 + 1;
  if count16 = 64 then
    count16 <= 0;
  end if;
  sim_time <= sim_time + wait_period;
  wait for wait_period;
  end if;
end process;
end behav;
