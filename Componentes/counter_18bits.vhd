LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;


ENTITY counter_18bits IS
 GENERIC(W : NATURAL := 18);
 PORT (
 clk : IN BIT; -- clock
 clrn: IN BIT; -- clear
 ena : IN BIT; -- enable
 q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0)
 );
END counter_18bits;

-----------------------------------------------------------

ARCHITECTURE Behavior OF counter_18bits IS
BEGIN
 PROCESS(clk,clrn)
 BEGIN
  IF (clrn='0') THEN
    q <= (OTHERS => '0');
  ELSIF (clk'EVENT AND clk='1') THEN
    IF (ena='1') THEN
      q <= q+1;
    END IF;
    IF (q = "010101000110000000") THEN
	    q <= (OTHERS => '0');
    END IF;
  END IF;
 END PROCESS;
END Behavior;