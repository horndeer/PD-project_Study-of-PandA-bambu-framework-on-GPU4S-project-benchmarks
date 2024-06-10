--------------------------------------------------------------------------------
--                         Fix2FP_0_63_S_11_52_LZOCS
--                  (LZOCShifter_63_to_64_counting_64_uid43)
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

entity Fix2FP_0_63_S_11_52_LZOCS is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(62 downto 0);
          OZb : in std_logic;
          Count : out  std_logic_vector(5 downto 0);
          O : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of Fix2FP_0_63_S_11_52_LZOCS is
signal level6, level6_d1 :  std_logic_vector(62 downto 0);
signal sozb, sozb_d1, sozb_d2, sozb_d3, sozb_d4, sozb_d5 : std_logic;
signal count5, count5_d1, count5_d2, count5_d3, count5_d4, count5_d5, count5_d6 : std_logic;
signal level5, level5_d1 :  std_logic_vector(62 downto 0);
signal count4, count4_d1, count4_d2, count4_d3, count4_d4, count4_d5 : std_logic;
signal level4, level4_d1 :  std_logic_vector(62 downto 0);
signal count3, count3_d1, count3_d2, count3_d3, count3_d4 : std_logic;
signal level3, level3_d1 :  std_logic_vector(62 downto 0);
signal count2, count2_d1, count2_d2, count2_d3 : std_logic;
signal level2, level2_d1 :  std_logic_vector(62 downto 0);
signal count1, count1_d1, count1_d2 : std_logic;
signal level1, level1_d1 :  std_logic_vector(62 downto 0);
signal count0, count0_d1 : std_logic;
signal level0 :  std_logic_vector(62 downto 0);
signal sCount :  std_logic_vector(5 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            level6_d1 <=  level6;
            sozb_d1 <=  sozb;
            sozb_d2 <=  sozb_d1;
            sozb_d3 <=  sozb_d2;
            sozb_d4 <=  sozb_d3;
            sozb_d5 <=  sozb_d4;
            count5_d1 <=  count5;
            count5_d2 <=  count5_d1;
            count5_d3 <=  count5_d2;
            count5_d4 <=  count5_d3;
            count5_d5 <=  count5_d4;
            count5_d6 <=  count5_d5;
            level5_d1 <=  level5;
            count4_d1 <=  count4;
            count4_d2 <=  count4_d1;
            count4_d3 <=  count4_d2;
            count4_d4 <=  count4_d3;
            count4_d5 <=  count4_d4;
            level4_d1 <=  level4;
            count3_d1 <=  count3;
            count3_d2 <=  count3_d1;
            count3_d3 <=  count3_d2;
            count3_d4 <=  count3_d3;
            level3_d1 <=  level3;
            count2_d1 <=  count2;
            count2_d2 <=  count2_d1;
            count2_d3 <=  count2_d2;
            level2_d1 <=  level2;
            count1_d1 <=  count1;
            count1_d2 <=  count1_d1;
            level1_d1 <=  level1;
            count0_d1 <=  count0;
         end if;
      end process;
   level6 <= I ;
   sozb<= OZb;
   count5<= '1' when level6(62 downto 31) = (62 downto 31=>sozb) else '0';
   ----------------Synchro barrier, entering cycle 1----------------
   level5<= level6_d1(62 downto 0) when count5_d1='0' else level6_d1(30 downto 0) & (31 downto 0 => '0');

   count4<= '1' when level5(62 downto 47) = (62 downto 47=>sozb_d1) else '0';
   ----------------Synchro barrier, entering cycle 2----------------
   level4<= level5_d1(62 downto 0) when count4_d1='0' else level5_d1(46 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(62 downto 55) = (62 downto 55=>sozb_d2) else '0';
   ----------------Synchro barrier, entering cycle 3----------------
   level3<= level4_d1(62 downto 0) when count3_d1='0' else level4_d1(54 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(62 downto 59) = (62 downto 59=>sozb_d3) else '0';
   ----------------Synchro barrier, entering cycle 4----------------
   level2<= level3_d1(62 downto 0) when count2_d1='0' else level3_d1(58 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(62 downto 61) = (62 downto 61=>sozb_d4) else '0';
   ----------------Synchro barrier, entering cycle 5----------------
   level1<= level2_d1(62 downto 0) when count1_d1='0' else level2_d1(60 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(62 downto 62) = (62 downto 62=>sozb_d5) else '0';
   ----------------Synchro barrier, entering cycle 6----------------
   level0<= level1_d1(62 downto 0) when count0_d1='0' else level1_d1(61 downto 0) & (0 downto 0 => '0');

   O <= level0&(0 downto 0 => '0');
   sCount <= count5_d6 & count4_d5 & count3_d4 & count2_d3 & count1_d2 & count0_d1;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                   Fix2FP_0_63_S_11_52exponentConversion
--                          (IntAdder_11_f500_uid46)
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

entity Fix2FP_0_63_S_11_52exponentConversion is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(10 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(10 downto 0)   );
end entity;

architecture arch of Fix2FP_0_63_S_11_52exponentConversion is
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
--                      Fix2FP_0_63_S_11_52exponentFinal
--                          (IntAdder_12_f500_uid53)
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

entity Fix2FP_0_63_S_11_52exponentFinal is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11 downto 0);
          Y : in  std_logic_vector(11 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(11 downto 0)   );
end entity;

architecture arch of Fix2FP_0_63_S_11_52exponentFinal is
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
--                          Fix2FP_0_63_S_11_52zeroD
--                          (IntAdder_64_f500_uid60)
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

entity Fix2FP_0_63_S_11_52zeroD is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          Y : in  std_logic_vector(63 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of Fix2FP_0_63_S_11_52zeroD is
signal s_sum_l0_idx0 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx3, s_sum_l0_idx3_d1, s_sum_l0_idx3_d2, s_sum_l0_idx3_d3 :  std_logic_vector(4 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2, sum_l0_idx0_d3 :  std_logic_vector(19 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(19 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(19 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal sum_l0_idx3 :  std_logic_vector(3 downto 0);
signal c_l0_idx3 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(20 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1, sum_l1_idx1_d2 :  std_logic_vector(19 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(20 downto 0);
signal sum_l2_idx2, sum_l2_idx2_d1 :  std_logic_vector(19 downto 0);
signal c_l2_idx2, c_l2_idx2_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l3_idx3 :  std_logic_vector(4 downto 0);
signal sum_l3_idx3 :  std_logic_vector(3 downto 0);
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
   s_sum_l0_idx3 <= ( "0" & X(63 downto 60)) + ( "0" & Y(63 downto 60));
   sum_l0_idx0 <= s_sum_l0_idx0(19 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(20 downto 20);
   sum_l0_idx1 <= s_sum_l0_idx1(19 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(20 downto 20);
   sum_l0_idx2 <= s_sum_l0_idx2(19 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(20 downto 20);
   sum_l0_idx3 <= s_sum_l0_idx3(3 downto 0);
   c_l0_idx3 <= s_sum_l0_idx3(4 downto 4);
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
   sum_l3_idx3 <= s_sum_l3_idx3(3 downto 0);
   c_l3_idx3 <= s_sum_l3_idx3(4 downto 4);
   R <= sum_l3_idx3(3 downto 0) & sum_l2_idx2_d1(19 downto 0) & sum_l1_idx1_d2(19 downto 0) & sum_l0_idx0_d3(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                    Fix2FP_0_63_S_11_52_fractionConvert
--                          (IntAdder_65_f500_uid67)
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

entity Fix2FP_0_63_S_11_52_fractionConvert is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(64 downto 0);
          Y : in  std_logic_vector(64 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(64 downto 0)   );
end entity;

architecture arch of Fix2FP_0_63_S_11_52_fractionConvert is
signal s_sum_l0_idx0 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx3, s_sum_l0_idx3_d1, s_sum_l0_idx3_d2, s_sum_l0_idx3_d3 :  std_logic_vector(5 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2, sum_l0_idx0_d3 :  std_logic_vector(19 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(19 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(19 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal sum_l0_idx3 :  std_logic_vector(4 downto 0);
signal c_l0_idx3 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(20 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1, sum_l1_idx1_d2 :  std_logic_vector(19 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(20 downto 0);
signal sum_l2_idx2, sum_l2_idx2_d1 :  std_logic_vector(19 downto 0);
signal c_l2_idx2, c_l2_idx2_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l3_idx3 :  std_logic_vector(5 downto 0);
signal sum_l3_idx3 :  std_logic_vector(4 downto 0);
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
   s_sum_l0_idx3 <= ( "0" & X(64 downto 60)) + ( "0" & Y(64 downto 60));
   sum_l0_idx0 <= s_sum_l0_idx0(19 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(20 downto 20);
   sum_l0_idx1 <= s_sum_l0_idx1(19 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(20 downto 20);
   sum_l0_idx2 <= s_sum_l0_idx2(19 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(20 downto 20);
   sum_l0_idx3 <= s_sum_l0_idx3(4 downto 0);
   c_l0_idx3 <= s_sum_l0_idx3(5 downto 5);
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
   sum_l3_idx3 <= s_sum_l3_idx3(4 downto 0);
   c_l3_idx3 <= s_sum_l3_idx3(5 downto 5);
   R <= sum_l3_idx3(4 downto 0) & sum_l2_idx2_d1(19 downto 0) & sum_l1_idx1_d2(19 downto 0) & sum_l0_idx0_d3(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                     Fix2FP_0_63_S_11_52_oneSubstracter
--                          (IntAdder_10_f500_uid74)
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

entity Fix2FP_0_63_S_11_52_oneSubstracter is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(9 downto 0);
          Y : in  std_logic_vector(9 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of Fix2FP_0_63_S_11_52_oneSubstracter is
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
--                      Fix2FP_0_63_S_11_52roundingAdder
--                          (IntAdder_64_f500_uid81)
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

entity Fix2FP_0_63_S_11_52roundingAdder is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          Y : in  std_logic_vector(63 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of Fix2FP_0_63_S_11_52roundingAdder is
signal s_sum_l0_idx0 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx3, s_sum_l0_idx3_d1, s_sum_l0_idx3_d2, s_sum_l0_idx3_d3 :  std_logic_vector(4 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2, sum_l0_idx0_d3 :  std_logic_vector(19 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(19 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(19 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal sum_l0_idx3 :  std_logic_vector(3 downto 0);
signal c_l0_idx3 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(20 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1, sum_l1_idx1_d2 :  std_logic_vector(19 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(20 downto 0);
signal sum_l2_idx2, sum_l2_idx2_d1 :  std_logic_vector(19 downto 0);
signal c_l2_idx2, c_l2_idx2_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l3_idx3 :  std_logic_vector(4 downto 0);
signal sum_l3_idx3 :  std_logic_vector(3 downto 0);
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
   s_sum_l0_idx3 <= ( "0" & X(63 downto 60)) + ( "0" & Y(63 downto 60));
   sum_l0_idx0 <= s_sum_l0_idx0(19 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(20 downto 20);
   sum_l0_idx1 <= s_sum_l0_idx1(19 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(20 downto 20);
   sum_l0_idx2 <= s_sum_l0_idx2(19 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(20 downto 20);
   sum_l0_idx3 <= s_sum_l0_idx3(3 downto 0);
   c_l0_idx3 <= s_sum_l0_idx3(4 downto 4);
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
   sum_l3_idx3 <= s_sum_l3_idx3(3 downto 0);
   c_l3_idx3 <= s_sum_l3_idx3(4 downto 4);
   R <= sum_l3_idx3(3 downto 0) & sum_l2_idx2_d1(19 downto 0) & sum_l1_idx1_d2(19 downto 0) & sum_l0_idx0_d3(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                  wrapped_fp_float_expr_64_64_FU_64_64_500
--                           (Fix2FP_0_63_S_11_52)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Radu Tudoran, Bogdan Pasca (2009)
--------------------------------------------------------------------------------
-- Pipeline depth: 13 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity wrapped_fp_float_expr_64_64_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(63 downto 0);
          O : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of wrapped_fp_float_expr_64_64_FU_64_64_500 is
   component Fix2FP_0_63_S_11_52_LZOCS is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(62 downto 0);
             OZb : in std_logic;
             Count : out  std_logic_vector(5 downto 0);
             O : out  std_logic_vector(63 downto 0)   );
   end component;

   component Fix2FP_0_63_S_11_52_fractionConvert is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(64 downto 0);
             Y : in  std_logic_vector(64 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(64 downto 0)   );
   end component;

   component Fix2FP_0_63_S_11_52_oneSubstracter is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(9 downto 0);
             Y : in  std_logic_vector(9 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(9 downto 0)   );
   end component;

   component Fix2FP_0_63_S_11_52exponentConversion is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(10 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(10 downto 0)   );
   end component;

   component Fix2FP_0_63_S_11_52exponentFinal is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(11 downto 0);
             Y : in  std_logic_vector(11 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(11 downto 0)   );
   end component;

   component Fix2FP_0_63_S_11_52roundingAdder is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(63 downto 0);
             Y : in  std_logic_vector(63 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(63 downto 0)   );
   end component;

   component Fix2FP_0_63_S_11_52zeroD is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(63 downto 0);
             Y : in  std_logic_vector(63 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(63 downto 0)   );
   end component;

signal input :  std_logic_vector(63 downto 0);
signal signSignal, signSignal_d1, signSignal_d2, signSignal_d3, signSignal_d4, signSignal_d5, signSignal_d6, signSignal_d7, signSignal_d8, signSignal_d9, signSignal_d10, signSignal_d11, signSignal_d12, signSignal_d13 : std_logic;
signal passedInput :  std_logic_vector(63 downto 0);
signal input2LZOC :  std_logic_vector(62 downto 0);
signal temporalExponent :  std_logic_vector(5 downto 0);
signal temporalFraction :  std_logic_vector(63 downto 0);
signal MSB2Signal :  std_logic_vector(10 downto 0);
signal zeroPadding4Exponent :  std_logic_vector(4 downto 0);
signal valueExponent :  std_logic_vector(10 downto 0);
signal partialConvertedExponent :  std_logic_vector(10 downto 0);
signal biassOfOnes :  std_logic_vector(9 downto 0);
signal biassSignal :  std_logic_vector(10 downto 0);
signal biassSignalBit :  std_logic_vector(11 downto 0);
signal partialConvertedExponentBit :  std_logic_vector(11 downto 0);
signal sign4OU : std_logic;
signal convertedExponentBit :  std_logic_vector(11 downto 0);
signal convertedExponent, convertedExponent_d1, convertedExponent_d2, convertedExponent_d3, convertedExponent_d4 :  std_logic_vector(10 downto 0);
signal underflowSignal, underflowSignal_d1, underflowSignal_d2, underflowSignal_d3, underflowSignal_d4, underflowSignal_d5, underflowSignal_d6, underflowSignal_d7 : std_logic;
signal overflowSignal, overflowSignal_d1, overflowSignal_d2, overflowSignal_d3, overflowSignal_d4, overflowSignal_d5, overflowSignal_d6, overflowSignal_d7 : std_logic;
signal minusOne4ZD :  std_logic_vector(63 downto 0);
signal zeroDS :  std_logic_vector(63 downto 0);
signal zeroInput, zeroInput_d1, zeroInput_d2, zeroInput_d3, zeroInput_d4, zeroInput_d5, zeroInput_d6, zeroInput_d7, zeroInput_d8, zeroInput_d9, zeroInput_d10 : std_logic;
signal sign2vector :  std_logic_vector(63 downto 0);
signal tempConvert :  std_logic_vector(63 downto 0);
signal tempConvert0 :  std_logic_vector(64 downto 0);
signal tempPaddingAddSign :  std_logic_vector(63 downto 0);
signal tempAddSign :  std_logic_vector(64 downto 0);
signal tempFractionResult :  std_logic_vector(64 downto 0);
signal correctingExponent, correctingExponent_d1 : std_logic;
signal fractionConverted, fractionConverted_d1 :  std_logic_vector(51 downto 0);
signal firstBitofRest, firstBitofRest_d1 : std_logic;
signal lastBitOfFraction, lastBitOfFraction_d1 : std_logic;
signal minusOne :  std_logic_vector(9 downto 0);
signal fractionRemainder :  std_logic_vector(9 downto 0);
signal zeroFractionResult :  std_logic_vector(9 downto 0);
signal zeroRemainder, zeroRemainder_d1 : std_logic;
signal outputOfMux3 : std_logic;
signal outputOfMux2 : std_logic;
signal outputOfMux1 : std_logic;
signal possibleCorrector4Rounding :  std_logic_vector(63 downto 0);
signal concatenationForRounding :  std_logic_vector(63 downto 0);
signal testC :  std_logic_vector(63 downto 0);
signal testR :  std_logic_vector(63 downto 0);
signal testM : std_logic;
signal roundedResult :  std_logic_vector(63 downto 0);
signal convertedExponentAfterRounding :  std_logic_vector(10 downto 0);
signal convertedFractionAfterRounding :  std_logic_vector(51 downto 0);
signal MSBSelection : std_logic;
signal LSBSelection : std_logic;
signal Selection :  std_logic_vector(1 downto 0);
signal specialBits :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            signSignal_d1 <=  signSignal;
            signSignal_d2 <=  signSignal_d1;
            signSignal_d3 <=  signSignal_d2;
            signSignal_d4 <=  signSignal_d3;
            signSignal_d5 <=  signSignal_d4;
            signSignal_d6 <=  signSignal_d5;
            signSignal_d7 <=  signSignal_d6;
            signSignal_d8 <=  signSignal_d7;
            signSignal_d9 <=  signSignal_d8;
            signSignal_d10 <=  signSignal_d9;
            signSignal_d11 <=  signSignal_d10;
            signSignal_d12 <=  signSignal_d11;
            signSignal_d13 <=  signSignal_d12;
            convertedExponent_d1 <=  convertedExponent;
            convertedExponent_d2 <=  convertedExponent_d1;
            convertedExponent_d3 <=  convertedExponent_d2;
            convertedExponent_d4 <=  convertedExponent_d3;
            underflowSignal_d1 <=  underflowSignal;
            underflowSignal_d2 <=  underflowSignal_d1;
            underflowSignal_d3 <=  underflowSignal_d2;
            underflowSignal_d4 <=  underflowSignal_d3;
            underflowSignal_d5 <=  underflowSignal_d4;
            underflowSignal_d6 <=  underflowSignal_d5;
            underflowSignal_d7 <=  underflowSignal_d6;
            overflowSignal_d1 <=  overflowSignal;
            overflowSignal_d2 <=  overflowSignal_d1;
            overflowSignal_d3 <=  overflowSignal_d2;
            overflowSignal_d4 <=  overflowSignal_d3;
            overflowSignal_d5 <=  overflowSignal_d4;
            overflowSignal_d6 <=  overflowSignal_d5;
            overflowSignal_d7 <=  overflowSignal_d6;
            zeroInput_d1 <=  zeroInput;
            zeroInput_d2 <=  zeroInput_d1;
            zeroInput_d3 <=  zeroInput_d2;
            zeroInput_d4 <=  zeroInput_d3;
            zeroInput_d5 <=  zeroInput_d4;
            zeroInput_d6 <=  zeroInput_d5;
            zeroInput_d7 <=  zeroInput_d6;
            zeroInput_d8 <=  zeroInput_d7;
            zeroInput_d9 <=  zeroInput_d8;
            zeroInput_d10 <=  zeroInput_d9;
            correctingExponent_d1 <=  correctingExponent;
            fractionConverted_d1 <=  fractionConverted;
            firstBitofRest_d1 <=  firstBitofRest;
            lastBitOfFraction_d1 <=  lastBitOfFraction;
            zeroRemainder_d1 <=  zeroRemainder;
         end if;
      end process;
   input <= I;
   signSignal<=input(63);
   passedInput<=input(63 downto 0);
   input2LZOC<=passedInput(62 downto 0);
   LZOC_component: Fix2FP_0_63_S_11_52_LZOCS  -- pipelineDepth=6 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => temporalExponent,
                 I => input2LZOC,
                 O => temporalFraction,
                 OZb => signSignal);
   ----------------Synchro barrier, entering cycle 6----------------
   MSB2Signal<=CONV_STD_LOGIC_VECTOR(62,11);
   zeroPadding4Exponent<=CONV_STD_LOGIC_VECTOR(0,5);
   valueExponent<= not (zeroPadding4Exponent & temporalExponent );
   exponentConversion: Fix2FP_0_63_S_11_52exponentConversion  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => partialConvertedExponent,
                 X => MSB2Signal,
                 Y => valueExponent);
   biassOfOnes<=CONV_STD_LOGIC_VECTOR(2047,10);
   biassSignal<='0' & biassOfOnes;
   biassSignalBit<='0' & biassSignal;
   partialConvertedExponentBit<= '0' & partialConvertedExponent;
   sign4OU<=partialConvertedExponent(10);
   exponentFinal: Fix2FP_0_63_S_11_52exponentFinal  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => convertedExponentBit,
                 X => partialConvertedExponentBit,
                 Y => biassSignalBit);
   convertedExponent<= convertedExponentBit(10 downto 0);
   underflowSignal<= '1' when (sign4OU='1' and convertedExponentBit(11 downto 10) = "01" ) else '0' ;
   overflowSignal<= '1' when (sign4OU='0' and convertedExponentBit(11 downto 10) = "10" ) else '0' ;
   ---------------- cycle 0----------------
   minusOne4ZD<=CONV_STD_LOGIC_VECTOR(-1,64);
   zeroD: Fix2FP_0_63_S_11_52zeroD  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => zeroDS,
                 X => passedInput,
                 Y => minusOne4ZD);
   ----------------Synchro barrier, entering cycle 3----------------
   zeroInput<= zeroDS(63) and not(signSignal_d3);
   ---------------- cycle 6----------------
   sign2vector<=(others => signSignal_d6);
   tempConvert<= sign2vector xor temporalFraction;
   tempConvert0<= '0' & tempConvert;
   tempPaddingAddSign<=(others=>'0');
   tempAddSign<=tempPaddingAddSign & signSignal_d6;
   fractionConverter: Fix2FP_0_63_S_11_52_fractionConvert  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => tempFractionResult,
                 X => tempConvert0,
                 Y => tempAddSign);
   ----------------Synchro barrier, entering cycle 9----------------
   correctingExponent<=tempFractionResult(64);
   fractionConverted<=tempFractionResult(62 downto 11);
   firstBitofRest<=tempFractionResult(10);
   lastBitOfFraction<=tempFractionResult(11);
   ---------------- cycle 9----------------
   minusOne<=CONV_STD_LOGIC_VECTOR(-1,10);
   fractionRemainder<= tempFractionResult(9 downto 0);
   oneSubstracter: Fix2FP_0_63_S_11_52_oneSubstracter  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => zeroFractionResult,
                 X => fractionRemainder,
                 Y => minusOne);
   zeroRemainder<= not( not (tempFractionResult(9)) and zeroFractionResult(9));
   ----------------Synchro barrier, entering cycle 10----------------
   outputOfMux3<=lastBitOfFraction_d1;
   with zeroRemainder_d1 select 
   outputOfMux2 <= outputOfMux3 when '0', '1' when others;
   with firstBitofRest_d1 select 
   outputOfMux1 <= outputOfMux2 when '1', '0' when others;
   possibleCorrector4Rounding<=CONV_STD_LOGIC_VECTOR(0,11) & correctingExponent_d1 & CONV_STD_LOGIC_VECTOR(0,52);
   concatenationForRounding<= '0' & convertedExponent_d4 & fractionConverted_d1;
   testC<= concatenationForRounding;
   testR<= possibleCorrector4Rounding;
   testM<= outputOfMux1;
   roundingAdder: Fix2FP_0_63_S_11_52roundingAdder  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => outputOfMux1,
                 R => roundedResult,
                 X => concatenationForRounding,
                 Y => possibleCorrector4Rounding);
   ----------------Synchro barrier, entering cycle 13----------------
   convertedExponentAfterRounding<= roundedResult(62 downto 52);
   convertedFractionAfterRounding<= roundedResult(51 downto 0);
   MSBSelection<= overflowSignal_d7 or roundedResult(63);
   LSBSelection<= not(underflowSignal_d7 and not(zeroInput_d10));
   Selection<= MSBSelection & LSBSelection when zeroInput_d10='0' else "00";
   specialBits <= Selection;
   O<= specialBits & signSignal_d13 & convertedExponentAfterRounding & convertedFractionAfterRounding;
end architecture;

--------------------------------------------------------------------------------
--                 out_wrap_fp_float_expr_64_64_FU_64_64_500
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

entity out_wrap_fp_float_expr_64_64_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of out_wrap_fp_float_expr_64_64_FU_64_64_500 is
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
--                              fp_float_expr_64_64_FU_64_64_500
-- Operator automatically generated by FloPoCo framework version svn-trunk
-- assemblying operators generated by the Infinite Virtual Library FloPoCoLib
-- Send any bug to: BUG_REPORT_ADDRESS
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fp_float_expr_64_64_FU_64_64_500 is
   generic(BITSIZE_I: integer := 64; BITSIZE_O: integer := 64);
   port (
      I : in signed(BITSIZE_I-1 downto 0);
      clock : in std_logic;
      reset : in std_logic;
      O : out std_logic_vector(BITSIZE_O-1 downto 0)
      
   );
end entity;

architecture arch of fp_float_expr_64_64_FU_64_64_500 is
   component wrapped_fp_float_expr_64_64_FU_64_64_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         I : in std_logic_vector(63 downto 0);
         O : out std_logic_vector(65 downto 0)
         
      );
   end component;
   component out_wrap_fp_float_expr_64_64_FU_64_64_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         X : in std_logic_vector(65 downto 0);
         R : out std_logic_vector(63 downto 0)
         
      );
   end component;
   signal wireOut1 : std_logic_vector(65 downto 0);
   begin
      fu : wrapped_fp_float_expr_64_64_FU_64_64_500 port map (I => std_logic_vector(I), O => wireOut1, clk=> clock, rst=> reset);
      out1 : out_wrap_fp_float_expr_64_64_FU_64_64_500 port map (X=>wireOut1, R=>O, clk=> clock, rst=> reset);
end architecture;

