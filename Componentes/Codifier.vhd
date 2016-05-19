LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY codifier IS
 GENERIC(W : NATURAL := 18);
 PORT (a : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
 b : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
 hoursDec : OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0);
 hoursUn : OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0);
 minsDec : OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0);
 minsUn : OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END codifier;

ARCHITECTURE Behavior OF codifier IS
SIGNAL sixty : STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL ten : STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL totalMaxSeconds : STD_LOGIC_VECTOR(W-1 DOWNTO 0);

SIGNAL sum : STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL secondsInDay : STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL minutesInDay : STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL hours : STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL mins : STD_LOGIC_VECTOR(W-1 DOWNTO 0);

BEGIN

sixty <= "000000000000111100";
ten <= "000000000000001010";
totalMaxSeconds <= "010101000110000000";

sum <= a + b;

secondsInDay <= STD_LOGIC_VECTOR( unsigned(sum) mod unsigned(totalMaxSeconds) );

minutesInDay <= STD_LOGIC_VECTOR( unsigned(sum) / unsigned(sixty) ); --total/60
hours <= STD_LOGIC_VECTOR( unsigned(minutesInDay) / unsigned(sixty) );
mins <= STD_LOGIC_VECTOR( unsigned(minutesInDay) mod unsigned(sixty) );

hoursDec <= STD_LOGIC_VECTOR( unsigned(hours) / unsigned(ten) );
hoursUn <= STD_LOGIC_VECTOR( unsigned(hours) mod unsigned(ten) );
minsDec <= STD_LOGIC_VECTOR( unsigned(mins) / unsigned(ten) );
minsUn <= STD_LOGIC_VECTOR( unsigned(mins) mod unsigned(ten) );

END Behavior;