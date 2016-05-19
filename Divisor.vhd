library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity DivEx is
port(
    X   : in STD_LOGIC_VECTOR(4 downto 0);
    Y   : in STD_LOGIC_VECTOR(4 downto 0);
    R   : out STD_LOGIC_VECTOR(4 downto 0)
);
end DivEx;

architecture Behavioral of DivEx is
begin
	R <= std_logic_vector( unsigned(X) / unsigned(Y) );
end Behavioral;