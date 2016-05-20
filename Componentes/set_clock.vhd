LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY offset_mem IS
 GENERIC(W : NATURAL := 18);
 PORT (
   is_on : IN BIT;
   up : IN BIT;
   down: IN BIT;
   q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0)
 );
END offset_mem;

-----------------------------------------------------------

ARCHITECTURE Behavior OF offset_mem IS

SIGNAL day_seconds : STD_LOGIC_VECTOR (W-1 DOWNTO 0); -- 86400
SIGNAL sixty : STD_LOGIC_VECTOR (W-1 DOWNTO 0); -- 86400
  
BEGIN

day_seconds <= "010101000110000000"; -- 86400
sixty <= "000000000000111100"; -- 60

 PROCESS( is_on, up, down )
 BEGIN
  IF ( is_on = '0' ) THEN
    q <= (OTHERS => '0');
  ELSIF ( up = '1') THEN
    q <= q + sixty;
  ELSIF ( down = '1' ) THEN
    q <= q - sixty; 
  END IF;
  
  IF ( q = day_seconds ) THEN
    q <= "000000000000000000";
  ELSIF ( q = "111111111111000100") THEN
    q <= day_seconds - sixty;
  END IF;
  
 END PROCESS;
END Behavior;

