--------------------------------------------------------------------------------
--                          IntAdder_66_f500_uid261
--                    (IntAdderAlternative_66_f500_uid265)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_66_f500_uid261 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(65 downto 0);
          Y : in  std_logic_vector(65 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(65 downto 0)   );
end entity;

architecture arch of IntAdder_66_f500_uid261 is
signal s_sum_l0_idx0 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx3, s_sum_l0_idx3_d1, s_sum_l0_idx3_d2, s_sum_l0_idx3_d3 :  std_logic_vector(6 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2, sum_l0_idx0_d3 :  std_logic_vector(19 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(19 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(19 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal sum_l0_idx3 :  std_logic_vector(5 downto 0);
signal c_l0_idx3 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(20 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1, sum_l1_idx1_d2 :  std_logic_vector(19 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(20 downto 0);
signal sum_l2_idx2, sum_l2_idx2_d1 :  std_logic_vector(19 downto 0);
signal c_l2_idx2, c_l2_idx2_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l3_idx3 :  std_logic_vector(6 downto 0);
signal sum_l3_idx3 :  std_logic_vector(5 downto 0);
signal c_l3_idx3 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            s_sum_l0_idx3_d1 <=  s_sum_l0_idx3;
            s_sum_l0_idx3_d2 <=  s_sum_l0_idx3_d1;
            s_sum_l0_idx3_d3 <=  s_sum_l0_idx3_d2;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            sum_l0_idx0_d3 <=  sum_l0_idx0_d2;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            sum_l1_idx1_d2 <=  sum_l1_idx1_d1;
            c_l1_idx1_d1 <=  c_l1_idx1;
            sum_l2_idx2_d1 <=  sum_l2_idx2;
            c_l2_idx2_d1 <=  c_l2_idx2;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(19 downto 0)) + ( "0" & Y(19 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(39 downto 20)) + ( "0" & Y(39 downto 20));
   s_sum_l0_idx2 <= ( "0" & X(59 downto 40)) + ( "0" & Y(59 downto 40));
   s_sum_l0_idx3 <= ( "0" & X(65 downto 60)) + ( "0" & Y(65 downto 60));
   sum_l0_idx0 <= s_sum_l0_idx0(19 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(20 downto 20);
   sum_l0_idx1 <= s_sum_l0_idx1(19 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(20 downto 20);
   sum_l0_idx2 <= s_sum_l0_idx2(19 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(20 downto 20);
   sum_l0_idx3 <= s_sum_l0_idx3(5 downto 0);
   c_l0_idx3 <= s_sum_l0_idx3(6 downto 6);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(19 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(20 downto 20);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(19 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(20 downto 20);
   ----------------Synchro barrier, entering cycle 3----------------
   s_sum_l3_idx3 <=  s_sum_l0_idx3_d3 + c_l2_idx2_d1(0 downto 0);
   sum_l3_idx3 <= s_sum_l3_idx3(5 downto 0);
   c_l3_idx3 <= s_sum_l3_idx3(6 downto 6);
   R <= sum_l3_idx3(5 downto 0) & sum_l2_idx2_d1(19 downto 0) & sum_l1_idx1_d2(19 downto 0) & sum_l0_idx0_d3(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                     FPAdder_11_52_uid259_RightShifter
--                     (RightShifter_53_by_max_55_uid268)
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

entity FPAdder_11_52_uid259_RightShifter is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(52 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(107 downto 0)   );
end entity;

architecture arch of FPAdder_11_52_uid259_RightShifter is
signal level0, level0_d1 :  std_logic_vector(52 downto 0);
signal ps, ps_d1, ps_d2 :  std_logic_vector(5 downto 0);
signal level1 :  std_logic_vector(53 downto 0);
signal level2 :  std_logic_vector(55 downto 0);
signal level3, level3_d1 :  std_logic_vector(59 downto 0);
signal level4 :  std_logic_vector(67 downto 0);
signal level5 :  std_logic_vector(83 downto 0);
signal level6 :  std_logic_vector(115 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            level0_d1 <=  level0;
            ps_d1 <=  ps;
            ps_d2 <=  ps_d1;
            level3_d1 <=  level3;
         end if;
      end process;
   level0<= X;
   ps<= S;
   ----------------Synchro barrier, entering cycle 1----------------
   level1<=  (0 downto 0 => '0') & level0_d1 when ps_d1(0) = '1' else    level0_d1 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps_d1(1) = '1' else    level1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps_d1(2) = '1' else    level2 & (3 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 2----------------
   level4<=  (7 downto 0 => '0') & level3_d1 when ps_d2(3) = '1' else    level3_d1 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps_d2(4) = '1' else    level4 & (15 downto 0 => '0');
   level6<=  (31 downto 0 => '0') & level5 when ps_d2(5) = '1' else    level5 & (31 downto 0 => '0');
   R <= level6(115 downto 8);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_56_f500_uid271
--                     (IntAdderClassical_56_f500_uid273)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_56_f500_uid271 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(55 downto 0);
          Y : in  std_logic_vector(55 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(55 downto 0)   );
end entity;

architecture arch of IntAdder_56_f500_uid271 is
signal x0 :  std_logic_vector(19 downto 0);
signal y0 :  std_logic_vector(19 downto 0);
signal x1, x1_d1 :  std_logic_vector(19 downto 0);
signal y1, y1_d1 :  std_logic_vector(19 downto 0);
signal x2, x2_d1, x2_d2 :  std_logic_vector(15 downto 0);
signal y2, y2_d1, y2_d2 :  std_logic_vector(15 downto 0);
signal sum0, sum0_d1, sum0_d2 :  std_logic_vector(20 downto 0);
signal sum1, sum1_d1 :  std_logic_vector(20 downto 0);
signal sum2 :  std_logic_vector(16 downto 0);
signal X_d1 :  std_logic_vector(55 downto 0);
signal Y_d1 :  std_logic_vector(55 downto 0);
signal Cin_d1 : std_logic;
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            x1_d1 <=  x1;
            y1_d1 <=  y1;
            x2_d1 <=  x2;
            x2_d2 <=  x2_d1;
            y2_d1 <=  y2;
            y2_d2 <=  y2_d1;
            sum0_d1 <=  sum0;
            sum0_d2 <=  sum0_d1;
            sum1_d1 <=  sum1;
            X_d1 <=  X;
            Y_d1 <=  Y;
            Cin_d1 <=  Cin;
         end if;
      end process;
   --Classical
   ----------------Synchro barrier, entering cycle 1----------------
   x0 <= X_d1(19 downto 0);
   y0 <= Y_d1(19 downto 0);
   x1 <= X_d1(39 downto 20);
   y1 <= Y_d1(39 downto 20);
   x2 <= X_d1(55 downto 40);
   y2 <= Y_d1(55 downto 40);
   sum0 <= ( "0" & x0) + ( "0" & y0)  + Cin_d1;
   ----------------Synchro barrier, entering cycle 2----------------
   sum1 <= ( "0" & x1_d1) + ( "0" & y1_d1)  + sum0_d1(20);
   ----------------Synchro barrier, entering cycle 3----------------
   sum2 <= ( "0" & x2_d2) + ( "0" & y2_d2)  + sum1_d1(20);
   R <= sum2(15 downto 0) & sum1_d1(19 downto 0) & sum0_d2(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                   LZCShifter_57_to_57_counting_64_uid278
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 6 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_57_to_57_counting_64_uid278 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(56 downto 0);
          Count : out  std_logic_vector(5 downto 0);
          O : out  std_logic_vector(56 downto 0)   );
end entity;

architecture arch of LZCShifter_57_to_57_counting_64_uid278 is
signal level6, level6_d1 :  std_logic_vector(56 downto 0);
signal count5, count5_d1, count5_d2, count5_d3, count5_d4, count5_d5 : std_logic;
signal level5, level5_d1 :  std_logic_vector(56 downto 0);
signal count4, count4_d1, count4_d2, count4_d3, count4_d4 : std_logic;
signal level4, level4_d1 :  std_logic_vector(56 downto 0);
signal count3, count3_d1, count3_d2, count3_d3 : std_logic;
signal level3, level3_d1 :  std_logic_vector(56 downto 0);
signal count2, count2_d1, count2_d2 : std_logic;
signal level2, level2_d1 :  std_logic_vector(56 downto 0);
signal count1, count1_d1 : std_logic;
signal level1, level1_d1 :  std_logic_vector(56 downto 0);
signal count0 : std_logic;
signal level0 :  std_logic_vector(56 downto 0);
signal sCount :  std_logic_vector(5 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            level6_d1 <=  level6;
            count5_d1 <=  count5;
            count5_d2 <=  count5_d1;
            count5_d3 <=  count5_d2;
            count5_d4 <=  count5_d3;
            count5_d5 <=  count5_d4;
            level5_d1 <=  level5;
            count4_d1 <=  count4;
            count4_d2 <=  count4_d1;
            count4_d3 <=  count4_d2;
            count4_d4 <=  count4_d3;
            level4_d1 <=  level4;
            count3_d1 <=  count3;
            count3_d2 <=  count3_d1;
            count3_d3 <=  count3_d2;
            level3_d1 <=  level3;
            count2_d1 <=  count2;
            count2_d2 <=  count2_d1;
            level2_d1 <=  level2;
            count1_d1 <=  count1;
            level1_d1 <=  level1;
         end if;
      end process;
   level6 <= I ;
   ----------------Synchro barrier, entering cycle 1----------------
   count5<= '1' when level6_d1(56 downto 25) = (56 downto 25=>'0') else '0';
   level5<= level6_d1(56 downto 0) when count5='0' else level6_d1(24 downto 0) & (31 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 2----------------
   count4<= '1' when level5_d1(56 downto 41) = (56 downto 41=>'0') else '0';
   level4<= level5_d1(56 downto 0) when count4='0' else level5_d1(40 downto 0) & (15 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 3----------------
   count3<= '1' when level4_d1(56 downto 49) = (56 downto 49=>'0') else '0';
   level3<= level4_d1(56 downto 0) when count3='0' else level4_d1(48 downto 0) & (7 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 4----------------
   count2<= '1' when level3_d1(56 downto 53) = (56 downto 53=>'0') else '0';
   level2<= level3_d1(56 downto 0) when count2='0' else level3_d1(52 downto 0) & (3 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 5----------------
   count1<= '1' when level2_d1(56 downto 55) = (56 downto 55=>'0') else '0';
   level1<= level2_d1(56 downto 0) when count1='0' else level2_d1(54 downto 0) & (1 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 6----------------
   count0<= '1' when level1_d1(56 downto 56) = (56 downto 56=>'0') else '0';
   level0<= level1_d1(56 downto 0) when count0='0' else level1_d1(55 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count5_d5 & count4_d4 & count3_d3 & count2_d2 & count1_d1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_66_f500_uid281
--                     (IntAdderClassical_66_f500_uid283)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 4 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_66_f500_uid281 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(65 downto 0);
          Y : in  std_logic_vector(65 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(65 downto 0)   );
end entity;

architecture arch of IntAdder_66_f500_uid281 is
signal x0 :  std_logic_vector(19 downto 0);
signal y0 :  std_logic_vector(19 downto 0);
signal x1, x1_d1 :  std_logic_vector(19 downto 0);
signal y1, y1_d1 :  std_logic_vector(19 downto 0);
signal x2, x2_d1, x2_d2 :  std_logic_vector(19 downto 0);
signal y2, y2_d1, y2_d2 :  std_logic_vector(19 downto 0);
signal x3, x3_d1, x3_d2, x3_d3 :  std_logic_vector(5 downto 0);
signal y3, y3_d1, y3_d2, y3_d3 :  std_logic_vector(5 downto 0);
signal sum0, sum0_d1, sum0_d2, sum0_d3 :  std_logic_vector(20 downto 0);
signal sum1, sum1_d1, sum1_d2 :  std_logic_vector(20 downto 0);
signal sum2, sum2_d1 :  std_logic_vector(20 downto 0);
signal sum3 :  std_logic_vector(6 downto 0);
signal X_d1 :  std_logic_vector(65 downto 0);
signal Y_d1 :  std_logic_vector(65 downto 0);
signal Cin_d1 : std_logic;
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            x1_d1 <=  x1;
            y1_d1 <=  y1;
            x2_d1 <=  x2;
            x2_d2 <=  x2_d1;
            y2_d1 <=  y2;
            y2_d2 <=  y2_d1;
            x3_d1 <=  x3;
            x3_d2 <=  x3_d1;
            x3_d3 <=  x3_d2;
            y3_d1 <=  y3;
            y3_d2 <=  y3_d1;
            y3_d3 <=  y3_d2;
            sum0_d1 <=  sum0;
            sum0_d2 <=  sum0_d1;
            sum0_d3 <=  sum0_d2;
            sum1_d1 <=  sum1;
            sum1_d2 <=  sum1_d1;
            sum2_d1 <=  sum2;
            X_d1 <=  X;
            Y_d1 <=  Y;
            Cin_d1 <=  Cin;
         end if;
      end process;
   --Classical
   ----------------Synchro barrier, entering cycle 1----------------
   x0 <= X_d1(19 downto 0);
   y0 <= Y_d1(19 downto 0);
   x1 <= X_d1(39 downto 20);
   y1 <= Y_d1(39 downto 20);
   x2 <= X_d1(59 downto 40);
   y2 <= Y_d1(59 downto 40);
   x3 <= X_d1(65 downto 60);
   y3 <= Y_d1(65 downto 60);
   sum0 <= ( "0" & x0) + ( "0" & y0)  + Cin_d1;
   ----------------Synchro barrier, entering cycle 2----------------
   sum1 <= ( "0" & x1_d1) + ( "0" & y1_d1)  + sum0_d1(20);
   ----------------Synchro barrier, entering cycle 3----------------
   sum2 <= ( "0" & x2_d2) + ( "0" & y2_d2)  + sum1_d1(20);
   ----------------Synchro barrier, entering cycle 4----------------
   sum3 <= ( "0" & x3_d3) + ( "0" & y3_d3)  + sum2_d1(20);
   R <= sum3(5 downto 0) & sum2_d1(19 downto 0) & sum1_d2(19 downto 0) & sum0_d3(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                     wrapped_fp_plus_expr_FU_64_64_500
--                           (FPAdder_11_52_uid259)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 22 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity wrapped_fp_plus_expr_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          Y : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of wrapped_fp_plus_expr_FU_64_64_500 is
   component FPAdder_11_52_uid259_RightShifter is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(52 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(107 downto 0)   );
   end component;

   component IntAdder_56_f500_uid271 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(55 downto 0);
             Y : in  std_logic_vector(55 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(55 downto 0)   );
   end component;

   component IntAdder_66_f500_uid261 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(65 downto 0);
             Y : in  std_logic_vector(65 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(65 downto 0)   );
   end component;

   component IntAdder_66_f500_uid281 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(65 downto 0);
             Y : in  std_logic_vector(65 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(65 downto 0)   );
   end component;

   component LZCShifter_57_to_57_counting_64_uid278 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(56 downto 0);
             Count : out  std_logic_vector(5 downto 0);
             O : out  std_logic_vector(56 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(64 downto 0);
signal excExpFracY :  std_logic_vector(64 downto 0);
signal eXmeY, eXmeY_d1, eXmeY_d2, eXmeY_d3 :  std_logic_vector(11 downto 0);
signal eYmeX, eYmeX_d1, eYmeX_d2, eYmeX_d3 :  std_logic_vector(11 downto 0);
signal addCmpOp1 :  std_logic_vector(65 downto 0);
signal addCmpOp2 :  std_logic_vector(65 downto 0);
signal cmpRes :  std_logic_vector(65 downto 0);
signal swap : std_logic;
signal newX, newX_d1, newX_d2, newX_d3, newX_d4 :  std_logic_vector(65 downto 0);
signal newY, newY_d1 :  std_logic_vector(65 downto 0);
signal expX, expX_d1, expX_d2, expX_d3, expX_d4, expX_d5, expX_d6, expX_d7 :  std_logic_vector(10 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY, excY_d1 :  std_logic_vector(1 downto 0);
signal signX, signX_d1, signX_d2 : std_logic;
signal signY : std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6, EffSub_d7, EffSub_d8, EffSub_d9, EffSub_d10, EffSub_d11, EffSub_d12, EffSub_d13, EffSub_d14, EffSub_d15, EffSub_d16, EffSub_d17, EffSub_d18, EffSub_d19 : std_logic;
signal sXsYExnXY, sXsYExnXY_d1, sXsYExnXY_d2 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(52 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6, excRt_d7, excRt_d8, excRt_d9, excRt_d10, excRt_d11, excRt_d12, excRt_d13, excRt_d14, excRt_d15, excRt_d16, excRt_d17 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5, signR_d6, signR_d7, signR_d8, signR_d9, signR_d10, signR_d11, signR_d12, signR_d13, signR_d14, signR_d15, signR_d16, signR_d17 : std_logic;
signal expDiff, expDiff_d1 :  std_logic_vector(11 downto 0);
signal shiftedOut, shiftedOut_d1 : std_logic;
signal shiftVal :  std_logic_vector(5 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(107 downto 0);
signal sticky, sticky_d1, sticky_d2, sticky_d3 : std_logic;
signal fracYfar :  std_logic_vector(55 downto 0);
signal EffSubVector :  std_logic_vector(55 downto 0);
signal fracYfarXorOp :  std_logic_vector(55 downto 0);
signal fracXfar :  std_logic_vector(55 downto 0);
signal cInAddFar : std_logic;
signal fracAddResult :  std_logic_vector(55 downto 0);
signal fracGRS :  std_logic_vector(56 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3, extendedExpInc_d4, extendedExpInc_d5, extendedExpInc_d6, extendedExpInc_d7 :  std_logic_vector(12 downto 0);
signal nZerosNew, nZerosNew_d1 :  std_logic_vector(5 downto 0);
signal shiftedFrac, shiftedFrac_d1 :  std_logic_vector(56 downto 0);
signal updatedExp :  std_logic_vector(12 downto 0);
signal eqdiffsign, eqdiffsign_d1, eqdiffsign_d2, eqdiffsign_d3, eqdiffsign_d4, eqdiffsign_d5 : std_logic;
signal expFrac :  std_logic_vector(65 downto 0);
signal stk : std_logic;
signal rnd : std_logic;
signal grd : std_logic;
signal lsb : std_logic;
signal addToRoundBit : std_logic;
signal RoundedExpFrac :  std_logic_vector(65 downto 0);
signal upExc :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(51 downto 0);
signal expR, expR_d1 :  std_logic_vector(10 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2, excRt2_d1 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 : std_logic;
signal computedR :  std_logic_vector(65 downto 0);
signal X_d1, X_d2, X_d3 :  std_logic_vector(11+52+2 downto 0);
signal Y_d1, Y_d2, Y_d3 :  std_logic_vector(11+52+2 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            eXmeY_d1 <=  eXmeY;
            eXmeY_d2 <=  eXmeY_d1;
            eXmeY_d3 <=  eXmeY_d2;
            eYmeX_d1 <=  eYmeX;
            eYmeX_d2 <=  eYmeX_d1;
            eYmeX_d3 <=  eYmeX_d2;
            newX_d1 <=  newX;
            newX_d2 <=  newX_d1;
            newX_d3 <=  newX_d2;
            newX_d4 <=  newX_d3;
            newY_d1 <=  newY;
            expX_d1 <=  expX;
            expX_d2 <=  expX_d1;
            expX_d3 <=  expX_d2;
            expX_d4 <=  expX_d3;
            expX_d5 <=  expX_d4;
            expX_d6 <=  expX_d5;
            expX_d7 <=  expX_d6;
            excY_d1 <=  excY;
            signX_d1 <=  signX;
            signX_d2 <=  signX_d1;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            EffSub_d3 <=  EffSub_d2;
            EffSub_d4 <=  EffSub_d3;
            EffSub_d5 <=  EffSub_d4;
            EffSub_d6 <=  EffSub_d5;
            EffSub_d7 <=  EffSub_d6;
            EffSub_d8 <=  EffSub_d7;
            EffSub_d9 <=  EffSub_d8;
            EffSub_d10 <=  EffSub_d9;
            EffSub_d11 <=  EffSub_d10;
            EffSub_d12 <=  EffSub_d11;
            EffSub_d13 <=  EffSub_d12;
            EffSub_d14 <=  EffSub_d13;
            EffSub_d15 <=  EffSub_d14;
            EffSub_d16 <=  EffSub_d15;
            EffSub_d17 <=  EffSub_d16;
            EffSub_d18 <=  EffSub_d17;
            EffSub_d19 <=  EffSub_d18;
            sXsYExnXY_d1 <=  sXsYExnXY;
            sXsYExnXY_d2 <=  sXsYExnXY_d1;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            excRt_d3 <=  excRt_d2;
            excRt_d4 <=  excRt_d3;
            excRt_d5 <=  excRt_d4;
            excRt_d6 <=  excRt_d5;
            excRt_d7 <=  excRt_d6;
            excRt_d8 <=  excRt_d7;
            excRt_d9 <=  excRt_d8;
            excRt_d10 <=  excRt_d9;
            excRt_d11 <=  excRt_d10;
            excRt_d12 <=  excRt_d11;
            excRt_d13 <=  excRt_d12;
            excRt_d14 <=  excRt_d13;
            excRt_d15 <=  excRt_d14;
            excRt_d16 <=  excRt_d15;
            excRt_d17 <=  excRt_d16;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            signR_d3 <=  signR_d2;
            signR_d4 <=  signR_d3;
            signR_d5 <=  signR_d4;
            signR_d6 <=  signR_d5;
            signR_d7 <=  signR_d6;
            signR_d8 <=  signR_d7;
            signR_d9 <=  signR_d8;
            signR_d10 <=  signR_d9;
            signR_d11 <=  signR_d10;
            signR_d12 <=  signR_d11;
            signR_d13 <=  signR_d12;
            signR_d14 <=  signR_d13;
            signR_d15 <=  signR_d14;
            signR_d16 <=  signR_d15;
            signR_d17 <=  signR_d16;
            expDiff_d1 <=  expDiff;
            shiftedOut_d1 <=  shiftedOut;
            shiftedFracY_d1 <=  shiftedFracY;
            sticky_d1 <=  sticky;
            sticky_d2 <=  sticky_d1;
            sticky_d3 <=  sticky_d2;
            extendedExpInc_d1 <=  extendedExpInc;
            extendedExpInc_d2 <=  extendedExpInc_d1;
            extendedExpInc_d3 <=  extendedExpInc_d2;
            extendedExpInc_d4 <=  extendedExpInc_d3;
            extendedExpInc_d5 <=  extendedExpInc_d4;
            extendedExpInc_d6 <=  extendedExpInc_d5;
            extendedExpInc_d7 <=  extendedExpInc_d6;
            nZerosNew_d1 <=  nZerosNew;
            shiftedFrac_d1 <=  shiftedFrac;
            eqdiffsign_d1 <=  eqdiffsign;
            eqdiffsign_d2 <=  eqdiffsign_d1;
            eqdiffsign_d3 <=  eqdiffsign_d2;
            eqdiffsign_d4 <=  eqdiffsign_d3;
            eqdiffsign_d5 <=  eqdiffsign_d4;
            fracR_d1 <=  fracR;
            expR_d1 <=  expR;
            excRt2_d1 <=  excRt2;
            X_d1 <=  X;
            X_d2 <=  X_d1;
            X_d3 <=  X_d2;
            Y_d1 <=  Y;
            Y_d2 <=  Y_d1;
            Y_d3 <=  Y_d2;
         end if;
      end process;
-- Exponent difference and swap  --
   excExpFracX <= X(65 downto 64) & X(62 downto 0);
   excExpFracY <= Y(65 downto 64) & Y(62 downto 0);
   eXmeY <= ("0" & X(62 downto 52)) - ("0" & Y(62 downto 52));
   eYmeX <= ("0" & Y(62 downto 52)) - ("0" & X(62 downto 52));
   addCmpOp1<= "0" & excExpFracX;
   addCmpOp2<= "1" & not(excExpFracY);
   cmpAdder: IntAdder_66_f500_uid261  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => cmpRes,
                 X => addCmpOp1,
                 Y => addCmpOp2);

   ----------------Synchro barrier, entering cycle 3----------------
   swap <= cmpRes(65);
   newX <= X_d3     when swap = '0' else Y_d3;
   newY <= Y_d3     when swap = '0' else X_d3;
   expX<= newX(62 downto 52);
   excX<= newX(65 downto 64);
   excY<= newY(65 downto 64);
   signX<= newX(63);
   signY<= newY(63);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   ----------------Synchro barrier, entering cycle 4----------------
   fracY <= "00000000000000000000000000000000000000000000000000000" when excY_d1="00" else ('1' & newY_d1(51 downto 0));
   with sXsYExnXY_d1 select 
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   ----------------Synchro barrier, entering cycle 5----------------
   signR<= '0' when (sXsYExnXY_d2="100000" or sXsYExnXY_d2="010000") else signX_d2;
   ---------------- cycle 3----------------
   expDiff <= eXmeY_d3 when swap = '0' else eYmeX_d3;
   shiftedOut <= '1' when (expDiff >= 54) else '0';
   ----------------Synchro barrier, entering cycle 4----------------
   shiftVal <= expDiff_d1(5 downto 0) when shiftedOut_d1='0' else CONV_STD_LOGIC_VECTOR(55,6) ;
   RightShifterComponent: FPAdder_11_52_uid259_RightShifter  -- pipelineDepth=2 maxInDelay=5.3072e-10
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 6----------------
   ----------------Synchro barrier, entering cycle 7----------------
   sticky <= '0' when (shiftedFracY_d1(52 downto 0)=CONV_STD_LOGIC_VECTOR(0,52)) else '1';
   ---------------- cycle 6----------------
   ----------------Synchro barrier, entering cycle 7----------------
   fracYfar <= "0" & shiftedFracY_d1(107 downto 53);
   EffSubVector <= (55 downto 0 => EffSub_d4);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d4(51 downto 0)) & "00";
   cInAddFar <= EffSub_d4 and not sticky;
   fracAdder: IntAdder_56_f500_uid271  -- pipelineDepth=3 maxInDelay=1.57344e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   ----------------Synchro barrier, entering cycle 10----------------
   fracGRS<= fracAddResult & sticky_d3; 
   extendedExpInc<= ("00" & expX_d7) + '1';
   LZC_component: LZCShifter_57_to_57_counting_64_uid278  -- pipelineDepth=6 maxInDelay=1.036e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 16----------------
   ----------------Synchro barrier, entering cycle 17----------------
   updatedExp <= extendedExpInc_d7 - ("0000000" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew_d1="111111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(55 downto 3);
   ---------------- cycle 16----------------
   ----------------Synchro barrier, entering cycle 17----------------
   stk<= shiftedFrac_d1(1) or shiftedFrac_d1(0);
   rnd<= shiftedFrac_d1(2);
   grd<= shiftedFrac_d1(3);
   lsb<= shiftedFrac_d1(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   roundingAdder: IntAdder_66_f500_uid281  -- pipelineDepth=4 maxInDelay=1.41172e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "000000000000000000000000000000000000000000000000000000000000000000");
   ---------------- cycle 21----------------
   upExc <= RoundedExpFrac(65 downto 64);
   fracR <= RoundedExpFrac(52 downto 1);
   expR <= RoundedExpFrac(63 downto 53);
   exExpExc <= upExc & excRt_d17;
   with (exExpExc) select 
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   ----------------Synchro barrier, entering cycle 22----------------
   excR <= "00" when (eqdiffsign_d5='1' and EffSub_d19='1') else excRt2_d1;
   signR2 <= '0' when (eqdiffsign_d5='1' and EffSub_d19='1') else signR_d17;
   computedR <= excR & signR2 & expR_d1 & fracR_d1;
   R <= computedR;
end architecture;

--------------------------------------------------------------------------------
--                     in_wrap_fp_plus_expr_FU_64_64_500
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

entity in_wrap_fp_plus_expr_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of in_wrap_fp_plus_expr_FU_64_64_500 is
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
--                     out_wrap_fp_plus_expr_FU_64_64_500
--                        (OutputIEEE_11_52_to_11_52)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: F. Ferrandi  (2009-2012)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity out_wrap_fp_plus_expr_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of out_wrap_fp_plus_expr_FU_64_64_500 is
signal expX :  std_logic_vector(10 downto 0);
signal fracX :  std_logic_vector(51 downto 0);
signal exnX :  std_logic_vector(1 downto 0);
signal sX : std_logic;
signal expZero : std_logic;
signal sfracX :  std_logic_vector(51 downto 0);
signal fracR :  std_logic_vector(51 downto 0);
signal expR :  std_logic_vector(10 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   expX  <= X(62 downto 52);
   fracX  <= X(51 downto 0);
   exnX  <= X(65 downto 64);
   sX  <= X(63) when (exnX = "01" or exnX = "10") else '0';
   expZero  <= '1' when expX = (10 downto 0 => '0') else '0';
   -- since we have one more exponent value than IEEE (field 0...0, value emin-1),
   -- we can represent subnormal numbers whose mantissa field begins with a 1
   sfracX <= 
      (51 downto 0 => '0') when (exnX = "00") else
      '1' & fracX(51 downto 1) when (expZero = '1' and exnX = "01") else
      fracX when (exnX = "01") else 
      (51 downto 1 => '0') & exnX(0);
   fracR <= sfracX;
   expR <=  
      (10 downto 0 => '0') when (exnX = "00") else
      expX when (exnX = "01") else 
      (10 downto 0 => '1');
   R <= sX & expR & fracR; 
end architecture;

--------------------------------------------------------------------------------
--                              fp_plus_expr_FU_64_64_500
-- Operator automatically generated by FloPoCo framework version svn-trunk
-- assemblying operators generated by the Infinite Virtual Library FloPoCoLib
-- Send any bug to: BUG_REPORT_ADDRESS
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fp_plus_expr_FU_64_64_500 is
   generic(BITSIZE_X: integer := 64; BITSIZE_Y: integer := 64; BITSIZE_R: integer := 64);
   port (
      X : in std_logic_vector(BITSIZE_X-1 downto 0);
      Y : in std_logic_vector(BITSIZE_Y-1 downto 0);
      clock : in std_logic;
      reset : in std_logic;
      R : out std_logic_vector(BITSIZE_R-1 downto 0)
      
   );
end entity;

architecture arch of fp_plus_expr_FU_64_64_500 is
   component wrapped_fp_plus_expr_FU_64_64_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         X : in std_logic_vector(65 downto 0);
         Y : in std_logic_vector(65 downto 0);
         R : out std_logic_vector(65 downto 0)
         
      );
   end component;
   component in_wrap_fp_plus_expr_FU_64_64_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         X : in std_logic_vector(63 downto 0);
         R : out std_logic_vector(65 downto 0)
         
      );
   end component;
   component out_wrap_fp_plus_expr_FU_64_64_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         X : in std_logic_vector(65 downto 0);
         R : out std_logic_vector(63 downto 0)
         
      );
   end component;
   signal wireIn1, wireIn2 : std_logic_vector(65 downto 0);
   signal wireOut1 : std_logic_vector(65 downto 0);
   begin
      fu : wrapped_fp_plus_expr_FU_64_64_500 port map (X => wireIn1, Y => wireIn2, R => wireOut1, clk=> clock, rst=> reset);
      in1 : in_wrap_fp_plus_expr_FU_64_64_500 port map (X=>X, R=>wireIn1, clk=> clock, rst=> reset);
      in2 : in_wrap_fp_plus_expr_FU_64_64_500 port map (X=>Y, R=>wireIn2, clk=> clock, rst=> reset);
      out1 : out_wrap_fp_plus_expr_FU_64_64_500 port map (X=>wireOut1, R=>R, clk=> clock, rst=> reset);
end architecture;

