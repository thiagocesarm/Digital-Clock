LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;


ENTITY alarm_counter IS
 GENERIC(W : NATURAL := 18);
 PORT (
 clk : IN BIT; -- Clock
 start : IN BIT; -- Inicia a contagem
 kill : BUFFER BIT; -- Interrompe a contagem no valor atual
 q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END alarm_counter;

-----------------------------------------------------------

ARCHITECTURE Behavior OF alarm_counter IS
BEGIN
 PROCESS(clk, start, kill, q)
 BEGIN
  IF ( (start='1') ) THEN
    kill <= '0';
    q <= "000000000000001010";
  ELSIF (kill = '0' AND NOT(q = "000000000000000000") AND (clk'EVENT AND clk='1') ) THEN
    q <= q-1;
  END IF;
END PROCESS;
END Behavior;