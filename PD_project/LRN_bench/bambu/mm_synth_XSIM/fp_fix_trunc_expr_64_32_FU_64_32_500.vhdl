--------------------------------------------------------------------------------
--                  FP2Fix_11_52_0_31_S_TExponent_difference
--                          (IntAdder_11_f500_uid3)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FP2Fix_11_52_0_31_S_TExponent_difference is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(10 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(10 downto 0)   );
end entity;

architecture arch of FP2Fix_11_52_0_31_S_TExponent_difference is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                       LeftShifter_53_by_max_34_uid10
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LeftShifter_53_by_max_34_uid10 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(52 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(86 downto 0)   );
end entity;

architecture arch of LeftShifter_53_by_max_34_uid10 is
signal level0 :  std_logic_vector(52 downto 0);
signal ps, ps_d1, ps_d2 :  std_logic_vector(5 downto 0);
signal level1 :  std_logic_vector(53 downto 0);
signal level2, level2_d1 :  std_logic_vector(55 downto 0);
signal level3 :  std_logic_vector(59 downto 0);
signal level4 :  std_logic_vector(67 downto 0);
signal level5, level5_d1 :  std_logic_vector(83 downto 0);
signal level6 :  std_logic_vector(115 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            ps_d1 <=  ps;
            ps_d2 <=  ps_d1;
            level2_d1 <=  level2;
            level5_d1 <=  level5;
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<= level0 & (0 downto 0 => '0') when ps(0)= '1' else     (0 downto 0 => '0') & level0;
   level2<= level1 & (1 downto 0 => '0') when ps(1)= '1' else     (1 downto 0 => '0') & level1;
   ----------------Synchro barrier, entering cycle 1----------------
   level3<= level2_d1 & (3 downto 0 => '0') when ps_d1(2)= '1' else     (3 downto 0 => '0') & level2_d1;
   level4<= level3 & (7 downto 0 => '0') when ps_d1(3)= '1' else     (7 downto 0 => '0') & level3;
   level5<= level4 & (15 downto 0 => '0') when ps_d1(4)= '1' else     (15 downto 0 => '0') & level4;
   ----------------Synchro barrier, entering cycle 2----------------
   level6<= level5_d1 & (31 downto 0 => '0') when ps_d2(5)= '1' else     (31 downto 0 => '0') & level5_d1;
   R <= level6(86 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                wrapped_fp_fix_trunc_expr_64_32_FU_64_32_500
--                          (FP2Fix_11_52_0_31_S_T)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Fabrizio Ferrandi (2012)
--------------------------------------------------------------------------------
-- Pipeline depth: 6 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity wrapped_fp_fix_trunc_expr_64_32_FU_64_32_500 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(11+52+2 downto 0);
          O : out  std_logic_vector(31 downto 0)   );
end entity;

architecture arch of wrapped_fp_fix_trunc_expr_64_32_FU_64_32_500 is
   component FP2Fix_11_52_0_31_S_TExponent_difference is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(10 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(10 downto 0)   );
   end component;

   component LeftShifter_53_by_max_34_uid10 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(52 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(86 downto 0)   );
   end component;

signal eA0 :  std_logic_vector(10 downto 0);
signal fA0, fA0_d1 :  std_logic_vector(52 downto 0);
signal bias :  std_logic_vector(10 downto 0);
signal eA1, eA1_d1 :  std_logic_vector(10 downto 0);
signal shiftedby :  std_logic_vector(5 downto 0);
signal fA1 :  std_logic_vector(86 downto 0);
signal fA2, fA2_d1 :  std_logic_vector(31 downto 0);
signal fA4, fA4_d1, fA4_d2 :  std_logic_vector(31 downto 0);
signal overFl0, overFl0_d1 : std_logic;
signal notZeroTest : std_logic;
signal overFl1 : std_logic;
signal eTest, eTest_d1 : std_logic;
signal I_d1, I_d2, I_d3, I_d4, I_d5, I_d6 :  std_logic_vector(11+52+2 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            fA0_d1 <=  fA0;
            eA1_d1 <=  eA1;
            fA2_d1 <=  fA2;
            fA4_d1 <=  fA4;
            fA4_d2 <=  fA4_d1;
            overFl0_d1 <=  overFl0;
            eTest_d1 <=  eTest;
            I_d1 <=  I;
            I_d2 <=  I_d1;
            I_d3 <=  I_d2;
            I_d4 <=  I_d3;
            I_d5 <=  I_d4;
            I_d6 <=  I_d5;
         end if;
      end process;
   eA0 <= I(62 downto 52);
   fA0 <= "1" & I(51 downto 0);
   bias <= not conv_std_logic_vector(1022, 11);
   Exponent_difference: FP2Fix_11_52_0_31_S_TExponent_difference  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => eA1,
                 X => bias,
                 Y => eA0);
   ---------------- cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   shiftedby <= eA1_d1(5 downto 0) when eA1_d1(10) = '0' else (5 downto 0 => '0');
   FXP_shifter: LeftShifter_53_by_max_34_uid10  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => fA1,
                 S => shiftedby,
                 X => fA0_d1);
   ----------------Synchro barrier, entering cycle 3----------------
   fA2<= fA1(84 downto 53);
   ----------------Synchro barrier, entering cycle 4----------------
   fA4<= fA2_d1 when I_d4(63) = '0' else -signed(fA2_d1);
   overFl0<= '1' when I_d4(62 downto 52) > conv_std_logic_vector(1054,11) else I_d4(65);
   ----------------Synchro barrier, entering cycle 5----------------
   notZeroTest <= '1' when fA4_d1 /= conv_std_logic_vector(0,32) else '0';
   overFl1 <= (fA4_d1(31) xor I_d5(63)) and notZeroTest;
   eTest <= (overFl0_d1 or overFl1);
   ----------------Synchro barrier, entering cycle 6----------------
   O <= fA4_d2 when eTest_d1 = '0' else
      I_d6(63) & (30 downto 0 => not I_d6(63));
