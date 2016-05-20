LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY sleep_offset IS
 GENERIC(W : NATURAL := 18);
 PORT (
 is_on : IN BIT;
 increase : IN BIT; -- aumenta ou não o slp
 reset : IN BIT; -- reseta o slp
 q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END sleep_offset;

-----------------------------------------------------------

ARCHITECTURE Behavior OF sleep_offset IS
BEGIN
 PROCESS(increase, reset, is_on)
 BEGIN
  IF ( (reset='1') or (is_on = '0') ) THEN
    q <= (OTHERS => '0');
  ELSIF (increase='1') THEN
    q <= q + 300;
    IF (q = "010101000110000000") THEN
      q <= (OTHERS => '0');
    END IF;
  END IF;
 END PROCESS;
END Behavior;
