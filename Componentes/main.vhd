LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY main IS
 GENERIC(W : NATURAL := 18);
 PORT (
 IS_ON : IN BIT; -- Indica se está ligado.
 MODE : IN BIT; -- Aumenta ou não o slp
 UP : IN BIT; -- Incrementa o contador atual
 DOWN : IN BIT; -- Decrementa o contador atual
 SLEEP : IN BIT; -- Botão de soneca
 CLK : IN BIT; -- Clock
 HorasDezenas : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
 HorasUnidades : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
 MinutosDezenas : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
 MinutosUnidades : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
 );
END main;

-----------------------------------------------------------

ARCHITECTURE Behavior OF main IS

COMPONENT comparador IS
   GENERIC (W : NATURAL := 18);
   PORT (e1, e2: IN STD_LOGIC_VECTOR (W-1 DOWNTO 0);
         saida : OUT STD_LOGIC);
END COMPONENT;

COMPONENT counter_18bits IS
 GENERIC(W : NATURAL := 18);
 PORT (
   clk : IN BIT; -- clock
   clrn: IN BIT; -- clear
   ena : IN BIT; -- enable
   q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0)
 );
END COMPONENT;

COMPONENT Divider is
GENERIC(W : NATURAL := 18);
port(
  X   : in STD_LOGIC_VECTOR(W-1 downto 0);
  Y   : in STD_LOGIC_VECTOR(W-1 downto 0);
  R   : out STD_LOGIC_VECTOR(W-1 downto 0)
);
END COMPONENT;

COMPONENT set_clock IS
 GENERIC(W : NATURAL := 18);
 PORT (in_bits : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
 up : IN BIT;
 down: IN BIT;
 out_bits : OUT STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END COMPONENT;

COMPONENT sleep_offset IS
 GENERIC(W : NATURAL := 18);
 PORT (
 increase : IN BIT; -- aumenta ou não o slp
 reset : IN BIT; -- reseta o slp
 q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END COMPONENT;

COMPONENT alarm_counter IS
 GENERIC(W : NATURAL := 18);
 PORT (
 start : IN BIT; -- clear
 kill : BUFFER BIT; -- clock
 q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0));
END COMPONENT;

COMPONENT encoder_bin_to_dec IS
PORT( din : IN STD_LOGIC_VECTOR(17 DOWNTO 0); -- DATA IN
      dout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) ); -- DATA OUT
END COMPONENT;

COMPONENT decoder_dec_to_display IS
PORT( din : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- DATA INPUT
      display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

------------------------------------------------------------
-- SIGNAL IS_OFF : BIT;
SIGNAL TESTOUTPUT : STD_LOGIC_VECTOR(W-1 DOWNTO 0);

BEGIN

  test : counter_18bits
    PORT MAP( CLK, IS_ON, IS_ON, TESTOUTPUT );

END Behavior;