end architecture;

--------------------------------------------------------------------------------
--                in_wrap_fp_fix_trunc_expr_64_32_FU_64_32_500
--                         (InputIEEE_11_52_to_11_52)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2008)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity in_wrap_fp_fix_trunc_expr_64_32_FU_64_32_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of in_wrap_fp_fix_trunc_expr_64_32_FU_64_32_500 is
signal expX :  std_logic_vector(10 downto 0);
signal fracX :  std_logic_vector(51 downto 0);
signal sX : std_logic;
signal expZero : std_logic;
signal expInfty : std_logic;
signal fracZero : std_logic;
signal reprSubNormal : std_logic;
signal sfracX :  std_logic_vector(51 downto 0);
signal fracR :  std_logic_vector(51 downto 0);
signal expR :  std_logic_vector(10 downto 0);
signal infinity : std_logic;
signal zero : std_logic;
signal NaN : std_logic;
signal exnR :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   expX  <= X(62 downto 52);
   fracX  <= X(51 downto 0);
   sX  <= X(63);
   expZero  <= '1' when expX = (10 downto 0 => '0') else '0';
   expInfty  <= '1' when expX = (10 downto 0 => '1') else '0';
   fracZero <= '1' when fracX = (51 downto 0 => '0') else '0';
   reprSubNormal <= fracX(51);
   -- since we have one more exponent value than IEEE (field 0...0, value emin-1),
   -- we can represent subnormal numbers whose mantissa field begins with a 1
   sfracX <= fracX(50 downto 0) & '0' when (expZero='1' and reprSubNormal='1')    else fracX;
   fracR <= sfracX;
   -- copy exponent. This will be OK even for subnormals, zero and infty since in such cases the exn bits will prevail
   expR <= expX;
   infinity <= expInfty and fracZero;
   zero <= expZero and not reprSubNormal;
   NaN <= expInfty and not fracZero;
   exnR <= 
           "00" when zero='1' 
      else "10" when infinity='1' 
      else "11" when NaN='1' 
      else "01" ;  -- normal number
   R <= exnR & sX & expR & fracR; 
end architecture;

--------------------------------------------------------------------------------
--                              fp_fix_trunc_expr_64_32_FU_64_32_500
-- Operator automatically generated by FloPoCo framework version svn-trunk
-- assemblying operators generated by the Infinite Virtual Library FloPoCoLib
-- Send any bug to: BUG_REPORT_ADDRESS
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fp_fix_trunc_expr_64_32_FU_64_32_500 is
   generic(BITSIZE_I: integer := 64; BITSIZE_O: integer := 32);
   port (
      I : in std_logic_vector(BITSIZE_I-1 downto 0);
      clock : in std_logic;
      reset : in std_logic;
      O : out signed(BITSIZE_O-1 downto 0)
      
   );
end entity;

architecture arch of fp_fix_trunc_expr_64_32_FU_64_32_500 is
   component wrapped_fp_fix_trunc_expr_64_32_FU_64_32_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         I : in std_logic_vector(65 downto 0);
         O : out std_logic_vector(31 downto 0)
         
      );
   end component;
   component in_wrap_fp_fix_trunc_expr_64_32_FU_64_32_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         X : in std_logic_vector(63 downto 0);
         R : out std_logic_vector(65 downto 0)
         
      );
   end component;
   signal wireIn1 : std_logic_vector(65 downto 0);
   signal wireOut1 : std_logic_vector(31 downto 0);
   begin
      O <= signed(wireOut1);
      fu : wrapped_fp_fix_trunc_expr_64_32_FU_64_32_500 port map (I => wireIn1, O => wireOut1, clk=> clock, rst=> reset);
      in1 : in_wrap_fp_fix_trunc_expr_64_32_FU_64_32_500 port map (X=>I, R=>wireIn1, clk=> clock, rst=> reset);
end architecture;

