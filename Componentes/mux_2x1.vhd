LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY mux_2x1 IS
GENERIC (W : NATURAL := 18);

PORT (a, b : IN BIT_VECTOR (W-1 DOWNTO 0);
       sel : IN BIT;
         s : OUT BIT_VECTOR (W-1 DOWNTO 0));
END mux_2x1;

------------------------------------------------

ARCHITECTURE behavior OF mux_2x1 IS
  
BEGIN
  
PROCESS (a, b, sel)
BEGIN
 IF (sel = '0') THEN
   s <= a;
 ELSE
   s <= b;
 END IF;
END PROCESS;

END behavior;
