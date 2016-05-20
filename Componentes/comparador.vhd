LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY comparador IS
   GENERIC (W : NATURAL := 18);
   PORT (e1, e2: IN STD_LOGIC_VECTOR (W-1 DOWNTO 0);
         saida : OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE estrutura OF comparador IS
BEGIN
     saida <= '1' WHEN (e1 = e2) ELSE '0'; 
END ARCHITECTURE;
