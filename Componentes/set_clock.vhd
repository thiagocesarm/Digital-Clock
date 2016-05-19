LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY set_clock IS
 GENERIC(W : NATURAL := 18);
 PORT (in_bits : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
 up : IN BIT;
 down: IN BIT;
 out_bits : OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END set_clock;

-----------------------------------------------------------

ARCHITECTURE arch_1 OF set_clock IS

SIGNAL day_seconds : STD_LOGIC_VECTOR (W-1 DOWNTO 0); -- 86400
SIGNAL sixty : STD_LOGIC_VECTOR (W-1 DOWNTO 0); -- 86400
SIGNAL aux : STD_LOGIC_VECTOR (W-1 DOWNTO 0);
  
BEGIN

day_seconds <= "010101000110000000"; -- 86400
sixty <= "000000000000111100"; -- 60

 PROCESS( in_bits, up, down )
 BEGIN

  IF ( up = '1') THEN
    aux <= in_bits + sixty;
  ELSIF ( down = '1' ) THEN
    aux <= in_bits - sixty; 
  ELSE  
    aux <= in_bits;
  END IF;
  
  IF ( aux = day_seconds ) THEN
    out_bits <= "000000000000000000";
  ELSIF ( aux = "111111111111000100") THEN
    out_bits <= day_seconds - sixty;
  ELSE
    out_bits <= aux;
  END IF;
  
 END PROCESS;
END arch_1;

