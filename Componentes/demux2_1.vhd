LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY demux_2x1 IS

PORT (
  s : IN BIT;
  sel : IN BIT;
  a, b : OUT BIT
);
         
END demux_2x1;

------------------------------------------------

ARCHITECTURE behavior OF demux_2x1 IS
  
BEGIN
  
PROCESS (s, sel)
BEGIN
 IF (sel = '0') THEN
   a <= s;
 ELSE
   b <= s;
 END IF;
END PROCESS;

END behavior;

