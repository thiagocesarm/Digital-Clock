LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY decoder_dec_to_display IS
PORT( din : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- DATA INPUT
      display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END decoder_dec_to_display;

------------------------------------------------------

ARCHITECTURE behavior OF decoder_dec_to_display IS
BEGIN
display <= 
 "0111111" when (din="0000000001") else
 "0000110" when (din="0000000010") else
 "1011011" when (din="0000000100") else
 "1001111" when (din="0000001000") else
 "1100110" when (din="0000010000") else
 "1101101" when (din="0000100000") else
 "1111101" when (din="0001000000") else
 "0000111" when (din="0010000000") else
 "1111111" when (din="0100000000") else
 "1101111";
END behavior;