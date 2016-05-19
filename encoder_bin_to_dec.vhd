LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY encoder_bin_to_dec IS
PORT( din : IN STD_LOGIC_VECTOR(5 DOWNTO 0); -- DATA IN
      dout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) ); -- DATA OUT
END encoder_bin_to_dec;

-------------------------------------------------------

ARCHITECTURE behavior OF encoder_bin_to_dec IS
BEGIN
dout <= 
"0000000001" when (din="000000") else
"0000000010" when (din="000001") else
"0000000100" when (din="000010") else
"0000001000" when (din="000011") else
"0000010000" when (din="000100") else
"0000100000" when (din="000101") else
"0001000000" when (din="000110") else
"0010000000" when (din="000111") else
"0100000000" when (din="001000") else
"1000000000";
END behavior;