library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Divider is
GENERIC(W : NATURAL := 18);
port(
  X   : in STD_LOGIC_VECTOR(W-1 downto 0);
  Y   : in STD_LOGIC_VECTOR(W-1 downto 0);
  R   : out STD_LOGIC_VECTOR(W-1 downto 0)
);
end Divider;

architecture Behavioral of Divider is
begin
	R <= std_logic_vector( unsigned(X) / unsigned(Y) );
end Behavioral;