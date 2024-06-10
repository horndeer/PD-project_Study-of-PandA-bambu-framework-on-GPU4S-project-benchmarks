--------------------------------------------------------------------------------
--                          IntAdder_106_f500_uid253
--                   (IntAdderAlternative_106_f500_uid257)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 5 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_106_f500_uid253 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(105 downto 0);
          Y : in  std_logic_vector(105 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(105 downto 0)   );
end entity;

architecture arch of IntAdder_106_f500_uid253 is
signal s_sum_l0_idx0 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx3, s_sum_l0_idx3_d1, s_sum_l0_idx3_d2, s_sum_l0_idx3_d3 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx4, s_sum_l0_idx4_d1, s_sum_l0_idx4_d2, s_sum_l0_idx4_d3, s_sum_l0_idx4_d4 :  std_logic_vector(20 downto 0);
signal s_sum_l0_idx5, s_sum_l0_idx5_d1, s_sum_l0_idx5_d2, s_sum_l0_idx5_d3, s_sum_l0_idx5_d4, s_sum_l0_idx5_d5 :  std_logic_vector(6 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2, sum_l0_idx0_d3, sum_l0_idx0_d4, sum_l0_idx0_d5 :  std_logic_vector(19 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(19 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(19 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal sum_l0_idx3 :  std_logic_vector(19 downto 0);
signal c_l0_idx3 :  std_logic_vector(0 downto 0);
signal sum_l0_idx4 :  std_logic_vector(19 downto 0);
signal c_l0_idx4 :  std_logic_vector(0 downto 0);
signal sum_l0_idx5 :  std_logic_vector(5 downto 0);
signal c_l0_idx5 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(20 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1, sum_l1_idx1_d2, sum_l1_idx1_d3, sum_l1_idx1_d4 :  std_logic_vector(19 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(20 downto 0);
signal sum_l2_idx2, sum_l2_idx2_d1, sum_l2_idx2_d2, sum_l2_idx2_d3 :  std_logic_vector(19 downto 0);
signal c_l2_idx2, c_l2_idx2_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l3_idx3 :  std_logic_vector(20 downto 0);
signal sum_l3_idx3, sum_l3_idx3_d1, sum_l3_idx3_d2 :  std_logic_vector(19 downto 0);
signal c_l3_idx3, c_l3_idx3_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l4_idx4 :  std_logic_vector(20 downto 0);
signal sum_l4_idx4, sum_l4_idx4_d1 :  std_logic_vector(19 downto 0);
signal c_l4_idx4, c_l4_idx4_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l5_idx5 :  std_logic_vector(6 downto 0);
signal sum_l5_idx5 :  std_logic_vector(5 downto 0);
signal c_l5_idx5 :  std_logic_vector(0 downto 0);
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
            s_sum_l0_idx4_d1 <=  s_sum_l0_idx4;
            s_sum_l0_idx4_d2 <=  s_sum_l0_idx4_d1;
            s_sum_l0_idx4_d3 <=  s_sum_l0_idx4_d2;
            s_sum_l0_idx4_d4 <=  s_sum_l0_idx4_d3;
            s_sum_l0_idx5_d1 <=  s_sum_l0_idx5;
            s_sum_l0_idx5_d2 <=  s_sum_l0_idx5_d1;
            s_sum_l0_idx5_d3 <=  s_sum_l0_idx5_d2;
            s_sum_l0_idx5_d4 <=  s_sum_l0_idx5_d3;
            s_sum_l0_idx5_d5 <=  s_sum_l0_idx5_d4;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            sum_l0_idx0_d3 <=  sum_l0_idx0_d2;
            sum_l0_idx0_d4 <=  sum_l0_idx0_d3;
            sum_l0_idx0_d5 <=  sum_l0_idx0_d4;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            sum_l1_idx1_d2 <=  sum_l1_idx1_d1;
            sum_l1_idx1_d3 <=  sum_l1_idx1_d2;
            sum_l1_idx1_d4 <=  sum_l1_idx1_d3;
            c_l1_idx1_d1 <=  c_l1_idx1;
            sum_l2_idx2_d1 <=  sum_l2_idx2;
            sum_l2_idx2_d2 <=  sum_l2_idx2_d1;
            sum_l2_idx2_d3 <=  sum_l2_idx2_d2;
            c_l2_idx2_d1 <=  c_l2_idx2;
            sum_l3_idx3_d1 <=  sum_l3_idx3;
            sum_l3_idx3_d2 <=  sum_l3_idx3_d1;
            c_l3_idx3_d1 <=  c_l3_idx3;
            sum_l4_idx4_d1 <=  sum_l4_idx4;
            c_l4_idx4_d1 <=  c_l4_idx4;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(19 downto 0)) + ( "0" & Y(19 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(39 downto 20)) + ( "0" & Y(39 downto 20));
   s_sum_l0_idx2 <= ( "0" & X(59 downto 40)) + ( "0" & Y(59 downto 40));
   s_sum_l0_idx3 <= ( "0" & X(79 downto 60)) + ( "0" & Y(79 downto 60));
   s_sum_l0_idx4 <= ( "0" & X(99 downto 80)) + ( "0" & Y(99 downto 80));
   s_sum_l0_idx5 <= ( "0" & X(105 downto 100)) + ( "0" & Y(105 downto 100));
   sum_l0_idx0 <= s_sum_l0_idx0(19 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(20 downto 20);
   sum_l0_idx1 <= s_sum_l0_idx1(19 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(20 downto 20);
   sum_l0_idx2 <= s_sum_l0_idx2(19 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(20 downto 20);
   sum_l0_idx3 <= s_sum_l0_idx3(19 downto 0);
   c_l0_idx3 <= s_sum_l0_idx3(20 downto 20);
   sum_l0_idx4 <= s_sum_l0_idx4(19 downto 0);
   c_l0_idx4 <= s_sum_l0_idx4(20 downto 20);
   sum_l0_idx5 <= s_sum_l0_idx5(5 downto 0);
   c_l0_idx5 <= s_sum_l0_idx5(6 downto 6);
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
   sum_l3_idx3 <= s_sum_l3_idx3(19 downto 0);
   c_l3_idx3 <= s_sum_l3_idx3(20 downto 20);
   ----------------Synchro barrier, entering cycle 4----------------
   s_sum_l4_idx4 <=  s_sum_l0_idx4_d4 + c_l3_idx3_d1(0 downto 0);
   sum_l4_idx4 <= s_sum_l4_idx4(19 downto 0);
   c_l4_idx4 <= s_sum_l4_idx4(20 downto 20);
   ----------------Synchro barrier, entering cycle 5----------------
   s_sum_l5_idx5 <=  s_sum_l0_idx5_d5 + c_l4_idx4_d1(0 downto 0);
   sum_l5_idx5 <= s_sum_l5_idx5(5 downto 0);
   c_l5_idx5 <= s_sum_l5_idx5(6 downto 6);
   R <= sum_l5_idx5(5 downto 0) & sum_l4_idx4_d1(19 downto 0) & sum_l3_idx3_d2(19 downto 0) & sum_l2_idx2_d3(19 downto 0) & sum_l1_idx1_d4(19 downto 0) & sum_l0_idx0_d5(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--              IntMultiplier_UsingDSP_53_53_106_unsigned_uid119
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 10 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_53_53_106_unsigned_uid119 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(52 downto 0);
          Y : in  std_logic_vector(52 downto 0);
          R : out  std_logic_vector(105 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_53_53_106_unsigned_uid119 is
   component Compressor_13_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_14_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_23_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_3_2 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component Compressor_4_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_6_3 is
      port ( X0 : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component IntAdder_106_f500_uid253 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(105 downto 0);
             Y : in  std_logic_vector(105 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(105 downto 0)   );
   end component;

signal XX_m120 :  std_logic_vector(52 downto 0);
signal YY_m120 :  std_logic_vector(52 downto 0);
signal DSP_bh121_ch0_0, DSP_bh121_ch0_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w105_0, heap_bh121_w105_0_d1, heap_bh121_w105_0_d2, heap_bh121_w105_0_d3, heap_bh121_w105_0_d4 : std_logic;
signal heap_bh121_w104_0, heap_bh121_w104_0_d1, heap_bh121_w104_0_d2, heap_bh121_w104_0_d3, heap_bh121_w104_0_d4 : std_logic;
signal heap_bh121_w103_0, heap_bh121_w103_0_d1, heap_bh121_w103_0_d2, heap_bh121_w103_0_d3, heap_bh121_w103_0_d4 : std_logic;
signal heap_bh121_w102_0, heap_bh121_w102_0_d1, heap_bh121_w102_0_d2, heap_bh121_w102_0_d3, heap_bh121_w102_0_d4 : std_logic;
signal heap_bh121_w101_0, heap_bh121_w101_0_d1, heap_bh121_w101_0_d2, heap_bh121_w101_0_d3, heap_bh121_w101_0_d4 : std_logic;
signal heap_bh121_w100_0, heap_bh121_w100_0_d1, heap_bh121_w100_0_d2, heap_bh121_w100_0_d3, heap_bh121_w100_0_d4 : std_logic;
signal heap_bh121_w99_0, heap_bh121_w99_0_d1, heap_bh121_w99_0_d2, heap_bh121_w99_0_d3, heap_bh121_w99_0_d4 : std_logic;
signal heap_bh121_w98_0, heap_bh121_w98_0_d1, heap_bh121_w98_0_d2, heap_bh121_w98_0_d3, heap_bh121_w98_0_d4 : std_logic;
signal heap_bh121_w97_0, heap_bh121_w97_0_d1, heap_bh121_w97_0_d2, heap_bh121_w97_0_d3, heap_bh121_w97_0_d4 : std_logic;
signal heap_bh121_w96_0, heap_bh121_w96_0_d1, heap_bh121_w96_0_d2, heap_bh121_w96_0_d3, heap_bh121_w96_0_d4 : std_logic;
signal heap_bh121_w95_0, heap_bh121_w95_0_d1, heap_bh121_w95_0_d2, heap_bh121_w95_0_d3, heap_bh121_w95_0_d4 : std_logic;
signal heap_bh121_w94_0, heap_bh121_w94_0_d1, heap_bh121_w94_0_d2, heap_bh121_w94_0_d3, heap_bh121_w94_0_d4 : std_logic;
signal heap_bh121_w93_0, heap_bh121_w93_0_d1, heap_bh121_w93_0_d2, heap_bh121_w93_0_d3, heap_bh121_w93_0_d4 : std_logic;
signal heap_bh121_w92_0, heap_bh121_w92_0_d1, heap_bh121_w92_0_d2, heap_bh121_w92_0_d3, heap_bh121_w92_0_d4 : std_logic;
signal heap_bh121_w91_0, heap_bh121_w91_0_d1, heap_bh121_w91_0_d2, heap_bh121_w91_0_d3, heap_bh121_w91_0_d4 : std_logic;
signal heap_bh121_w90_0, heap_bh121_w90_0_d1, heap_bh121_w90_0_d2, heap_bh121_w90_0_d3, heap_bh121_w90_0_d4 : std_logic;
signal heap_bh121_w89_0, heap_bh121_w89_0_d1, heap_bh121_w89_0_d2, heap_bh121_w89_0_d3, heap_bh121_w89_0_d4 : std_logic;
signal heap_bh121_w88_0, heap_bh121_w88_0_d1 : std_logic;
signal heap_bh121_w87_0, heap_bh121_w87_0_d1 : std_logic;
signal heap_bh121_w86_0, heap_bh121_w86_0_d1 : std_logic;
signal heap_bh121_w85_0, heap_bh121_w85_0_d1 : std_logic;
signal heap_bh121_w84_0 : std_logic;
signal heap_bh121_w83_0 : std_logic;
signal heap_bh121_w82_0 : std_logic;
signal heap_bh121_w81_0 : std_logic;
signal heap_bh121_w80_0, heap_bh121_w80_0_d1, heap_bh121_w80_0_d2 : std_logic;
signal heap_bh121_w79_0 : std_logic;
signal heap_bh121_w78_0, heap_bh121_w78_0_d1, heap_bh121_w78_0_d2 : std_logic;
signal heap_bh121_w77_0 : std_logic;
signal heap_bh121_w76_0, heap_bh121_w76_0_d1 : std_logic;
signal heap_bh121_w75_0 : std_logic;
signal heap_bh121_w74_0, heap_bh121_w74_0_d1 : std_logic;
signal heap_bh121_w73_0 : std_logic;
signal heap_bh121_w72_0 : std_logic;
signal heap_bh121_w71_0 : std_logic;
signal heap_bh121_w70_0 : std_logic;
signal heap_bh121_w69_0 : std_logic;
signal heap_bh121_w68_0 : std_logic;
signal heap_bh121_w67_0 : std_logic;
signal heap_bh121_w66_0 : std_logic;
signal heap_bh121_w65_0 : std_logic;
signal DSP_bh121_ch1_0, DSP_bh121_ch1_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w81_1 : std_logic;
signal heap_bh121_w80_1 : std_logic;
signal heap_bh121_w79_1 : std_logic;
signal heap_bh121_w78_1 : std_logic;
signal heap_bh121_w77_1 : std_logic;
signal heap_bh121_w76_1 : std_logic;
signal heap_bh121_w75_1 : std_logic;
signal heap_bh121_w74_1 : std_logic;
signal heap_bh121_w73_1 : std_logic;
signal heap_bh121_w72_1 : std_logic;
signal heap_bh121_w71_1 : std_logic;
signal heap_bh121_w70_1 : std_logic;
signal heap_bh121_w69_1 : std_logic;
signal heap_bh121_w68_1 : std_logic;
signal heap_bh121_w67_1 : std_logic;
signal heap_bh121_w66_1 : std_logic;
signal heap_bh121_w65_1 : std_logic;
signal heap_bh121_w64_0 : std_logic;
signal heap_bh121_w63_0 : std_logic;
signal heap_bh121_w62_0 : std_logic;
signal heap_bh121_w61_0 : std_logic;
signal heap_bh121_w60_0 : std_logic;
signal heap_bh121_w59_0 : std_logic;
signal heap_bh121_w58_0 : std_logic;
signal heap_bh121_w57_0 : std_logic;
signal heap_bh121_w56_0 : std_logic;
signal heap_bh121_w55_0 : std_logic;
signal heap_bh121_w54_0 : std_logic;
signal heap_bh121_w53_0 : std_logic;
signal heap_bh121_w52_0 : std_logic;
signal heap_bh121_w51_0 : std_logic;
signal heap_bh121_w50_0 : std_logic;
signal heap_bh121_w49_0 : std_logic;
signal heap_bh121_w48_0 : std_logic;
signal heap_bh121_w47_0 : std_logic;
signal heap_bh121_w46_0 : std_logic;
signal heap_bh121_w45_0 : std_logic;
signal heap_bh121_w44_0 : std_logic;
signal heap_bh121_w43_0 : std_logic;
signal heap_bh121_w42_0 : std_logic;
signal heap_bh121_w41_0 : std_logic;
signal DSP_bh121_ch2_0, DSP_bh121_ch2_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w57_1 : std_logic;
signal heap_bh121_w56_1 : std_logic;
signal heap_bh121_w55_1 : std_logic;
signal heap_bh121_w54_1 : std_logic;
signal heap_bh121_w53_1 : std_logic;
signal heap_bh121_w52_1 : std_logic;
signal heap_bh121_w51_1 : std_logic;
signal heap_bh121_w50_1 : std_logic;
signal heap_bh121_w49_1 : std_logic;
signal heap_bh121_w48_1 : std_logic;
signal heap_bh121_w47_1 : std_logic;
signal heap_bh121_w46_1 : std_logic;
signal heap_bh121_w45_1 : std_logic;
signal heap_bh121_w44_1 : std_logic;
signal heap_bh121_w43_1 : std_logic;
signal heap_bh121_w42_1 : std_logic;
signal heap_bh121_w41_1 : std_logic;
signal heap_bh121_w40_0 : std_logic;
signal heap_bh121_w39_0 : std_logic;
signal heap_bh121_w38_0 : std_logic;
signal heap_bh121_w37_0 : std_logic;
signal heap_bh121_w36_0 : std_logic;
signal heap_bh121_w35_0 : std_logic;
signal heap_bh121_w34_0 : std_logic;
signal heap_bh121_w33_0 : std_logic;
signal heap_bh121_w32_0 : std_logic;
signal heap_bh121_w31_0 : std_logic;
signal heap_bh121_w30_0 : std_logic;
signal heap_bh121_w29_0 : std_logic;
signal heap_bh121_w28_0 : std_logic;
signal heap_bh121_w27_0 : std_logic;
signal heap_bh121_w26_0 : std_logic;
signal heap_bh121_w25_0 : std_logic;
signal heap_bh121_w24_0 : std_logic;
signal heap_bh121_w23_0 : std_logic;
signal heap_bh121_w22_0 : std_logic;
signal heap_bh121_w21_0 : std_logic;
signal heap_bh121_w20_0 : std_logic;
signal heap_bh121_w19_0 : std_logic;
signal heap_bh121_w18_0 : std_logic;
signal heap_bh121_w17_0 : std_logic;
signal DSP_bh121_ch3_0, DSP_bh121_ch3_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w88_1, heap_bh121_w88_1_d1 : std_logic;
signal heap_bh121_w87_1, heap_bh121_w87_1_d1 : std_logic;
signal heap_bh121_w86_1, heap_bh121_w86_1_d1 : std_logic;
signal heap_bh121_w85_1, heap_bh121_w85_1_d1 : std_logic;
signal heap_bh121_w84_1 : std_logic;
signal heap_bh121_w83_1 : std_logic;
signal heap_bh121_w82_1 : std_logic;
signal heap_bh121_w81_2 : std_logic;
signal heap_bh121_w80_2 : std_logic;
signal heap_bh121_w79_2 : std_logic;
signal heap_bh121_w78_2 : std_logic;
signal heap_bh121_w77_2 : std_logic;
signal heap_bh121_w76_2 : std_logic;
signal heap_bh121_w75_2 : std_logic;
signal heap_bh121_w74_2 : std_logic;
signal heap_bh121_w73_2 : std_logic;
signal heap_bh121_w72_2 : std_logic;
signal heap_bh121_w71_2 : std_logic;
signal heap_bh121_w70_2 : std_logic;
signal heap_bh121_w69_2 : std_logic;
signal heap_bh121_w68_2 : std_logic;
signal heap_bh121_w67_2 : std_logic;
signal heap_bh121_w66_2 : std_logic;
signal heap_bh121_w65_2 : std_logic;
signal heap_bh121_w64_1 : std_logic;
signal heap_bh121_w63_1 : std_logic;
signal heap_bh121_w62_1 : std_logic;
signal heap_bh121_w61_1 : std_logic;
signal heap_bh121_w60_1 : std_logic;
signal heap_bh121_w59_1 : std_logic;
signal heap_bh121_w58_1 : std_logic;
signal heap_bh121_w57_2 : std_logic;
signal heap_bh121_w56_2 : std_logic;
signal heap_bh121_w55_2 : std_logic;
signal heap_bh121_w54_2 : std_logic;
signal heap_bh121_w53_2 : std_logic;
signal heap_bh121_w52_2 : std_logic;
signal heap_bh121_w51_2 : std_logic;
signal heap_bh121_w50_2 : std_logic;
signal heap_bh121_w49_2 : std_logic;
signal heap_bh121_w48_2 : std_logic;
signal DSP_bh121_ch4_0, DSP_bh121_ch4_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w64_2 : std_logic;
signal heap_bh121_w63_2 : std_logic;
signal heap_bh121_w62_2 : std_logic;
signal heap_bh121_w61_2 : std_logic;
signal heap_bh121_w60_2 : std_logic;
signal heap_bh121_w59_2 : std_logic;
signal heap_bh121_w58_2 : std_logic;
signal heap_bh121_w57_3 : std_logic;
signal heap_bh121_w56_3 : std_logic;
signal heap_bh121_w55_3 : std_logic;
signal heap_bh121_w54_3 : std_logic;
signal heap_bh121_w53_3 : std_logic;
signal heap_bh121_w52_3 : std_logic;
signal heap_bh121_w51_3 : std_logic;
signal heap_bh121_w50_3 : std_logic;
signal heap_bh121_w49_3 : std_logic;
signal heap_bh121_w48_3 : std_logic;
signal heap_bh121_w47_2 : std_logic;
signal heap_bh121_w46_2 : std_logic;
signal heap_bh121_w45_2 : std_logic;
signal heap_bh121_w44_2 : std_logic;
signal heap_bh121_w43_2 : std_logic;
signal heap_bh121_w42_2 : std_logic;
signal heap_bh121_w41_2 : std_logic;
signal heap_bh121_w40_1 : std_logic;
signal heap_bh121_w39_1 : std_logic;
signal heap_bh121_w38_1 : std_logic;
signal heap_bh121_w37_1 : std_logic;
signal heap_bh121_w36_1 : std_logic;
signal heap_bh121_w35_1 : std_logic;
signal heap_bh121_w34_1 : std_logic;
signal heap_bh121_w33_1 : std_logic;
signal heap_bh121_w32_1 : std_logic;
signal heap_bh121_w31_1 : std_logic;
signal heap_bh121_w30_1 : std_logic;
signal heap_bh121_w29_1 : std_logic;
signal heap_bh121_w28_1 : std_logic;
signal heap_bh121_w27_1 : std_logic;
signal heap_bh121_w26_1 : std_logic;
signal heap_bh121_w25_1 : std_logic;
signal heap_bh121_w24_1 : std_logic;
signal DSP_bh121_ch5_0, DSP_bh121_ch5_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w40_2 : std_logic;
signal heap_bh121_w39_2 : std_logic;
signal heap_bh121_w38_2 : std_logic;
signal heap_bh121_w37_2 : std_logic;
signal heap_bh121_w36_2 : std_logic;
signal heap_bh121_w35_2 : std_logic;
signal heap_bh121_w34_2 : std_logic;
signal heap_bh121_w33_2 : std_logic;
signal heap_bh121_w32_2 : std_logic;
signal heap_bh121_w31_2 : std_logic;
signal heap_bh121_w30_2 : std_logic;
signal heap_bh121_w29_2 : std_logic;
signal heap_bh121_w28_2 : std_logic;
signal heap_bh121_w27_2 : std_logic;
signal heap_bh121_w26_2 : std_logic;
signal heap_bh121_w25_2 : std_logic;
signal heap_bh121_w24_2 : std_logic;
signal heap_bh121_w23_1 : std_logic;
signal heap_bh121_w22_1 : std_logic;
signal heap_bh121_w21_1 : std_logic;
signal heap_bh121_w20_1 : std_logic;
signal heap_bh121_w19_1 : std_logic;
signal heap_bh121_w18_1 : std_logic;
signal heap_bh121_w17_1 : std_logic;
signal heap_bh121_w16_0 : std_logic;
signal heap_bh121_w15_0 : std_logic;
signal heap_bh121_w14_0 : std_logic;
signal heap_bh121_w13_0 : std_logic;
signal heap_bh121_w12_0 : std_logic;
signal heap_bh121_w11_0 : std_logic;
signal heap_bh121_w10_0 : std_logic;
signal heap_bh121_w9_0 : std_logic;
signal heap_bh121_w8_0 : std_logic;
signal heap_bh121_w7_0 : std_logic;
signal heap_bh121_w6_0 : std_logic;
signal heap_bh121_w5_0 : std_logic;
signal heap_bh121_w4_0 : std_logic;
signal heap_bh121_w3_0 : std_logic;
signal heap_bh121_w2_0 : std_logic;
signal heap_bh121_w1_0 : std_logic;
signal heap_bh121_w0_0 : std_logic;
signal DSP_bh121_ch6_0, DSP_bh121_ch6_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w71_3 : std_logic;
signal heap_bh121_w70_3 : std_logic;
signal heap_bh121_w69_3 : std_logic;
signal heap_bh121_w68_3 : std_logic;
signal heap_bh121_w67_3 : std_logic;
signal heap_bh121_w66_3 : std_logic;
signal heap_bh121_w65_3 : std_logic;
signal heap_bh121_w64_3 : std_logic;
signal heap_bh121_w63_3 : std_logic;
signal heap_bh121_w62_3 : std_logic;
signal heap_bh121_w61_3 : std_logic;
signal heap_bh121_w60_3 : std_logic;
signal heap_bh121_w59_3 : std_logic;
signal heap_bh121_w58_3 : std_logic;
signal heap_bh121_w57_4 : std_logic;
signal heap_bh121_w56_4 : std_logic;
signal heap_bh121_w55_4 : std_logic;
signal heap_bh121_w54_4 : std_logic;
signal heap_bh121_w53_4 : std_logic;
signal heap_bh121_w52_4 : std_logic;
signal heap_bh121_w51_4 : std_logic;
signal heap_bh121_w50_4 : std_logic;
signal heap_bh121_w49_4 : std_logic;
signal heap_bh121_w48_4 : std_logic;
signal heap_bh121_w47_3 : std_logic;
signal heap_bh121_w46_3 : std_logic;
signal heap_bh121_w45_3 : std_logic;
signal heap_bh121_w44_3 : std_logic;
signal heap_bh121_w43_3 : std_logic;
signal heap_bh121_w42_3 : std_logic;
signal heap_bh121_w41_3 : std_logic;
signal heap_bh121_w40_3 : std_logic;
signal heap_bh121_w39_3 : std_logic;
signal heap_bh121_w38_3 : std_logic;
signal heap_bh121_w37_3 : std_logic;
signal heap_bh121_w36_3 : std_logic;
signal heap_bh121_w35_3 : std_logic;
signal heap_bh121_w34_3 : std_logic;
signal heap_bh121_w33_3 : std_logic;
signal heap_bh121_w32_3 : std_logic;
signal heap_bh121_w31_3 : std_logic;
signal DSP_bh121_ch7_0, DSP_bh121_ch7_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w47_4 : std_logic;
signal heap_bh121_w46_4 : std_logic;
signal heap_bh121_w45_4 : std_logic;
signal heap_bh121_w44_4 : std_logic;
signal heap_bh121_w43_4 : std_logic;
signal heap_bh121_w42_4 : std_logic;
signal heap_bh121_w41_4 : std_logic;
signal heap_bh121_w40_4 : std_logic;
signal heap_bh121_w39_4 : std_logic;
signal heap_bh121_w38_4 : std_logic;
signal heap_bh121_w37_4 : std_logic;
signal heap_bh121_w36_4 : std_logic;
signal heap_bh121_w35_4 : std_logic;
signal heap_bh121_w34_4 : std_logic;
signal heap_bh121_w33_4 : std_logic;
signal heap_bh121_w32_4 : std_logic;
signal heap_bh121_w31_4 : std_logic;
signal heap_bh121_w30_3 : std_logic;
signal heap_bh121_w29_3 : std_logic;
signal heap_bh121_w28_3 : std_logic;
signal heap_bh121_w27_3 : std_logic;
signal heap_bh121_w26_3 : std_logic;
signal heap_bh121_w25_3 : std_logic;
signal heap_bh121_w24_3 : std_logic;
signal heap_bh121_w23_2 : std_logic;
signal heap_bh121_w22_2 : std_logic;
signal heap_bh121_w21_2 : std_logic;
signal heap_bh121_w20_2 : std_logic;
signal heap_bh121_w19_2 : std_logic;
signal heap_bh121_w18_2 : std_logic;
signal heap_bh121_w17_2 : std_logic;
signal heap_bh121_w16_1 : std_logic;
signal heap_bh121_w15_1 : std_logic;
signal heap_bh121_w14_1 : std_logic;
signal heap_bh121_w13_1 : std_logic;
signal heap_bh121_w12_1 : std_logic;
signal heap_bh121_w11_1 : std_logic;
signal heap_bh121_w10_1 : std_logic;
signal heap_bh121_w9_1 : std_logic;
signal heap_bh121_w8_1 : std_logic;
signal heap_bh121_w7_1 : std_logic;
signal DSP_bh121_ch8_0, DSP_bh121_ch8_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w23_3 : std_logic;
signal heap_bh121_w22_3 : std_logic;
signal heap_bh121_w21_3 : std_logic;
signal heap_bh121_w20_3 : std_logic;
signal heap_bh121_w19_3 : std_logic;
signal heap_bh121_w18_3 : std_logic;
signal heap_bh121_w17_3 : std_logic;
signal heap_bh121_w16_2 : std_logic;
signal heap_bh121_w15_2 : std_logic;
signal heap_bh121_w14_2 : std_logic;
signal heap_bh121_w13_2 : std_logic;
signal heap_bh121_w12_2 : std_logic;
signal heap_bh121_w11_2 : std_logic;
signal heap_bh121_w10_2 : std_logic;
signal heap_bh121_w9_2 : std_logic;
signal heap_bh121_w8_2 : std_logic;
signal heap_bh121_w7_2 : std_logic;
signal heap_bh121_w6_1 : std_logic;
signal heap_bh121_w5_1 : std_logic;
signal heap_bh121_w4_1 : std_logic;
signal heap_bh121_w3_1 : std_logic;
signal heap_bh121_w2_1 : std_logic;
signal heap_bh121_w1_1 : std_logic;
signal heap_bh121_w0_1 : std_logic;
signal DSP_bh121_ch9_0, DSP_bh121_ch9_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w54_5 : std_logic;
signal heap_bh121_w53_5 : std_logic;
signal heap_bh121_w52_5 : std_logic;
signal heap_bh121_w51_5 : std_logic;
signal heap_bh121_w50_5 : std_logic;
signal heap_bh121_w49_5 : std_logic;
signal heap_bh121_w48_5 : std_logic;
signal heap_bh121_w47_5 : std_logic;
signal heap_bh121_w46_5 : std_logic;
signal heap_bh121_w45_5 : std_logic;
signal heap_bh121_w44_5 : std_logic;
signal heap_bh121_w43_5 : std_logic;
signal heap_bh121_w42_5 : std_logic;
signal heap_bh121_w41_5 : std_logic;
signal heap_bh121_w40_5 : std_logic;
signal heap_bh121_w39_5 : std_logic;
signal heap_bh121_w38_5 : std_logic;
signal heap_bh121_w37_5 : std_logic;
signal heap_bh121_w36_5 : std_logic;
signal heap_bh121_w35_5 : std_logic;
signal heap_bh121_w34_5 : std_logic;
signal heap_bh121_w33_5 : std_logic;
signal heap_bh121_w32_5 : std_logic;
signal heap_bh121_w31_5 : std_logic;
signal heap_bh121_w30_4 : std_logic;
signal heap_bh121_w29_4 : std_logic;
signal heap_bh121_w28_4 : std_logic;
signal heap_bh121_w27_4 : std_logic;
signal heap_bh121_w26_4 : std_logic;
signal heap_bh121_w25_4 : std_logic;
signal heap_bh121_w24_4 : std_logic;
signal heap_bh121_w23_4 : std_logic;
signal heap_bh121_w22_4 : std_logic;
signal heap_bh121_w21_4 : std_logic;
signal heap_bh121_w20_4 : std_logic;
signal heap_bh121_w19_4 : std_logic;
signal heap_bh121_w18_4 : std_logic;
signal heap_bh121_w17_4 : std_logic;
signal heap_bh121_w16_3 : std_logic;
signal heap_bh121_w15_3 : std_logic;
signal heap_bh121_w14_3 : std_logic;
signal DSP_bh121_ch10_0, DSP_bh121_ch10_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w30_5 : std_logic;
signal heap_bh121_w29_5 : std_logic;
signal heap_bh121_w28_5 : std_logic;
signal heap_bh121_w27_5 : std_logic;
signal heap_bh121_w26_5 : std_logic;
signal heap_bh121_w25_5 : std_logic;
signal heap_bh121_w24_5 : std_logic;
signal heap_bh121_w23_5 : std_logic;
signal heap_bh121_w22_5 : std_logic;
signal heap_bh121_w21_5 : std_logic;
signal heap_bh121_w20_5 : std_logic;
signal heap_bh121_w19_5 : std_logic;
signal heap_bh121_w18_5 : std_logic;
signal heap_bh121_w17_5 : std_logic;
signal heap_bh121_w16_4 : std_logic;
signal heap_bh121_w15_4 : std_logic;
signal heap_bh121_w14_4 : std_logic;
signal heap_bh121_w13_3 : std_logic;
signal heap_bh121_w12_3 : std_logic;
signal heap_bh121_w11_3 : std_logic;
signal heap_bh121_w10_3 : std_logic;
signal heap_bh121_w9_3 : std_logic;
signal heap_bh121_w8_3 : std_logic;
signal heap_bh121_w7_3 : std_logic;
signal heap_bh121_w6_2 : std_logic;
signal heap_bh121_w5_2 : std_logic;
signal heap_bh121_w4_2 : std_logic;
signal heap_bh121_w3_2 : std_logic;
signal heap_bh121_w2_2 : std_logic;
signal heap_bh121_w1_2 : std_logic;
signal heap_bh121_w0_2 : std_logic;
signal DSP_bh121_ch11_0, DSP_bh121_ch11_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh121_w6_3 : std_logic;
signal heap_bh121_w5_3 : std_logic;
signal heap_bh121_w4_3 : std_logic;
signal heap_bh121_w3_3 : std_logic;
signal heap_bh121_w2_3 : std_logic;
signal heap_bh121_w1_3 : std_logic;
signal heap_bh121_w0_3 : std_logic;
signal CompressorIn_bh121_0_0 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_0_0 :  std_logic_vector(2 downto 0);
signal heap_bh121_w17_6, heap_bh121_w17_6_d1, heap_bh121_w17_6_d2, heap_bh121_w17_6_d3, heap_bh121_w17_6_d4 : std_logic;
signal heap_bh121_w18_6 : std_logic;
signal heap_bh121_w19_6, heap_bh121_w19_6_d1, heap_bh121_w19_6_d2, heap_bh121_w19_6_d3, heap_bh121_w19_6_d4 : std_logic;
signal CompressorIn_bh121_1_1 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_1_1 :  std_logic_vector(2 downto 0);
signal heap_bh121_w18_7 : std_logic;
signal heap_bh121_w19_7 : std_logic;
signal heap_bh121_w20_6 : std_logic;
signal CompressorIn_bh121_2_2 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_2_2 :  std_logic_vector(2 downto 0);
signal heap_bh121_w19_8 : std_logic;
signal heap_bh121_w20_7 : std_logic;
signal heap_bh121_w21_6, heap_bh121_w21_6_d1, heap_bh121_w21_6_d2, heap_bh121_w21_6_d3, heap_bh121_w21_6_d4 : std_logic;
signal CompressorIn_bh121_3_3 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_3_3 :  std_logic_vector(2 downto 0);
signal heap_bh121_w20_8 : std_logic;
signal heap_bh121_w21_7 : std_logic;
signal heap_bh121_w22_6 : std_logic;
signal CompressorIn_bh121_4_4 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_4_4 :  std_logic_vector(2 downto 0);
signal heap_bh121_w21_8 : std_logic;
signal heap_bh121_w22_7 : std_logic;
signal heap_bh121_w23_6, heap_bh121_w23_6_d1, heap_bh121_w23_6_d2, heap_bh121_w23_6_d3, heap_bh121_w23_6_d4 : std_logic;
signal CompressorIn_bh121_5_5 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_5_5 :  std_logic_vector(2 downto 0);
signal heap_bh121_w22_8 : std_logic;
signal heap_bh121_w23_7 : std_logic;
signal heap_bh121_w24_6 : std_logic;
signal CompressorIn_bh121_6_6 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_6_6 :  std_logic_vector(2 downto 0);
signal heap_bh121_w23_8 : std_logic;
signal heap_bh121_w24_7 : std_logic;
signal heap_bh121_w25_6, heap_bh121_w25_6_d1, heap_bh121_w25_6_d2, heap_bh121_w25_6_d3, heap_bh121_w25_6_d4 : std_logic;
signal CompressorIn_bh121_7_7 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_7_7 :  std_logic_vector(2 downto 0);
signal heap_bh121_w24_8 : std_logic;
signal heap_bh121_w25_7 : std_logic;
signal heap_bh121_w26_6 : std_logic;
signal CompressorIn_bh121_8_8 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_8_8 :  std_logic_vector(2 downto 0);
signal heap_bh121_w25_8 : std_logic;
signal heap_bh121_w26_7 : std_logic;
signal heap_bh121_w27_6, heap_bh121_w27_6_d1, heap_bh121_w27_6_d2, heap_bh121_w27_6_d3, heap_bh121_w27_6_d4 : std_logic;
signal CompressorIn_bh121_9_9 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_9_9 :  std_logic_vector(2 downto 0);
signal heap_bh121_w26_8 : std_logic;
signal heap_bh121_w27_7 : std_logic;
signal heap_bh121_w28_6 : std_logic;
signal CompressorIn_bh121_10_10 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_10_10 :  std_logic_vector(2 downto 0);
signal heap_bh121_w27_8 : std_logic;
signal heap_bh121_w28_7 : std_logic;
signal heap_bh121_w29_6, heap_bh121_w29_6_d1, heap_bh121_w29_6_d2, heap_bh121_w29_6_d3, heap_bh121_w29_6_d4 : std_logic;
signal CompressorIn_bh121_11_11 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_11_11 :  std_logic_vector(2 downto 0);
signal heap_bh121_w28_8 : std_logic;
signal heap_bh121_w29_7 : std_logic;
signal heap_bh121_w30_6 : std_logic;
signal CompressorIn_bh121_12_12 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_12_12 :  std_logic_vector(2 downto 0);
signal heap_bh121_w29_8 : std_logic;
signal heap_bh121_w30_7 : std_logic;
signal heap_bh121_w31_6, heap_bh121_w31_6_d1, heap_bh121_w31_6_d2, heap_bh121_w31_6_d3, heap_bh121_w31_6_d4 : std_logic;
signal CompressorIn_bh121_13_13 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_13_13 :  std_logic_vector(2 downto 0);
signal heap_bh121_w30_8 : std_logic;
signal heap_bh121_w31_7 : std_logic;
signal heap_bh121_w32_6 : std_logic;
signal CompressorIn_bh121_14_14 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_14_14 :  std_logic_vector(2 downto 0);
signal heap_bh121_w31_8 : std_logic;
signal heap_bh121_w32_7 : std_logic;
signal heap_bh121_w33_6, heap_bh121_w33_6_d1, heap_bh121_w33_6_d2, heap_bh121_w33_6_d3, heap_bh121_w33_6_d4 : std_logic;
signal CompressorIn_bh121_15_15 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_15_15 :  std_logic_vector(2 downto 0);
signal heap_bh121_w32_8 : std_logic;
signal heap_bh121_w33_7 : std_logic;
signal heap_bh121_w34_6 : std_logic;
signal CompressorIn_bh121_16_16 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_16_16 :  std_logic_vector(2 downto 0);
signal heap_bh121_w33_8 : std_logic;
signal heap_bh121_w34_7 : std_logic;
signal heap_bh121_w35_6, heap_bh121_w35_6_d1, heap_bh121_w35_6_d2, heap_bh121_w35_6_d3, heap_bh121_w35_6_d4 : std_logic;
signal CompressorIn_bh121_17_17 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_17_17 :  std_logic_vector(2 downto 0);
signal heap_bh121_w34_8 : std_logic;
signal heap_bh121_w35_7 : std_logic;
signal heap_bh121_w36_6 : std_logic;
signal CompressorIn_bh121_18_18 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_18_18 :  std_logic_vector(2 downto 0);
signal heap_bh121_w35_8 : std_logic;
signal heap_bh121_w36_7 : std_logic;
signal heap_bh121_w37_6, heap_bh121_w37_6_d1, heap_bh121_w37_6_d2, heap_bh121_w37_6_d3, heap_bh121_w37_6_d4 : std_logic;
signal CompressorIn_bh121_19_19 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_19_19 :  std_logic_vector(2 downto 0);
signal heap_bh121_w36_8 : std_logic;
signal heap_bh121_w37_7 : std_logic;
signal heap_bh121_w38_6 : std_logic;
signal CompressorIn_bh121_20_20 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_20_20 :  std_logic_vector(2 downto 0);
signal heap_bh121_w37_8 : std_logic;
signal heap_bh121_w38_7 : std_logic;
signal heap_bh121_w39_6, heap_bh121_w39_6_d1, heap_bh121_w39_6_d2, heap_bh121_w39_6_d3, heap_bh121_w39_6_d4 : std_logic;
signal CompressorIn_bh121_21_21 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_21_21 :  std_logic_vector(2 downto 0);
signal heap_bh121_w38_8 : std_logic;
signal heap_bh121_w39_7 : std_logic;
signal heap_bh121_w40_6 : std_logic;
signal CompressorIn_bh121_22_22 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_22_22 :  std_logic_vector(2 downto 0);
signal heap_bh121_w39_8 : std_logic;
signal heap_bh121_w40_7 : std_logic;
signal heap_bh121_w41_6, heap_bh121_w41_6_d1, heap_bh121_w41_6_d2, heap_bh121_w41_6_d3, heap_bh121_w41_6_d4 : std_logic;
signal CompressorIn_bh121_23_23 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_23_23 :  std_logic_vector(2 downto 0);
signal heap_bh121_w40_8 : std_logic;
signal heap_bh121_w41_7 : std_logic;
signal heap_bh121_w42_6 : std_logic;
signal CompressorIn_bh121_24_24 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_24_24 :  std_logic_vector(2 downto 0);
signal heap_bh121_w41_8 : std_logic;
signal heap_bh121_w42_7 : std_logic;
signal heap_bh121_w43_6, heap_bh121_w43_6_d1, heap_bh121_w43_6_d2, heap_bh121_w43_6_d3, heap_bh121_w43_6_d4 : std_logic;
signal CompressorIn_bh121_25_25 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_25_25 :  std_logic_vector(2 downto 0);
signal heap_bh121_w42_8 : std_logic;
signal heap_bh121_w43_7 : std_logic;
signal heap_bh121_w44_6 : std_logic;
signal CompressorIn_bh121_26_26 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_26_26 :  std_logic_vector(2 downto 0);
signal heap_bh121_w43_8 : std_logic;
signal heap_bh121_w44_7 : std_logic;
signal heap_bh121_w45_6, heap_bh121_w45_6_d1, heap_bh121_w45_6_d2, heap_bh121_w45_6_d3, heap_bh121_w45_6_d4 : std_logic;
signal CompressorIn_bh121_27_27 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_27_27 :  std_logic_vector(2 downto 0);
signal heap_bh121_w44_8 : std_logic;
signal heap_bh121_w45_7 : std_logic;
signal heap_bh121_w46_6 : std_logic;
signal CompressorIn_bh121_28_28 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_28_28 :  std_logic_vector(2 downto 0);
signal heap_bh121_w45_8 : std_logic;
signal heap_bh121_w46_7 : std_logic;
signal heap_bh121_w47_6, heap_bh121_w47_6_d1, heap_bh121_w47_6_d2, heap_bh121_w47_6_d3, heap_bh121_w47_6_d4 : std_logic;
signal CompressorIn_bh121_29_29 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_29_29 :  std_logic_vector(2 downto 0);
signal heap_bh121_w46_8 : std_logic;
signal heap_bh121_w47_7 : std_logic;
signal heap_bh121_w48_6 : std_logic;
signal CompressorIn_bh121_30_30 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_30_30 :  std_logic_vector(2 downto 0);
signal heap_bh121_w47_8 : std_logic;
signal heap_bh121_w48_7 : std_logic;
signal heap_bh121_w49_6, heap_bh121_w49_6_d1, heap_bh121_w49_6_d2, heap_bh121_w49_6_d3, heap_bh121_w49_6_d4 : std_logic;
signal CompressorIn_bh121_31_31 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_31_31 :  std_logic_vector(2 downto 0);
signal heap_bh121_w48_8 : std_logic;
signal heap_bh121_w49_7 : std_logic;
signal heap_bh121_w50_6 : std_logic;
signal CompressorIn_bh121_32_32 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_32_32 :  std_logic_vector(2 downto 0);
signal heap_bh121_w49_8 : std_logic;
signal heap_bh121_w50_7 : std_logic;
signal heap_bh121_w51_6, heap_bh121_w51_6_d1, heap_bh121_w51_6_d2, heap_bh121_w51_6_d3, heap_bh121_w51_6_d4 : std_logic;
signal CompressorIn_bh121_33_33 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_33_33 :  std_logic_vector(2 downto 0);
signal heap_bh121_w50_8 : std_logic;
signal heap_bh121_w51_7 : std_logic;
signal heap_bh121_w52_6 : std_logic;
signal CompressorIn_bh121_34_34 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_34_34 :  std_logic_vector(2 downto 0);
signal heap_bh121_w51_8 : std_logic;
signal heap_bh121_w52_7 : std_logic;
signal heap_bh121_w53_6, heap_bh121_w53_6_d1, heap_bh121_w53_6_d2, heap_bh121_w53_6_d3, heap_bh121_w53_6_d4 : std_logic;
signal CompressorIn_bh121_35_35 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_35_35 :  std_logic_vector(2 downto 0);
signal heap_bh121_w52_8 : std_logic;
signal heap_bh121_w53_7 : std_logic;
signal heap_bh121_w54_6 : std_logic;
signal CompressorIn_bh121_36_36 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_36_36 :  std_logic_vector(2 downto 0);
signal heap_bh121_w53_8 : std_logic;
signal heap_bh121_w54_7 : std_logic;
signal heap_bh121_w55_5 : std_logic;
signal CompressorIn_bh121_37_37 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh121_37_37 :  std_logic_vector(2 downto 0);
signal heap_bh121_w54_8 : std_logic;
signal heap_bh121_w55_6 : std_logic;
signal heap_bh121_w56_5, heap_bh121_w56_5_d1 : std_logic;
signal CompressorIn_bh121_38_38 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_38_39 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_38_38 :  std_logic_vector(2 downto 0);
signal heap_bh121_w0_4 : std_logic;
signal heap_bh121_w1_4, heap_bh121_w1_4_d1, heap_bh121_w1_4_d2, heap_bh121_w1_4_d3, heap_bh121_w1_4_d4 : std_logic;
signal heap_bh121_w2_4 : std_logic;
signal CompressorIn_bh121_39_40 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_39_41 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_39_39 :  std_logic_vector(2 downto 0);
signal heap_bh121_w2_5 : std_logic;
signal heap_bh121_w3_4 : std_logic;
signal heap_bh121_w4_4 : std_logic;
signal CompressorIn_bh121_40_42 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_40_43 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_40_40 :  std_logic_vector(2 downto 0);
signal heap_bh121_w4_5 : std_logic;
signal heap_bh121_w5_4 : std_logic;
signal heap_bh121_w6_4 : std_logic;
signal CompressorIn_bh121_41_44 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_41_45 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_41_41 :  std_logic_vector(2 downto 0);
signal heap_bh121_w6_5 : std_logic;
signal heap_bh121_w7_4 : std_logic;
signal heap_bh121_w8_4 : std_logic;
signal CompressorIn_bh121_42_46 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_42_47 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_42_42 :  std_logic_vector(2 downto 0);
signal heap_bh121_w8_5 : std_logic;
signal heap_bh121_w9_4 : std_logic;
signal heap_bh121_w10_4 : std_logic;
signal CompressorIn_bh121_43_48 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_43_49 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_43_43 :  std_logic_vector(2 downto 0);
signal heap_bh121_w10_5 : std_logic;
signal heap_bh121_w11_4 : std_logic;
signal heap_bh121_w12_4 : std_logic;
signal CompressorIn_bh121_44_50 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_44_51 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_44_44 :  std_logic_vector(2 downto 0);
signal heap_bh121_w12_5 : std_logic;
signal heap_bh121_w13_4 : std_logic;
signal heap_bh121_w14_5 : std_logic;
signal CompressorIn_bh121_45_52 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_45_53 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_45_45 :  std_logic_vector(2 downto 0);
signal heap_bh121_w14_6 : std_logic;
signal heap_bh121_w15_5, heap_bh121_w15_5_d1, heap_bh121_w15_5_d2, heap_bh121_w15_5_d3, heap_bh121_w15_5_d4 : std_logic;
signal heap_bh121_w16_5 : std_logic;
signal CompressorIn_bh121_46_54 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_46_55 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_46_46 :  std_logic_vector(2 downto 0);
signal heap_bh121_w15_6 : std_logic;
signal heap_bh121_w16_6 : std_logic;
signal heap_bh121_w17_7 : std_logic;
signal CompressorIn_bh121_47_56 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_47_57 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_47_47 :  std_logic_vector(2 downto 0);
signal heap_bh121_w55_7 : std_logic;
signal heap_bh121_w56_6, heap_bh121_w56_6_d1 : std_logic;
signal heap_bh121_w57_5 : std_logic;
signal CompressorIn_bh121_48_58 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_48_59 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_48_48 :  std_logic_vector(2 downto 0);
signal heap_bh121_w56_7 : std_logic;
signal heap_bh121_w57_6 : std_logic;
signal heap_bh121_w58_4, heap_bh121_w58_4_d1 : std_logic;
signal CompressorIn_bh121_49_60 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_49_61 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_49_49 :  std_logic_vector(2 downto 0);
signal heap_bh121_w57_7 : std_logic;
signal heap_bh121_w58_5 : std_logic;
signal heap_bh121_w59_4 : std_logic;
signal CompressorIn_bh121_50_62 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_50_63 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_50_50 :  std_logic_vector(2 downto 0);
signal heap_bh121_w59_5 : std_logic;
signal heap_bh121_w60_4 : std_logic;
signal heap_bh121_w61_4 : std_logic;
signal CompressorIn_bh121_51_64 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_51_65 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_51_51 :  std_logic_vector(2 downto 0);
signal heap_bh121_w61_5 : std_logic;
signal heap_bh121_w62_4 : std_logic;
signal heap_bh121_w63_4 : std_logic;
signal CompressorIn_bh121_52_66 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_52_67 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_52_52 :  std_logic_vector(2 downto 0);
signal heap_bh121_w63_5 : std_logic;
signal heap_bh121_w64_4 : std_logic;
signal heap_bh121_w65_4 : std_logic;
signal CompressorIn_bh121_53_68 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_53_69 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_53_53 :  std_logic_vector(2 downto 0);
signal heap_bh121_w65_5 : std_logic;
signal heap_bh121_w66_4 : std_logic;
signal heap_bh121_w67_4 : std_logic;
signal CompressorIn_bh121_54_70 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_54_71 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_54_54 :  std_logic_vector(2 downto 0);
signal heap_bh121_w67_5 : std_logic;
signal heap_bh121_w68_4 : std_logic;
signal heap_bh121_w69_4 : std_logic;
signal CompressorIn_bh121_55_72 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_55_73 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_55_55 :  std_logic_vector(2 downto 0);
signal heap_bh121_w69_5 : std_logic;
signal heap_bh121_w70_4 : std_logic;
signal heap_bh121_w71_4 : std_logic;
signal CompressorIn_bh121_56_74 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_56_75 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_56_56 :  std_logic_vector(2 downto 0);
signal heap_bh121_w71_5 : std_logic;
signal heap_bh121_w72_3, heap_bh121_w72_3_d1, heap_bh121_w72_3_d2, heap_bh121_w72_3_d3, heap_bh121_w72_3_d4 : std_logic;
signal heap_bh121_w73_3, heap_bh121_w73_3_d1 : std_logic;
signal CompressorIn_bh121_57_76 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh121_57_57 :  std_logic_vector(2 downto 0);
signal heap_bh121_w16_7 : std_logic;
signal heap_bh121_w17_8 : std_logic;
signal heap_bh121_w18_8 : std_logic;
signal CompressorIn_bh121_58_77 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_58_78 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_58_58 :  std_logic_vector(2 downto 0);
signal heap_bh121_w73_4, heap_bh121_w73_4_d1 : std_logic;
signal heap_bh121_w74_3, heap_bh121_w74_3_d1 : std_logic;
signal heap_bh121_w75_3, heap_bh121_w75_3_d1 : std_logic;
signal CompressorIn_bh121_59_79 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_59_80 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_59_59 :  std_logic_vector(2 downto 0);
signal heap_bh121_w75_4, heap_bh121_w75_4_d1 : std_logic;
signal heap_bh121_w76_3, heap_bh121_w76_3_d1 : std_logic;
signal heap_bh121_w77_3, heap_bh121_w77_3_d1, heap_bh121_w77_3_d2 : std_logic;
signal CompressorIn_bh121_60_81 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_60_82 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_60_60 :  std_logic_vector(2 downto 0);
signal heap_bh121_w77_4, heap_bh121_w77_4_d1, heap_bh121_w77_4_d2 : std_logic;
signal heap_bh121_w78_3, heap_bh121_w78_3_d1, heap_bh121_w78_3_d2 : std_logic;
signal heap_bh121_w79_3, heap_bh121_w79_3_d1, heap_bh121_w79_3_d2 : std_logic;
signal CompressorIn_bh121_61_83 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_61_84 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_61_61 :  std_logic_vector(2 downto 0);
signal heap_bh121_w79_4, heap_bh121_w79_4_d1, heap_bh121_w79_4_d2 : std_logic;
signal heap_bh121_w80_3, heap_bh121_w80_3_d1, heap_bh121_w80_3_d2 : std_logic;
signal heap_bh121_w81_3, heap_bh121_w81_3_d1, heap_bh121_w81_3_d2, heap_bh121_w81_3_d3 : std_logic;
signal CompressorIn_bh121_62_85 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_62_86 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_62_62 :  std_logic_vector(2 downto 0);
signal heap_bh121_w81_4, heap_bh121_w81_4_d1, heap_bh121_w81_4_d2, heap_bh121_w81_4_d3 : std_logic;
signal heap_bh121_w82_2, heap_bh121_w82_2_d1, heap_bh121_w82_2_d2, heap_bh121_w82_2_d3 : std_logic;
signal heap_bh121_w83_2 : std_logic;
signal CompressorIn_bh121_63_87 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_63_88 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_63_63 :  std_logic_vector(2 downto 0);
signal heap_bh121_w13_5 : std_logic;
signal heap_bh121_w14_7 : std_logic;
signal heap_bh121_w15_7 : std_logic;
signal CompressorIn_bh121_64_89 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_64_64 :  std_logic_vector(1 downto 0);
signal heap_bh121_w1_5, heap_bh121_w1_5_d1, heap_bh121_w1_5_d2, heap_bh121_w1_5_d3, heap_bh121_w1_5_d4 : std_logic;
signal heap_bh121_w2_6 : std_logic;
signal CompressorIn_bh121_65_90 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_65_65 :  std_logic_vector(1 downto 0);
signal heap_bh121_w3_5 : std_logic;
signal heap_bh121_w4_6 : std_logic;
signal CompressorIn_bh121_66_91 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_66_66 :  std_logic_vector(1 downto 0);
signal heap_bh121_w5_5 : std_logic;
signal heap_bh121_w6_6 : std_logic;
signal CompressorIn_bh121_67_92 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_67_67 :  std_logic_vector(1 downto 0);
signal heap_bh121_w7_5 : std_logic;
signal heap_bh121_w8_6 : std_logic;
signal CompressorIn_bh121_68_93 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_68_68 :  std_logic_vector(1 downto 0);
signal heap_bh121_w9_5 : std_logic;
signal heap_bh121_w10_6 : std_logic;
signal CompressorIn_bh121_69_94 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_69_69 :  std_logic_vector(1 downto 0);
signal heap_bh121_w11_5 : std_logic;
signal heap_bh121_w12_6 : std_logic;
signal CompressorIn_bh121_70_95 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_70_70 :  std_logic_vector(1 downto 0);
signal heap_bh121_w58_6 : std_logic;
signal heap_bh121_w59_6 : std_logic;
signal CompressorIn_bh121_71_96 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_71_71 :  std_logic_vector(1 downto 0);
signal heap_bh121_w60_5 : std_logic;
signal heap_bh121_w61_6 : std_logic;
signal CompressorIn_bh121_72_97 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_72_72 :  std_logic_vector(1 downto 0);
signal heap_bh121_w62_5 : std_logic;
signal heap_bh121_w63_6 : std_logic;
signal CompressorIn_bh121_73_98 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_73_73 :  std_logic_vector(1 downto 0);
signal heap_bh121_w64_5 : std_logic;
signal heap_bh121_w65_6 : std_logic;
signal CompressorIn_bh121_74_99 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_74_74 :  std_logic_vector(1 downto 0);
signal heap_bh121_w66_5 : std_logic;
signal heap_bh121_w67_6 : std_logic;
signal CompressorIn_bh121_75_100 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_75_75 :  std_logic_vector(1 downto 0);
signal heap_bh121_w68_5 : std_logic;
signal heap_bh121_w69_6 : std_logic;
signal CompressorIn_bh121_76_101 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_76_76 :  std_logic_vector(1 downto 0);
signal heap_bh121_w70_5 : std_logic;
signal heap_bh121_w71_6 : std_logic;
signal tempR_bh121_0, tempR_bh121_0_d1, tempR_bh121_0_d2, tempR_bh121_0_d3, tempR_bh121_0_d4, tempR_bh121_0_d5, tempR_bh121_0_d6, tempR_bh121_0_d7, tempR_bh121_0_d8, tempR_bh121_0_d9 : std_logic;
signal CompressorIn_bh121_77_102 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh121_77_103 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_77_77 :  std_logic_vector(2 downto 0);
signal heap_bh121_w55_8, heap_bh121_w55_8_d1, heap_bh121_w55_8_d2, heap_bh121_w55_8_d3, heap_bh121_w55_8_d4 : std_logic;
signal heap_bh121_w56_8, heap_bh121_w56_8_d1 : std_logic;
signal heap_bh121_w57_8, heap_bh121_w57_8_d1 : std_logic;
signal CompressorIn_bh121_78_104 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_78_105 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_78_78 :  std_logic_vector(2 downto 0);
signal heap_bh121_w2_7, heap_bh121_w2_7_d1, heap_bh121_w2_7_d2, heap_bh121_w2_7_d3, heap_bh121_w2_7_d4 : std_logic;
signal heap_bh121_w3_6, heap_bh121_w3_6_d1, heap_bh121_w3_6_d2, heap_bh121_w3_6_d3, heap_bh121_w3_6_d4 : std_logic;
signal heap_bh121_w4_7, heap_bh121_w4_7_d1, heap_bh121_w4_7_d2, heap_bh121_w4_7_d3, heap_bh121_w4_7_d4 : std_logic;
signal CompressorIn_bh121_79_106 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_79_107 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_79_79 :  std_logic_vector(2 downto 0);
signal heap_bh121_w4_8, heap_bh121_w4_8_d1, heap_bh121_w4_8_d2, heap_bh121_w4_8_d3, heap_bh121_w4_8_d4 : std_logic;
signal heap_bh121_w5_6, heap_bh121_w5_6_d1, heap_bh121_w5_6_d2, heap_bh121_w5_6_d3, heap_bh121_w5_6_d4 : std_logic;
signal heap_bh121_w6_7, heap_bh121_w6_7_d1, heap_bh121_w6_7_d2, heap_bh121_w6_7_d3, heap_bh121_w6_7_d4 : std_logic;
signal CompressorIn_bh121_80_108 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_80_109 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_80_80 :  std_logic_vector(2 downto 0);
signal heap_bh121_w6_8, heap_bh121_w6_8_d1, heap_bh121_w6_8_d2, heap_bh121_w6_8_d3, heap_bh121_w6_8_d4 : std_logic;
signal heap_bh121_w7_6, heap_bh121_w7_6_d1, heap_bh121_w7_6_d2, heap_bh121_w7_6_d3, heap_bh121_w7_6_d4 : std_logic;
signal heap_bh121_w8_7, heap_bh121_w8_7_d1, heap_bh121_w8_7_d2, heap_bh121_w8_7_d3, heap_bh121_w8_7_d4 : std_logic;
signal CompressorIn_bh121_81_110 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_81_111 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_81_81 :  std_logic_vector(2 downto 0);
signal heap_bh121_w8_8, heap_bh121_w8_8_d1, heap_bh121_w8_8_d2, heap_bh121_w8_8_d3, heap_bh121_w8_8_d4 : std_logic;
signal heap_bh121_w9_6, heap_bh121_w9_6_d1, heap_bh121_w9_6_d2, heap_bh121_w9_6_d3, heap_bh121_w9_6_d4 : std_logic;
signal heap_bh121_w10_7, heap_bh121_w10_7_d1, heap_bh121_w10_7_d2, heap_bh121_w10_7_d3, heap_bh121_w10_7_d4 : std_logic;
signal CompressorIn_bh121_82_112 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_82_113 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_82_82 :  std_logic_vector(2 downto 0);
signal heap_bh121_w10_8, heap_bh121_w10_8_d1, heap_bh121_w10_8_d2, heap_bh121_w10_8_d3, heap_bh121_w10_8_d4 : std_logic;
signal heap_bh121_w11_6, heap_bh121_w11_6_d1, heap_bh121_w11_6_d2, heap_bh121_w11_6_d3, heap_bh121_w11_6_d4 : std_logic;
signal heap_bh121_w12_7, heap_bh121_w12_7_d1, heap_bh121_w12_7_d2, heap_bh121_w12_7_d3, heap_bh121_w12_7_d4 : std_logic;
signal CompressorIn_bh121_83_114 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_83_115 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_83_83 :  std_logic_vector(2 downto 0);
signal heap_bh121_w12_8, heap_bh121_w12_8_d1, heap_bh121_w12_8_d2, heap_bh121_w12_8_d3, heap_bh121_w12_8_d4 : std_logic;
signal heap_bh121_w13_6, heap_bh121_w13_6_d1, heap_bh121_w13_6_d2, heap_bh121_w13_6_d3, heap_bh121_w13_6_d4 : std_logic;
signal heap_bh121_w14_8, heap_bh121_w14_8_d1, heap_bh121_w14_8_d2, heap_bh121_w14_8_d3, heap_bh121_w14_8_d4 : std_logic;
signal CompressorIn_bh121_84_116 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_84_117 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_84_84 :  std_logic_vector(2 downto 0);
signal heap_bh121_w14_9, heap_bh121_w14_9_d1, heap_bh121_w14_9_d2, heap_bh121_w14_9_d3, heap_bh121_w14_9_d4 : std_logic;
signal heap_bh121_w15_8, heap_bh121_w15_8_d1, heap_bh121_w15_8_d2, heap_bh121_w15_8_d3, heap_bh121_w15_8_d4 : std_logic;
signal heap_bh121_w16_8, heap_bh121_w16_8_d1, heap_bh121_w16_8_d2, heap_bh121_w16_8_d3, heap_bh121_w16_8_d4 : std_logic;
signal CompressorIn_bh121_85_118 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_85_119 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_85_85 :  std_logic_vector(2 downto 0);
signal heap_bh121_w16_9, heap_bh121_w16_9_d1, heap_bh121_w16_9_d2, heap_bh121_w16_9_d3, heap_bh121_w16_9_d4 : std_logic;
signal heap_bh121_w17_9, heap_bh121_w17_9_d1, heap_bh121_w17_9_d2, heap_bh121_w17_9_d3, heap_bh121_w17_9_d4 : std_logic;
signal heap_bh121_w18_9, heap_bh121_w18_9_d1, heap_bh121_w18_9_d2, heap_bh121_w18_9_d3, heap_bh121_w18_9_d4 : std_logic;
signal CompressorIn_bh121_86_120 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_86_121 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_86_86 :  std_logic_vector(2 downto 0);
signal heap_bh121_w18_10, heap_bh121_w18_10_d1, heap_bh121_w18_10_d2, heap_bh121_w18_10_d3, heap_bh121_w18_10_d4 : std_logic;
signal heap_bh121_w19_9, heap_bh121_w19_9_d1, heap_bh121_w19_9_d2, heap_bh121_w19_9_d3, heap_bh121_w19_9_d4 : std_logic;
signal heap_bh121_w20_9, heap_bh121_w20_9_d1, heap_bh121_w20_9_d2, heap_bh121_w20_9_d3, heap_bh121_w20_9_d4 : std_logic;
signal CompressorIn_bh121_87_122 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_87_123 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_87_87 :  std_logic_vector(2 downto 0);
signal heap_bh121_w20_10, heap_bh121_w20_10_d1, heap_bh121_w20_10_d2, heap_bh121_w20_10_d3, heap_bh121_w20_10_d4 : std_logic;
signal heap_bh121_w21_9, heap_bh121_w21_9_d1, heap_bh121_w21_9_d2, heap_bh121_w21_9_d3, heap_bh121_w21_9_d4 : std_logic;
signal heap_bh121_w22_9, heap_bh121_w22_9_d1, heap_bh121_w22_9_d2, heap_bh121_w22_9_d3, heap_bh121_w22_9_d4 : std_logic;
signal CompressorIn_bh121_88_124 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_88_125 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_88_88 :  std_logic_vector(2 downto 0);
signal heap_bh121_w22_10, heap_bh121_w22_10_d1, heap_bh121_w22_10_d2, heap_bh121_w22_10_d3, heap_bh121_w22_10_d4 : std_logic;
signal heap_bh121_w23_9, heap_bh121_w23_9_d1, heap_bh121_w23_9_d2, heap_bh121_w23_9_d3, heap_bh121_w23_9_d4 : std_logic;
signal heap_bh121_w24_9, heap_bh121_w24_9_d1, heap_bh121_w24_9_d2, heap_bh121_w24_9_d3, heap_bh121_w24_9_d4 : std_logic;
signal CompressorIn_bh121_89_126 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_89_127 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_89_89 :  std_logic_vector(2 downto 0);
signal heap_bh121_w24_10, heap_bh121_w24_10_d1, heap_bh121_w24_10_d2, heap_bh121_w24_10_d3, heap_bh121_w24_10_d4 : std_logic;
signal heap_bh121_w25_9, heap_bh121_w25_9_d1, heap_bh121_w25_9_d2, heap_bh121_w25_9_d3, heap_bh121_w25_9_d4 : std_logic;
signal heap_bh121_w26_9, heap_bh121_w26_9_d1, heap_bh121_w26_9_d2, heap_bh121_w26_9_d3, heap_bh121_w26_9_d4 : std_logic;
signal CompressorIn_bh121_90_128 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_90_129 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_90_90 :  std_logic_vector(2 downto 0);
signal heap_bh121_w26_10, heap_bh121_w26_10_d1, heap_bh121_w26_10_d2, heap_bh121_w26_10_d3, heap_bh121_w26_10_d4 : std_logic;
signal heap_bh121_w27_9, heap_bh121_w27_9_d1, heap_bh121_w27_9_d2, heap_bh121_w27_9_d3, heap_bh121_w27_9_d4 : std_logic;
signal heap_bh121_w28_9, heap_bh121_w28_9_d1, heap_bh121_w28_9_d2, heap_bh121_w28_9_d3, heap_bh121_w28_9_d4 : std_logic;
signal CompressorIn_bh121_91_130 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_91_131 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_91_91 :  std_logic_vector(2 downto 0);
signal heap_bh121_w28_10, heap_bh121_w28_10_d1, heap_bh121_w28_10_d2, heap_bh121_w28_10_d3, heap_bh121_w28_10_d4 : std_logic;
signal heap_bh121_w29_9, heap_bh121_w29_9_d1, heap_bh121_w29_9_d2, heap_bh121_w29_9_d3, heap_bh121_w29_9_d4 : std_logic;
signal heap_bh121_w30_9, heap_bh121_w30_9_d1, heap_bh121_w30_9_d2, heap_bh121_w30_9_d3, heap_bh121_w30_9_d4 : std_logic;
signal CompressorIn_bh121_92_132 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_92_133 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_92_92 :  std_logic_vector(2 downto 0);
signal heap_bh121_w30_10, heap_bh121_w30_10_d1, heap_bh121_w30_10_d2, heap_bh121_w30_10_d3, heap_bh121_w30_10_d4 : std_logic;
signal heap_bh121_w31_9, heap_bh121_w31_9_d1, heap_bh121_w31_9_d2, heap_bh121_w31_9_d3, heap_bh121_w31_9_d4 : std_logic;
signal heap_bh121_w32_9, heap_bh121_w32_9_d1, heap_bh121_w32_9_d2, heap_bh121_w32_9_d3, heap_bh121_w32_9_d4 : std_logic;
signal CompressorIn_bh121_93_134 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_93_135 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_93_93 :  std_logic_vector(2 downto 0);
signal heap_bh121_w32_10, heap_bh121_w32_10_d1, heap_bh121_w32_10_d2, heap_bh121_w32_10_d3, heap_bh121_w32_10_d4 : std_logic;
signal heap_bh121_w33_9, heap_bh121_w33_9_d1, heap_bh121_w33_9_d2, heap_bh121_w33_9_d3, heap_bh121_w33_9_d4 : std_logic;
signal heap_bh121_w34_9, heap_bh121_w34_9_d1, heap_bh121_w34_9_d2, heap_bh121_w34_9_d3, heap_bh121_w34_9_d4 : std_logic;
signal CompressorIn_bh121_94_136 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_94_137 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_94_94 :  std_logic_vector(2 downto 0);
signal heap_bh121_w34_10, heap_bh121_w34_10_d1, heap_bh121_w34_10_d2, heap_bh121_w34_10_d3, heap_bh121_w34_10_d4 : std_logic;
signal heap_bh121_w35_9, heap_bh121_w35_9_d1, heap_bh121_w35_9_d2, heap_bh121_w35_9_d3, heap_bh121_w35_9_d4 : std_logic;
signal heap_bh121_w36_9, heap_bh121_w36_9_d1, heap_bh121_w36_9_d2, heap_bh121_w36_9_d3, heap_bh121_w36_9_d4 : std_logic;
signal CompressorIn_bh121_95_138 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_95_139 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_95_95 :  std_logic_vector(2 downto 0);
signal heap_bh121_w36_10, heap_bh121_w36_10_d1, heap_bh121_w36_10_d2, heap_bh121_w36_10_d3, heap_bh121_w36_10_d4 : std_logic;
signal heap_bh121_w37_9, heap_bh121_w37_9_d1, heap_bh121_w37_9_d2, heap_bh121_w37_9_d3, heap_bh121_w37_9_d4 : std_logic;
signal heap_bh121_w38_9, heap_bh121_w38_9_d1, heap_bh121_w38_9_d2, heap_bh121_w38_9_d3, heap_bh121_w38_9_d4 : std_logic;
signal CompressorIn_bh121_96_140 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_96_141 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_96_96 :  std_logic_vector(2 downto 0);
signal heap_bh121_w38_10, heap_bh121_w38_10_d1, heap_bh121_w38_10_d2, heap_bh121_w38_10_d3, heap_bh121_w38_10_d4 : std_logic;
signal heap_bh121_w39_9, heap_bh121_w39_9_d1, heap_bh121_w39_9_d2, heap_bh121_w39_9_d3, heap_bh121_w39_9_d4 : std_logic;
signal heap_bh121_w40_9, heap_bh121_w40_9_d1, heap_bh121_w40_9_d2, heap_bh121_w40_9_d3, heap_bh121_w40_9_d4 : std_logic;
signal CompressorIn_bh121_97_142 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_97_143 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_97_97 :  std_logic_vector(2 downto 0);
signal heap_bh121_w40_10, heap_bh121_w40_10_d1, heap_bh121_w40_10_d2, heap_bh121_w40_10_d3, heap_bh121_w40_10_d4 : std_logic;
signal heap_bh121_w41_9, heap_bh121_w41_9_d1, heap_bh121_w41_9_d2, heap_bh121_w41_9_d3, heap_bh121_w41_9_d4 : std_logic;
signal heap_bh121_w42_9, heap_bh121_w42_9_d1, heap_bh121_w42_9_d2, heap_bh121_w42_9_d3, heap_bh121_w42_9_d4 : std_logic;
signal CompressorIn_bh121_98_144 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_98_145 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_98_98 :  std_logic_vector(2 downto 0);
signal heap_bh121_w42_10, heap_bh121_w42_10_d1, heap_bh121_w42_10_d2, heap_bh121_w42_10_d3, heap_bh121_w42_10_d4 : std_logic;
signal heap_bh121_w43_9, heap_bh121_w43_9_d1, heap_bh121_w43_9_d2, heap_bh121_w43_9_d3, heap_bh121_w43_9_d4 : std_logic;
signal heap_bh121_w44_9, heap_bh121_w44_9_d1, heap_bh121_w44_9_d2, heap_bh121_w44_9_d3, heap_bh121_w44_9_d4 : std_logic;
signal CompressorIn_bh121_99_146 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_99_147 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_99_99 :  std_logic_vector(2 downto 0);
signal heap_bh121_w44_10, heap_bh121_w44_10_d1, heap_bh121_w44_10_d2, heap_bh121_w44_10_d3, heap_bh121_w44_10_d4 : std_logic;
signal heap_bh121_w45_9, heap_bh121_w45_9_d1, heap_bh121_w45_9_d2, heap_bh121_w45_9_d3, heap_bh121_w45_9_d4 : std_logic;
signal heap_bh121_w46_9, heap_bh121_w46_9_d1, heap_bh121_w46_9_d2, heap_bh121_w46_9_d3, heap_bh121_w46_9_d4 : std_logic;
signal CompressorIn_bh121_100_148 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_100_149 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_100_100 :  std_logic_vector(2 downto 0);
signal heap_bh121_w46_10, heap_bh121_w46_10_d1, heap_bh121_w46_10_d2, heap_bh121_w46_10_d3, heap_bh121_w46_10_d4 : std_logic;
signal heap_bh121_w47_9, heap_bh121_w47_9_d1, heap_bh121_w47_9_d2, heap_bh121_w47_9_d3, heap_bh121_w47_9_d4 : std_logic;
signal heap_bh121_w48_9, heap_bh121_w48_9_d1, heap_bh121_w48_9_d2, heap_bh121_w48_9_d3, heap_bh121_w48_9_d4 : std_logic;
signal CompressorIn_bh121_101_150 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_101_151 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_101_101 :  std_logic_vector(2 downto 0);
signal heap_bh121_w48_10, heap_bh121_w48_10_d1, heap_bh121_w48_10_d2, heap_bh121_w48_10_d3, heap_bh121_w48_10_d4 : std_logic;
signal heap_bh121_w49_9, heap_bh121_w49_9_d1, heap_bh121_w49_9_d2, heap_bh121_w49_9_d3, heap_bh121_w49_9_d4 : std_logic;
signal heap_bh121_w50_9, heap_bh121_w50_9_d1, heap_bh121_w50_9_d2, heap_bh121_w50_9_d3, heap_bh121_w50_9_d4 : std_logic;
signal CompressorIn_bh121_102_152 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_102_153 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_102_102 :  std_logic_vector(2 downto 0);
signal heap_bh121_w50_10, heap_bh121_w50_10_d1, heap_bh121_w50_10_d2, heap_bh121_w50_10_d3, heap_bh121_w50_10_d4 : std_logic;
signal heap_bh121_w51_9, heap_bh121_w51_9_d1, heap_bh121_w51_9_d2, heap_bh121_w51_9_d3, heap_bh121_w51_9_d4 : std_logic;
signal heap_bh121_w52_9, heap_bh121_w52_9_d1, heap_bh121_w52_9_d2, heap_bh121_w52_9_d3, heap_bh121_w52_9_d4 : std_logic;
signal CompressorIn_bh121_103_154 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_103_155 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_103_103 :  std_logic_vector(2 downto 0);
signal heap_bh121_w52_10, heap_bh121_w52_10_d1, heap_bh121_w52_10_d2, heap_bh121_w52_10_d3, heap_bh121_w52_10_d4 : std_logic;
signal heap_bh121_w53_9, heap_bh121_w53_9_d1, heap_bh121_w53_9_d2, heap_bh121_w53_9_d3, heap_bh121_w53_9_d4 : std_logic;
signal heap_bh121_w54_9, heap_bh121_w54_9_d1, heap_bh121_w54_9_d2, heap_bh121_w54_9_d3, heap_bh121_w54_9_d4 : std_logic;
signal CompressorIn_bh121_104_156 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_104_157 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_104_104 :  std_logic_vector(2 downto 0);
signal heap_bh121_w57_9, heap_bh121_w57_9_d1 : std_logic;
signal heap_bh121_w58_7, heap_bh121_w58_7_d1 : std_logic;
signal heap_bh121_w59_7, heap_bh121_w59_7_d1 : std_logic;
signal CompressorIn_bh121_105_158 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_105_159 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_105_105 :  std_logic_vector(2 downto 0);
signal heap_bh121_w59_8, heap_bh121_w59_8_d1 : std_logic;
signal heap_bh121_w60_6, heap_bh121_w60_6_d1, heap_bh121_w60_6_d2, heap_bh121_w60_6_d3, heap_bh121_w60_6_d4 : std_logic;
signal heap_bh121_w61_7, heap_bh121_w61_7_d1, heap_bh121_w61_7_d2, heap_bh121_w61_7_d3, heap_bh121_w61_7_d4 : std_logic;
signal CompressorIn_bh121_106_160 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_106_161 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_106_106 :  std_logic_vector(2 downto 0);
signal heap_bh121_w61_8, heap_bh121_w61_8_d1, heap_bh121_w61_8_d2, heap_bh121_w61_8_d3, heap_bh121_w61_8_d4 : std_logic;
signal heap_bh121_w62_6, heap_bh121_w62_6_d1, heap_bh121_w62_6_d2, heap_bh121_w62_6_d3, heap_bh121_w62_6_d4 : std_logic;
signal heap_bh121_w63_7, heap_bh121_w63_7_d1, heap_bh121_w63_7_d2, heap_bh121_w63_7_d3, heap_bh121_w63_7_d4 : std_logic;
signal CompressorIn_bh121_107_162 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_107_163 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_107_107 :  std_logic_vector(2 downto 0);
signal heap_bh121_w63_8, heap_bh121_w63_8_d1, heap_bh121_w63_8_d2, heap_bh121_w63_8_d3, heap_bh121_w63_8_d4 : std_logic;
signal heap_bh121_w64_6, heap_bh121_w64_6_d1, heap_bh121_w64_6_d2, heap_bh121_w64_6_d3, heap_bh121_w64_6_d4 : std_logic;
signal heap_bh121_w65_7, heap_bh121_w65_7_d1, heap_bh121_w65_7_d2, heap_bh121_w65_7_d3, heap_bh121_w65_7_d4 : std_logic;
signal CompressorIn_bh121_108_164 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_108_165 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_108_108 :  std_logic_vector(2 downto 0);
signal heap_bh121_w65_8, heap_bh121_w65_8_d1, heap_bh121_w65_8_d2, heap_bh121_w65_8_d3, heap_bh121_w65_8_d4 : std_logic;
signal heap_bh121_w66_6, heap_bh121_w66_6_d1, heap_bh121_w66_6_d2, heap_bh121_w66_6_d3, heap_bh121_w66_6_d4 : std_logic;
signal heap_bh121_w67_7, heap_bh121_w67_7_d1, heap_bh121_w67_7_d2, heap_bh121_w67_7_d3, heap_bh121_w67_7_d4 : std_logic;
signal CompressorIn_bh121_109_166 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_109_167 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_109_109 :  std_logic_vector(2 downto 0);
signal heap_bh121_w67_8, heap_bh121_w67_8_d1, heap_bh121_w67_8_d2, heap_bh121_w67_8_d3, heap_bh121_w67_8_d4 : std_logic;
signal heap_bh121_w68_6, heap_bh121_w68_6_d1, heap_bh121_w68_6_d2, heap_bh121_w68_6_d3, heap_bh121_w68_6_d4 : std_logic;
signal heap_bh121_w69_7, heap_bh121_w69_7_d1, heap_bh121_w69_7_d2, heap_bh121_w69_7_d3, heap_bh121_w69_7_d4 : std_logic;
signal CompressorIn_bh121_110_168 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_110_169 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_110_110 :  std_logic_vector(2 downto 0);
signal heap_bh121_w69_8, heap_bh121_w69_8_d1, heap_bh121_w69_8_d2, heap_bh121_w69_8_d3, heap_bh121_w69_8_d4 : std_logic;
signal heap_bh121_w70_6, heap_bh121_w70_6_d1, heap_bh121_w70_6_d2, heap_bh121_w70_6_d3, heap_bh121_w70_6_d4 : std_logic;
signal heap_bh121_w71_7, heap_bh121_w71_7_d1, heap_bh121_w71_7_d2, heap_bh121_w71_7_d3, heap_bh121_w71_7_d4 : std_logic;
signal CompressorIn_bh121_111_170 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_111_171 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_111_111 :  std_logic_vector(2 downto 0);
signal heap_bh121_w71_8, heap_bh121_w71_8_d1, heap_bh121_w71_8_d2, heap_bh121_w71_8_d3, heap_bh121_w71_8_d4 : std_logic;
signal heap_bh121_w72_4, heap_bh121_w72_4_d1, heap_bh121_w72_4_d2, heap_bh121_w72_4_d3, heap_bh121_w72_4_d4 : std_logic;
signal heap_bh121_w73_5, heap_bh121_w73_5_d1 : std_logic;
signal CompressorIn_bh121_112_172 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_112_173 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_112_112 :  std_logic_vector(2 downto 0);
signal heap_bh121_w83_3, heap_bh121_w83_3_d1, heap_bh121_w83_3_d2, heap_bh121_w83_3_d3, heap_bh121_w83_3_d4 : std_logic;
signal heap_bh121_w84_2, heap_bh121_w84_2_d1, heap_bh121_w84_2_d2, heap_bh121_w84_2_d3, heap_bh121_w84_2_d4 : std_logic;
signal heap_bh121_w85_2, heap_bh121_w85_2_d1 : std_logic;
signal CompressorIn_bh121_113_174 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh121_113_113 :  std_logic_vector(1 downto 0);
signal heap_bh121_w54_10, heap_bh121_w54_10_d1, heap_bh121_w54_10_d2, heap_bh121_w54_10_d3, heap_bh121_w54_10_d4 : std_logic;
signal heap_bh121_w55_9, heap_bh121_w55_9_d1, heap_bh121_w55_9_d2, heap_bh121_w55_9_d3, heap_bh121_w55_9_d4 : std_logic;
signal CompressorIn_bh121_114_175 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_114_176 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_114_114 :  std_logic_vector(2 downto 0);
signal heap_bh121_w56_9, heap_bh121_w56_9_d1, heap_bh121_w56_9_d2, heap_bh121_w56_9_d3 : std_logic;
signal heap_bh121_w57_10, heap_bh121_w57_10_d1, heap_bh121_w57_10_d2, heap_bh121_w57_10_d3 : std_logic;
signal heap_bh121_w58_8 : std_logic;
signal CompressorIn_bh121_115_177 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_115_178 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_115_115 :  std_logic_vector(2 downto 0);
signal heap_bh121_w73_6, heap_bh121_w73_6_d1, heap_bh121_w73_6_d2, heap_bh121_w73_6_d3 : std_logic;
signal heap_bh121_w74_4, heap_bh121_w74_4_d1, heap_bh121_w74_4_d2, heap_bh121_w74_4_d3 : std_logic;
signal heap_bh121_w75_5 : std_logic;
signal CompressorIn_bh121_116_179 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_116_180 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_116_116 :  std_logic_vector(2 downto 0);
signal heap_bh121_w85_3, heap_bh121_w85_3_d1, heap_bh121_w85_3_d2, heap_bh121_w85_3_d3 : std_logic;
signal heap_bh121_w86_2, heap_bh121_w86_2_d1, heap_bh121_w86_2_d2, heap_bh121_w86_2_d3 : std_logic;
signal heap_bh121_w87_2 : std_logic;
signal CompressorIn_bh121_117_181 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_117_182 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_117_117 :  std_logic_vector(2 downto 0);
signal heap_bh121_w58_9, heap_bh121_w58_9_d1, heap_bh121_w58_9_d2, heap_bh121_w58_9_d3 : std_logic;
signal heap_bh121_w59_9, heap_bh121_w59_9_d1, heap_bh121_w59_9_d2, heap_bh121_w59_9_d3 : std_logic;
signal heap_bh121_w60_7, heap_bh121_w60_7_d1, heap_bh121_w60_7_d2, heap_bh121_w60_7_d3 : std_logic;
signal CompressorIn_bh121_118_183 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_118_184 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_118_118 :  std_logic_vector(2 downto 0);
signal heap_bh121_w75_6, heap_bh121_w75_6_d1, heap_bh121_w75_6_d2, heap_bh121_w75_6_d3 : std_logic;
signal heap_bh121_w76_4, heap_bh121_w76_4_d1, heap_bh121_w76_4_d2, heap_bh121_w76_4_d3 : std_logic;
signal heap_bh121_w77_5, heap_bh121_w77_5_d1 : std_logic;
signal CompressorIn_bh121_119_185 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_119_186 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_119_119 :  std_logic_vector(2 downto 0);
signal heap_bh121_w87_3, heap_bh121_w87_3_d1, heap_bh121_w87_3_d2, heap_bh121_w87_3_d3 : std_logic;
signal heap_bh121_w88_2, heap_bh121_w88_2_d1, heap_bh121_w88_2_d2, heap_bh121_w88_2_d3 : std_logic;
signal heap_bh121_w89_1, heap_bh121_w89_1_d1, heap_bh121_w89_1_d2, heap_bh121_w89_1_d3 : std_logic;
signal CompressorIn_bh121_120_187 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_120_188 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_120_120 :  std_logic_vector(2 downto 0);
signal heap_bh121_w77_6, heap_bh121_w77_6_d1, heap_bh121_w77_6_d2 : std_logic;
signal heap_bh121_w78_4, heap_bh121_w78_4_d1, heap_bh121_w78_4_d2 : std_logic;
signal heap_bh121_w79_5 : std_logic;
signal CompressorIn_bh121_121_189 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_121_190 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh121_121_121 :  std_logic_vector(2 downto 0);
signal heap_bh121_w79_6, heap_bh121_w79_6_d1, heap_bh121_w79_6_d2 : std_logic;
signal heap_bh121_w80_4, heap_bh121_w80_4_d1, heap_bh121_w80_4_d2 : std_logic;
signal heap_bh121_w81_5, heap_bh121_w81_5_d1 : std_logic;
signal CompressorIn_bh121_122_191 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh121_122_192 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh121_122_122 :  std_logic_vector(2 downto 0);
signal heap_bh121_w81_6, heap_bh121_w81_6_d1 : std_logic;
signal heap_bh121_w82_3, heap_bh121_w82_3_d1 : std_logic;
signal heap_bh121_w83_4, heap_bh121_w83_4_d1 : std_logic;
signal finalAdderIn0_bh121 :  std_logic_vector(105 downto 0);
signal finalAdderIn1_bh121 :  std_logic_vector(105 downto 0);
signal finalAdderCin_bh121 : std_logic;
signal finalAdderOut_bh121 :  std_logic_vector(105 downto 0);
signal CompressionResult121 :  std_logic_vector(106 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            DSP_bh121_ch0_0_d1 <=  DSP_bh121_ch0_0;
            heap_bh121_w105_0_d1 <=  heap_bh121_w105_0;
            heap_bh121_w105_0_d2 <=  heap_bh121_w105_0_d1;
            heap_bh121_w105_0_d3 <=  heap_bh121_w105_0_d2;
            heap_bh121_w105_0_d4 <=  heap_bh121_w105_0_d3;
            heap_bh121_w104_0_d1 <=  heap_bh121_w104_0;
            heap_bh121_w104_0_d2 <=  heap_bh121_w104_0_d1;
            heap_bh121_w104_0_d3 <=  heap_bh121_w104_0_d2;
            heap_bh121_w104_0_d4 <=  heap_bh121_w104_0_d3;
            heap_bh121_w103_0_d1 <=  heap_bh121_w103_0;
            heap_bh121_w103_0_d2 <=  heap_bh121_w103_0_d1;
            heap_bh121_w103_0_d3 <=  heap_bh121_w103_0_d2;
            heap_bh121_w103_0_d4 <=  heap_bh121_w103_0_d3;
            heap_bh121_w102_0_d1 <=  heap_bh121_w102_0;
            heap_bh121_w102_0_d2 <=  heap_bh121_w102_0_d1;
            heap_bh121_w102_0_d3 <=  heap_bh121_w102_0_d2;
            heap_bh121_w102_0_d4 <=  heap_bh121_w102_0_d3;
            heap_bh121_w101_0_d1 <=  heap_bh121_w101_0;
            heap_bh121_w101_0_d2 <=  heap_bh121_w101_0_d1;
            heap_bh121_w101_0_d3 <=  heap_bh121_w101_0_d2;
            heap_bh121_w101_0_d4 <=  heap_bh121_w101_0_d3;
            heap_bh121_w100_0_d1 <=  heap_bh121_w100_0;
            heap_bh121_w100_0_d2 <=  heap_bh121_w100_0_d1;
            heap_bh121_w100_0_d3 <=  heap_bh121_w100_0_d2;
            heap_bh121_w100_0_d4 <=  heap_bh121_w100_0_d3;
            heap_bh121_w99_0_d1 <=  heap_bh121_w99_0;
            heap_bh121_w99_0_d2 <=  heap_bh121_w99_0_d1;
            heap_bh121_w99_0_d3 <=  heap_bh121_w99_0_d2;
            heap_bh121_w99_0_d4 <=  heap_bh121_w99_0_d3;
            heap_bh121_w98_0_d1 <=  heap_bh121_w98_0;
            heap_bh121_w98_0_d2 <=  heap_bh121_w98_0_d1;
            heap_bh121_w98_0_d3 <=  heap_bh121_w98_0_d2;
            heap_bh121_w98_0_d4 <=  heap_bh121_w98_0_d3;
            heap_bh121_w97_0_d1 <=  heap_bh121_w97_0;
            heap_bh121_w97_0_d2 <=  heap_bh121_w97_0_d1;
            heap_bh121_w97_0_d3 <=  heap_bh121_w97_0_d2;
            heap_bh121_w97_0_d4 <=  heap_bh121_w97_0_d3;
            heap_bh121_w96_0_d1 <=  heap_bh121_w96_0;
            heap_bh121_w96_0_d2 <=  heap_bh121_w96_0_d1;
            heap_bh121_w96_0_d3 <=  heap_bh121_w96_0_d2;
            heap_bh121_w96_0_d4 <=  heap_bh121_w96_0_d3;
            heap_bh121_w95_0_d1 <=  heap_bh121_w95_0;
            heap_bh121_w95_0_d2 <=  heap_bh121_w95_0_d1;
            heap_bh121_w95_0_d3 <=  heap_bh121_w95_0_d2;
            heap_bh121_w95_0_d4 <=  heap_bh121_w95_0_d3;
            heap_bh121_w94_0_d1 <=  heap_bh121_w94_0;
            heap_bh121_w94_0_d2 <=  heap_bh121_w94_0_d1;
            heap_bh121_w94_0_d3 <=  heap_bh121_w94_0_d2;
            heap_bh121_w94_0_d4 <=  heap_bh121_w94_0_d3;
            heap_bh121_w93_0_d1 <=  heap_bh121_w93_0;
            heap_bh121_w93_0_d2 <=  heap_bh121_w93_0_d1;
            heap_bh121_w93_0_d3 <=  heap_bh121_w93_0_d2;
            heap_bh121_w93_0_d4 <=  heap_bh121_w93_0_d3;
            heap_bh121_w92_0_d1 <=  heap_bh121_w92_0;
            heap_bh121_w92_0_d2 <=  heap_bh121_w92_0_d1;
            heap_bh121_w92_0_d3 <=  heap_bh121_w92_0_d2;
            heap_bh121_w92_0_d4 <=  heap_bh121_w92_0_d3;
            heap_bh121_w91_0_d1 <=  heap_bh121_w91_0;
            heap_bh121_w91_0_d2 <=  heap_bh121_w91_0_d1;
            heap_bh121_w91_0_d3 <=  heap_bh121_w91_0_d2;
            heap_bh121_w91_0_d4 <=  heap_bh121_w91_0_d3;
            heap_bh121_w90_0_d1 <=  heap_bh121_w90_0;
            heap_bh121_w90_0_d2 <=  heap_bh121_w90_0_d1;
            heap_bh121_w90_0_d3 <=  heap_bh121_w90_0_d2;
            heap_bh121_w90_0_d4 <=  heap_bh121_w90_0_d3;
            heap_bh121_w89_0_d1 <=  heap_bh121_w89_0;
            heap_bh121_w89_0_d2 <=  heap_bh121_w89_0_d1;
            heap_bh121_w89_0_d3 <=  heap_bh121_w89_0_d2;
            heap_bh121_w89_0_d4 <=  heap_bh121_w89_0_d3;
            heap_bh121_w88_0_d1 <=  heap_bh121_w88_0;
            heap_bh121_w87_0_d1 <=  heap_bh121_w87_0;
            heap_bh121_w86_0_d1 <=  heap_bh121_w86_0;
            heap_bh121_w85_0_d1 <=  heap_bh121_w85_0;
            heap_bh121_w80_0_d1 <=  heap_bh121_w80_0;
            heap_bh121_w80_0_d2 <=  heap_bh121_w80_0_d1;
            heap_bh121_w78_0_d1 <=  heap_bh121_w78_0;
            heap_bh121_w78_0_d2 <=  heap_bh121_w78_0_d1;
            heap_bh121_w76_0_d1 <=  heap_bh121_w76_0;
            heap_bh121_w74_0_d1 <=  heap_bh121_w74_0;
            DSP_bh121_ch1_0_d1 <=  DSP_bh121_ch1_0;
            DSP_bh121_ch2_0_d1 <=  DSP_bh121_ch2_0;
            DSP_bh121_ch3_0_d1 <=  DSP_bh121_ch3_0;
            heap_bh121_w88_1_d1 <=  heap_bh121_w88_1;
            heap_bh121_w87_1_d1 <=  heap_bh121_w87_1;
            heap_bh121_w86_1_d1 <=  heap_bh121_w86_1;
            heap_bh121_w85_1_d1 <=  heap_bh121_w85_1;
            DSP_bh121_ch4_0_d1 <=  DSP_bh121_ch4_0;
            DSP_bh121_ch5_0_d1 <=  DSP_bh121_ch5_0;
            DSP_bh121_ch6_0_d1 <=  DSP_bh121_ch6_0;
            DSP_bh121_ch7_0_d1 <=  DSP_bh121_ch7_0;
            DSP_bh121_ch8_0_d1 <=  DSP_bh121_ch8_0;
            DSP_bh121_ch9_0_d1 <=  DSP_bh121_ch9_0;
            DSP_bh121_ch10_0_d1 <=  DSP_bh121_ch10_0;
            DSP_bh121_ch11_0_d1 <=  DSP_bh121_ch11_0;
            heap_bh121_w17_6_d1 <=  heap_bh121_w17_6;
            heap_bh121_w17_6_d2 <=  heap_bh121_w17_6_d1;
            heap_bh121_w17_6_d3 <=  heap_bh121_w17_6_d2;
            heap_bh121_w17_6_d4 <=  heap_bh121_w17_6_d3;
            heap_bh121_w19_6_d1 <=  heap_bh121_w19_6;
            heap_bh121_w19_6_d2 <=  heap_bh121_w19_6_d1;
            heap_bh121_w19_6_d3 <=  heap_bh121_w19_6_d2;
            heap_bh121_w19_6_d4 <=  heap_bh121_w19_6_d3;
            heap_bh121_w21_6_d1 <=  heap_bh121_w21_6;
            heap_bh121_w21_6_d2 <=  heap_bh121_w21_6_d1;
            heap_bh121_w21_6_d3 <=  heap_bh121_w21_6_d2;
            heap_bh121_w21_6_d4 <=  heap_bh121_w21_6_d3;
            heap_bh121_w23_6_d1 <=  heap_bh121_w23_6;
            heap_bh121_w23_6_d2 <=  heap_bh121_w23_6_d1;
            heap_bh121_w23_6_d3 <=  heap_bh121_w23_6_d2;
            heap_bh121_w23_6_d4 <=  heap_bh121_w23_6_d3;
            heap_bh121_w25_6_d1 <=  heap_bh121_w25_6;
            heap_bh121_w25_6_d2 <=  heap_bh121_w25_6_d1;
            heap_bh121_w25_6_d3 <=  heap_bh121_w25_6_d2;
            heap_bh121_w25_6_d4 <=  heap_bh121_w25_6_d3;
            heap_bh121_w27_6_d1 <=  heap_bh121_w27_6;
            heap_bh121_w27_6_d2 <=  heap_bh121_w27_6_d1;
            heap_bh121_w27_6_d3 <=  heap_bh121_w27_6_d2;
            heap_bh121_w27_6_d4 <=  heap_bh121_w27_6_d3;
            heap_bh121_w29_6_d1 <=  heap_bh121_w29_6;
            heap_bh121_w29_6_d2 <=  heap_bh121_w29_6_d1;
            heap_bh121_w29_6_d3 <=  heap_bh121_w29_6_d2;
            heap_bh121_w29_6_d4 <=  heap_bh121_w29_6_d3;
            heap_bh121_w31_6_d1 <=  heap_bh121_w31_6;
            heap_bh121_w31_6_d2 <=  heap_bh121_w31_6_d1;
            heap_bh121_w31_6_d3 <=  heap_bh121_w31_6_d2;
            heap_bh121_w31_6_d4 <=  heap_bh121_w31_6_d3;
            heap_bh121_w33_6_d1 <=  heap_bh121_w33_6;
            heap_bh121_w33_6_d2 <=  heap_bh121_w33_6_d1;
            heap_bh121_w33_6_d3 <=  heap_bh121_w33_6_d2;
            heap_bh121_w33_6_d4 <=  heap_bh121_w33_6_d3;
            heap_bh121_w35_6_d1 <=  heap_bh121_w35_6;
            heap_bh121_w35_6_d2 <=  heap_bh121_w35_6_d1;
            heap_bh121_w35_6_d3 <=  heap_bh121_w35_6_d2;
            heap_bh121_w35_6_d4 <=  heap_bh121_w35_6_d3;
            heap_bh121_w37_6_d1 <=  heap_bh121_w37_6;
            heap_bh121_w37_6_d2 <=  heap_bh121_w37_6_d1;
            heap_bh121_w37_6_d3 <=  heap_bh121_w37_6_d2;
            heap_bh121_w37_6_d4 <=  heap_bh121_w37_6_d3;
            heap_bh121_w39_6_d1 <=  heap_bh121_w39_6;
            heap_bh121_w39_6_d2 <=  heap_bh121_w39_6_d1;
            heap_bh121_w39_6_d3 <=  heap_bh121_w39_6_d2;
            heap_bh121_w39_6_d4 <=  heap_bh121_w39_6_d3;
            heap_bh121_w41_6_d1 <=  heap_bh121_w41_6;
            heap_bh121_w41_6_d2 <=  heap_bh121_w41_6_d1;
            heap_bh121_w41_6_d3 <=  heap_bh121_w41_6_d2;
            heap_bh121_w41_6_d4 <=  heap_bh121_w41_6_d3;
            heap_bh121_w43_6_d1 <=  heap_bh121_w43_6;
            heap_bh121_w43_6_d2 <=  heap_bh121_w43_6_d1;
            heap_bh121_w43_6_d3 <=  heap_bh121_w43_6_d2;
            heap_bh121_w43_6_d4 <=  heap_bh121_w43_6_d3;
            heap_bh121_w45_6_d1 <=  heap_bh121_w45_6;
            heap_bh121_w45_6_d2 <=  heap_bh121_w45_6_d1;
            heap_bh121_w45_6_d3 <=  heap_bh121_w45_6_d2;
            heap_bh121_w45_6_d4 <=  heap_bh121_w45_6_d3;
            heap_bh121_w47_6_d1 <=  heap_bh121_w47_6;
            heap_bh121_w47_6_d2 <=  heap_bh121_w47_6_d1;
            heap_bh121_w47_6_d3 <=  heap_bh121_w47_6_d2;
            heap_bh121_w47_6_d4 <=  heap_bh121_w47_6_d3;
            heap_bh121_w49_6_d1 <=  heap_bh121_w49_6;
            heap_bh121_w49_6_d2 <=  heap_bh121_w49_6_d1;
            heap_bh121_w49_6_d3 <=  heap_bh121_w49_6_d2;
            heap_bh121_w49_6_d4 <=  heap_bh121_w49_6_d3;
            heap_bh121_w51_6_d1 <=  heap_bh121_w51_6;
            heap_bh121_w51_6_d2 <=  heap_bh121_w51_6_d1;
            heap_bh121_w51_6_d3 <=  heap_bh121_w51_6_d2;
            heap_bh121_w51_6_d4 <=  heap_bh121_w51_6_d3;
            heap_bh121_w53_6_d1 <=  heap_bh121_w53_6;
            heap_bh121_w53_6_d2 <=  heap_bh121_w53_6_d1;
            heap_bh121_w53_6_d3 <=  heap_bh121_w53_6_d2;
            heap_bh121_w53_6_d4 <=  heap_bh121_w53_6_d3;
            heap_bh121_w56_5_d1 <=  heap_bh121_w56_5;
            heap_bh121_w1_4_d1 <=  heap_bh121_w1_4;
            heap_bh121_w1_4_d2 <=  heap_bh121_w1_4_d1;
            heap_bh121_w1_4_d3 <=  heap_bh121_w1_4_d2;
            heap_bh121_w1_4_d4 <=  heap_bh121_w1_4_d3;
            heap_bh121_w15_5_d1 <=  heap_bh121_w15_5;
            heap_bh121_w15_5_d2 <=  heap_bh121_w15_5_d1;
            heap_bh121_w15_5_d3 <=  heap_bh121_w15_5_d2;
            heap_bh121_w15_5_d4 <=  heap_bh121_w15_5_d3;
            heap_bh121_w56_6_d1 <=  heap_bh121_w56_6;
            heap_bh121_w58_4_d1 <=  heap_bh121_w58_4;
            heap_bh121_w72_3_d1 <=  heap_bh121_w72_3;
            heap_bh121_w72_3_d2 <=  heap_bh121_w72_3_d1;
            heap_bh121_w72_3_d3 <=  heap_bh121_w72_3_d2;
            heap_bh121_w72_3_d4 <=  heap_bh121_w72_3_d3;
            heap_bh121_w73_3_d1 <=  heap_bh121_w73_3;
            heap_bh121_w73_4_d1 <=  heap_bh121_w73_4;
            heap_bh121_w74_3_d1 <=  heap_bh121_w74_3;
            heap_bh121_w75_3_d1 <=  heap_bh121_w75_3;
            heap_bh121_w75_4_d1 <=  heap_bh121_w75_4;
            heap_bh121_w76_3_d1 <=  heap_bh121_w76_3;
            heap_bh121_w77_3_d1 <=  heap_bh121_w77_3;
            heap_bh121_w77_3_d2 <=  heap_bh121_w77_3_d1;
            heap_bh121_w77_4_d1 <=  heap_bh121_w77_4;
            heap_bh121_w77_4_d2 <=  heap_bh121_w77_4_d1;
            heap_bh121_w78_3_d1 <=  heap_bh121_w78_3;
            heap_bh121_w78_3_d2 <=  heap_bh121_w78_3_d1;
            heap_bh121_w79_3_d1 <=  heap_bh121_w79_3;
            heap_bh121_w79_3_d2 <=  heap_bh121_w79_3_d1;
            heap_bh121_w79_4_d1 <=  heap_bh121_w79_4;
            heap_bh121_w79_4_d2 <=  heap_bh121_w79_4_d1;
            heap_bh121_w80_3_d1 <=  heap_bh121_w80_3;
            heap_bh121_w80_3_d2 <=  heap_bh121_w80_3_d1;
            heap_bh121_w81_3_d1 <=  heap_bh121_w81_3;
            heap_bh121_w81_3_d2 <=  heap_bh121_w81_3_d1;
            heap_bh121_w81_3_d3 <=  heap_bh121_w81_3_d2;
            heap_bh121_w81_4_d1 <=  heap_bh121_w81_4;
            heap_bh121_w81_4_d2 <=  heap_bh121_w81_4_d1;
            heap_bh121_w81_4_d3 <=  heap_bh121_w81_4_d2;
            heap_bh121_w82_2_d1 <=  heap_bh121_w82_2;
            heap_bh121_w82_2_d2 <=  heap_bh121_w82_2_d1;
            heap_bh121_w82_2_d3 <=  heap_bh121_w82_2_d2;
            heap_bh121_w1_5_d1 <=  heap_bh121_w1_5;
            heap_bh121_w1_5_d2 <=  heap_bh121_w1_5_d1;
            heap_bh121_w1_5_d3 <=  heap_bh121_w1_5_d2;
            heap_bh121_w1_5_d4 <=  heap_bh121_w1_5_d3;
            tempR_bh121_0_d1 <=  tempR_bh121_0;
            tempR_bh121_0_d2 <=  tempR_bh121_0_d1;
            tempR_bh121_0_d3 <=  tempR_bh121_0_d2;
            tempR_bh121_0_d4 <=  tempR_bh121_0_d3;
            tempR_bh121_0_d5 <=  tempR_bh121_0_d4;
            tempR_bh121_0_d6 <=  tempR_bh121_0_d5;
            tempR_bh121_0_d7 <=  tempR_bh121_0_d6;
            tempR_bh121_0_d8 <=  tempR_bh121_0_d7;
            tempR_bh121_0_d9 <=  tempR_bh121_0_d8;
            heap_bh121_w55_8_d1 <=  heap_bh121_w55_8;
            heap_bh121_w55_8_d2 <=  heap_bh121_w55_8_d1;
            heap_bh121_w55_8_d3 <=  heap_bh121_w55_8_d2;
            heap_bh121_w55_8_d4 <=  heap_bh121_w55_8_d3;
            heap_bh121_w56_8_d1 <=  heap_bh121_w56_8;
            heap_bh121_w57_8_d1 <=  heap_bh121_w57_8;
            heap_bh121_w2_7_d1 <=  heap_bh121_w2_7;
            heap_bh121_w2_7_d2 <=  heap_bh121_w2_7_d1;
            heap_bh121_w2_7_d3 <=  heap_bh121_w2_7_d2;
            heap_bh121_w2_7_d4 <=  heap_bh121_w2_7_d3;
            heap_bh121_w3_6_d1 <=  heap_bh121_w3_6;
            heap_bh121_w3_6_d2 <=  heap_bh121_w3_6_d1;
            heap_bh121_w3_6_d3 <=  heap_bh121_w3_6_d2;
            heap_bh121_w3_6_d4 <=  heap_bh121_w3_6_d3;
            heap_bh121_w4_7_d1 <=  heap_bh121_w4_7;
            heap_bh121_w4_7_d2 <=  heap_bh121_w4_7_d1;
            heap_bh121_w4_7_d3 <=  heap_bh121_w4_7_d2;
            heap_bh121_w4_7_d4 <=  heap_bh121_w4_7_d3;
            heap_bh121_w4_8_d1 <=  heap_bh121_w4_8;
            heap_bh121_w4_8_d2 <=  heap_bh121_w4_8_d1;
            heap_bh121_w4_8_d3 <=  heap_bh121_w4_8_d2;
            heap_bh121_w4_8_d4 <=  heap_bh121_w4_8_d3;
            heap_bh121_w5_6_d1 <=  heap_bh121_w5_6;
            heap_bh121_w5_6_d2 <=  heap_bh121_w5_6_d1;
            heap_bh121_w5_6_d3 <=  heap_bh121_w5_6_d2;
            heap_bh121_w5_6_d4 <=  heap_bh121_w5_6_d3;
            heap_bh121_w6_7_d1 <=  heap_bh121_w6_7;
            heap_bh121_w6_7_d2 <=  heap_bh121_w6_7_d1;
            heap_bh121_w6_7_d3 <=  heap_bh121_w6_7_d2;
            heap_bh121_w6_7_d4 <=  heap_bh121_w6_7_d3;
            heap_bh121_w6_8_d1 <=  heap_bh121_w6_8;
            heap_bh121_w6_8_d2 <=  heap_bh121_w6_8_d1;
            heap_bh121_w6_8_d3 <=  heap_bh121_w6_8_d2;
            heap_bh121_w6_8_d4 <=  heap_bh121_w6_8_d3;
            heap_bh121_w7_6_d1 <=  heap_bh121_w7_6;
            heap_bh121_w7_6_d2 <=  heap_bh121_w7_6_d1;
            heap_bh121_w7_6_d3 <=  heap_bh121_w7_6_d2;
            heap_bh121_w7_6_d4 <=  heap_bh121_w7_6_d3;
            heap_bh121_w8_7_d1 <=  heap_bh121_w8_7;
            heap_bh121_w8_7_d2 <=  heap_bh121_w8_7_d1;
            heap_bh121_w8_7_d3 <=  heap_bh121_w8_7_d2;
            heap_bh121_w8_7_d4 <=  heap_bh121_w8_7_d3;
            heap_bh121_w8_8_d1 <=  heap_bh121_w8_8;
            heap_bh121_w8_8_d2 <=  heap_bh121_w8_8_d1;
            heap_bh121_w8_8_d3 <=  heap_bh121_w8_8_d2;
            heap_bh121_w8_8_d4 <=  heap_bh121_w8_8_d3;
            heap_bh121_w9_6_d1 <=  heap_bh121_w9_6;
            heap_bh121_w9_6_d2 <=  heap_bh121_w9_6_d1;
            heap_bh121_w9_6_d3 <=  heap_bh121_w9_6_d2;
            heap_bh121_w9_6_d4 <=  heap_bh121_w9_6_d3;
            heap_bh121_w10_7_d1 <=  heap_bh121_w10_7;
            heap_bh121_w10_7_d2 <=  heap_bh121_w10_7_d1;
            heap_bh121_w10_7_d3 <=  heap_bh121_w10_7_d2;
            heap_bh121_w10_7_d4 <=  heap_bh121_w10_7_d3;
            heap_bh121_w10_8_d1 <=  heap_bh121_w10_8;
            heap_bh121_w10_8_d2 <=  heap_bh121_w10_8_d1;
            heap_bh121_w10_8_d3 <=  heap_bh121_w10_8_d2;
            heap_bh121_w10_8_d4 <=  heap_bh121_w10_8_d3;
            heap_bh121_w11_6_d1 <=  heap_bh121_w11_6;
            heap_bh121_w11_6_d2 <=  heap_bh121_w11_6_d1;
            heap_bh121_w11_6_d3 <=  heap_bh121_w11_6_d2;
            heap_bh121_w11_6_d4 <=  heap_bh121_w11_6_d3;
            heap_bh121_w12_7_d1 <=  heap_bh121_w12_7;
            heap_bh121_w12_7_d2 <=  heap_bh121_w12_7_d1;
            heap_bh121_w12_7_d3 <=  heap_bh121_w12_7_d2;
            heap_bh121_w12_7_d4 <=  heap_bh121_w12_7_d3;
            heap_bh121_w12_8_d1 <=  heap_bh121_w12_8;
            heap_bh121_w12_8_d2 <=  heap_bh121_w12_8_d1;
            heap_bh121_w12_8_d3 <=  heap_bh121_w12_8_d2;
            heap_bh121_w12_8_d4 <=  heap_bh121_w12_8_d3;
            heap_bh121_w13_6_d1 <=  heap_bh121_w13_6;
            heap_bh121_w13_6_d2 <=  heap_bh121_w13_6_d1;
            heap_bh121_w13_6_d3 <=  heap_bh121_w13_6_d2;
            heap_bh121_w13_6_d4 <=  heap_bh121_w13_6_d3;
            heap_bh121_w14_8_d1 <=  heap_bh121_w14_8;
            heap_bh121_w14_8_d2 <=  heap_bh121_w14_8_d1;
            heap_bh121_w14_8_d3 <=  heap_bh121_w14_8_d2;
            heap_bh121_w14_8_d4 <=  heap_bh121_w14_8_d3;
            heap_bh121_w14_9_d1 <=  heap_bh121_w14_9;
            heap_bh121_w14_9_d2 <=  heap_bh121_w14_9_d1;
            heap_bh121_w14_9_d3 <=  heap_bh121_w14_9_d2;
            heap_bh121_w14_9_d4 <=  heap_bh121_w14_9_d3;
            heap_bh121_w15_8_d1 <=  heap_bh121_w15_8;
            heap_bh121_w15_8_d2 <=  heap_bh121_w15_8_d1;
            heap_bh121_w15_8_d3 <=  heap_bh121_w15_8_d2;
            heap_bh121_w15_8_d4 <=  heap_bh121_w15_8_d3;
            heap_bh121_w16_8_d1 <=  heap_bh121_w16_8;
            heap_bh121_w16_8_d2 <=  heap_bh121_w16_8_d1;
            heap_bh121_w16_8_d3 <=  heap_bh121_w16_8_d2;
            heap_bh121_w16_8_d4 <=  heap_bh121_w16_8_d3;
            heap_bh121_w16_9_d1 <=  heap_bh121_w16_9;
            heap_bh121_w16_9_d2 <=  heap_bh121_w16_9_d1;
            heap_bh121_w16_9_d3 <=  heap_bh121_w16_9_d2;
            heap_bh121_w16_9_d4 <=  heap_bh121_w16_9_d3;
            heap_bh121_w17_9_d1 <=  heap_bh121_w17_9;
            heap_bh121_w17_9_d2 <=  heap_bh121_w17_9_d1;
            heap_bh121_w17_9_d3 <=  heap_bh121_w17_9_d2;
            heap_bh121_w17_9_d4 <=  heap_bh121_w17_9_d3;
            heap_bh121_w18_9_d1 <=  heap_bh121_w18_9;
            heap_bh121_w18_9_d2 <=  heap_bh121_w18_9_d1;
            heap_bh121_w18_9_d3 <=  heap_bh121_w18_9_d2;
            heap_bh121_w18_9_d4 <=  heap_bh121_w18_9_d3;
            heap_bh121_w18_10_d1 <=  heap_bh121_w18_10;
            heap_bh121_w18_10_d2 <=  heap_bh121_w18_10_d1;
            heap_bh121_w18_10_d3 <=  heap_bh121_w18_10_d2;
            heap_bh121_w18_10_d4 <=  heap_bh121_w18_10_d3;
            heap_bh121_w19_9_d1 <=  heap_bh121_w19_9;
            heap_bh121_w19_9_d2 <=  heap_bh121_w19_9_d1;
            heap_bh121_w19_9_d3 <=  heap_bh121_w19_9_d2;
            heap_bh121_w19_9_d4 <=  heap_bh121_w19_9_d3;
            heap_bh121_w20_9_d1 <=  heap_bh121_w20_9;
            heap_bh121_w20_9_d2 <=  heap_bh121_w20_9_d1;
            heap_bh121_w20_9_d3 <=  heap_bh121_w20_9_d2;
            heap_bh121_w20_9_d4 <=  heap_bh121_w20_9_d3;
            heap_bh121_w20_10_d1 <=  heap_bh121_w20_10;
            heap_bh121_w20_10_d2 <=  heap_bh121_w20_10_d1;
            heap_bh121_w20_10_d3 <=  heap_bh121_w20_10_d2;
            heap_bh121_w20_10_d4 <=  heap_bh121_w20_10_d3;
            heap_bh121_w21_9_d1 <=  heap_bh121_w21_9;
            heap_bh121_w21_9_d2 <=  heap_bh121_w21_9_d1;
            heap_bh121_w21_9_d3 <=  heap_bh121_w21_9_d2;
            heap_bh121_w21_9_d4 <=  heap_bh121_w21_9_d3;
            heap_bh121_w22_9_d1 <=  heap_bh121_w22_9;
            heap_bh121_w22_9_d2 <=  heap_bh121_w22_9_d1;
            heap_bh121_w22_9_d3 <=  heap_bh121_w22_9_d2;
            heap_bh121_w22_9_d4 <=  heap_bh121_w22_9_d3;
            heap_bh121_w22_10_d1 <=  heap_bh121_w22_10;
            heap_bh121_w22_10_d2 <=  heap_bh121_w22_10_d1;
            heap_bh121_w22_10_d3 <=  heap_bh121_w22_10_d2;
            heap_bh121_w22_10_d4 <=  heap_bh121_w22_10_d3;
            heap_bh121_w23_9_d1 <=  heap_bh121_w23_9;
            heap_bh121_w23_9_d2 <=  heap_bh121_w23_9_d1;
            heap_bh121_w23_9_d3 <=  heap_bh121_w23_9_d2;
            heap_bh121_w23_9_d4 <=  heap_bh121_w23_9_d3;
            heap_bh121_w24_9_d1 <=  heap_bh121_w24_9;
            heap_bh121_w24_9_d2 <=  heap_bh121_w24_9_d1;
            heap_bh121_w24_9_d3 <=  heap_bh121_w24_9_d2;
            heap_bh121_w24_9_d4 <=  heap_bh121_w24_9_d3;
            heap_bh121_w24_10_d1 <=  heap_bh121_w24_10;
            heap_bh121_w24_10_d2 <=  heap_bh121_w24_10_d1;
            heap_bh121_w24_10_d3 <=  heap_bh121_w24_10_d2;
            heap_bh121_w24_10_d4 <=  heap_bh121_w24_10_d3;
            heap_bh121_w25_9_d1 <=  heap_bh121_w25_9;
            heap_bh121_w25_9_d2 <=  heap_bh121_w25_9_d1;
            heap_bh121_w25_9_d3 <=  heap_bh121_w25_9_d2;
            heap_bh121_w25_9_d4 <=  heap_bh121_w25_9_d3;
            heap_bh121_w26_9_d1 <=  heap_bh121_w26_9;
            heap_bh121_w26_9_d2 <=  heap_bh121_w26_9_d1;
            heap_bh121_w26_9_d3 <=  heap_bh121_w26_9_d2;
            heap_bh121_w26_9_d4 <=  heap_bh121_w26_9_d3;
            heap_bh121_w26_10_d1 <=  heap_bh121_w26_10;
            heap_bh121_w26_10_d2 <=  heap_bh121_w26_10_d1;
            heap_bh121_w26_10_d3 <=  heap_bh121_w26_10_d2;
            heap_bh121_w26_10_d4 <=  heap_bh121_w26_10_d3;
            heap_bh121_w27_9_d1 <=  heap_bh121_w27_9;
            heap_bh121_w27_9_d2 <=  heap_bh121_w27_9_d1;
            heap_bh121_w27_9_d3 <=  heap_bh121_w27_9_d2;
            heap_bh121_w27_9_d4 <=  heap_bh121_w27_9_d3;
            heap_bh121_w28_9_d1 <=  heap_bh121_w28_9;
            heap_bh121_w28_9_d2 <=  heap_bh121_w28_9_d1;
            heap_bh121_w28_9_d3 <=  heap_bh121_w28_9_d2;
            heap_bh121_w28_9_d4 <=  heap_bh121_w28_9_d3;
            heap_bh121_w28_10_d1 <=  heap_bh121_w28_10;
            heap_bh121_w28_10_d2 <=  heap_bh121_w28_10_d1;
            heap_bh121_w28_10_d3 <=  heap_bh121_w28_10_d2;
            heap_bh121_w28_10_d4 <=  heap_bh121_w28_10_d3;
            heap_bh121_w29_9_d1 <=  heap_bh121_w29_9;
            heap_bh121_w29_9_d2 <=  heap_bh121_w29_9_d1;
            heap_bh121_w29_9_d3 <=  heap_bh121_w29_9_d2;
            heap_bh121_w29_9_d4 <=  heap_bh121_w29_9_d3;
            heap_bh121_w30_9_d1 <=  heap_bh121_w30_9;
            heap_bh121_w30_9_d2 <=  heap_bh121_w30_9_d1;
            heap_bh121_w30_9_d3 <=  heap_bh121_w30_9_d2;
            heap_bh121_w30_9_d4 <=  heap_bh121_w30_9_d3;
            heap_bh121_w30_10_d1 <=  heap_bh121_w30_10;
            heap_bh121_w30_10_d2 <=  heap_bh121_w30_10_d1;
            heap_bh121_w30_10_d3 <=  heap_bh121_w30_10_d2;
            heap_bh121_w30_10_d4 <=  heap_bh121_w30_10_d3;
            heap_bh121_w31_9_d1 <=  heap_bh121_w31_9;
            heap_bh121_w31_9_d2 <=  heap_bh121_w31_9_d1;
            heap_bh121_w31_9_d3 <=  heap_bh121_w31_9_d2;
            heap_bh121_w31_9_d4 <=  heap_bh121_w31_9_d3;
            heap_bh121_w32_9_d1 <=  heap_bh121_w32_9;
            heap_bh121_w32_9_d2 <=  heap_bh121_w32_9_d1;
            heap_bh121_w32_9_d3 <=  heap_bh121_w32_9_d2;
            heap_bh121_w32_9_d4 <=  heap_bh121_w32_9_d3;
            heap_bh121_w32_10_d1 <=  heap_bh121_w32_10;
            heap_bh121_w32_10_d2 <=  heap_bh121_w32_10_d1;
            heap_bh121_w32_10_d3 <=  heap_bh121_w32_10_d2;
            heap_bh121_w32_10_d4 <=  heap_bh121_w32_10_d3;
            heap_bh121_w33_9_d1 <=  heap_bh121_w33_9;
            heap_bh121_w33_9_d2 <=  heap_bh121_w33_9_d1;
            heap_bh121_w33_9_d3 <=  heap_bh121_w33_9_d2;
            heap_bh121_w33_9_d4 <=  heap_bh121_w33_9_d3;
            heap_bh121_w34_9_d1 <=  heap_bh121_w34_9;
            heap_bh121_w34_9_d2 <=  heap_bh121_w34_9_d1;
            heap_bh121_w34_9_d3 <=  heap_bh121_w34_9_d2;
            heap_bh121_w34_9_d4 <=  heap_bh121_w34_9_d3;
            heap_bh121_w34_10_d1 <=  heap_bh121_w34_10;
            heap_bh121_w34_10_d2 <=  heap_bh121_w34_10_d1;
            heap_bh121_w34_10_d3 <=  heap_bh121_w34_10_d2;
            heap_bh121_w34_10_d4 <=  heap_bh121_w34_10_d3;
            heap_bh121_w35_9_d1 <=  heap_bh121_w35_9;
            heap_bh121_w35_9_d2 <=  heap_bh121_w35_9_d1;
            heap_bh121_w35_9_d3 <=  heap_bh121_w35_9_d2;
            heap_bh121_w35_9_d4 <=  heap_bh121_w35_9_d3;
            heap_bh121_w36_9_d1 <=  heap_bh121_w36_9;
            heap_bh121_w36_9_d2 <=  heap_bh121_w36_9_d1;
            heap_bh121_w36_9_d3 <=  heap_bh121_w36_9_d2;
            heap_bh121_w36_9_d4 <=  heap_bh121_w36_9_d3;
            heap_bh121_w36_10_d1 <=  heap_bh121_w36_10;
            heap_bh121_w36_10_d2 <=  heap_bh121_w36_10_d1;
            heap_bh121_w36_10_d3 <=  heap_bh121_w36_10_d2;
            heap_bh121_w36_10_d4 <=  heap_bh121_w36_10_d3;
            heap_bh121_w37_9_d1 <=  heap_bh121_w37_9;
            heap_bh121_w37_9_d2 <=  heap_bh121_w37_9_d1;
            heap_bh121_w37_9_d3 <=  heap_bh121_w37_9_d2;
            heap_bh121_w37_9_d4 <=  heap_bh121_w37_9_d3;
            heap_bh121_w38_9_d1 <=  heap_bh121_w38_9;
            heap_bh121_w38_9_d2 <=  heap_bh121_w38_9_d1;
            heap_bh121_w38_9_d3 <=  heap_bh121_w38_9_d2;
            heap_bh121_w38_9_d4 <=  heap_bh121_w38_9_d3;
            heap_bh121_w38_10_d1 <=  heap_bh121_w38_10;
            heap_bh121_w38_10_d2 <=  heap_bh121_w38_10_d1;
            heap_bh121_w38_10_d3 <=  heap_bh121_w38_10_d2;
            heap_bh121_w38_10_d4 <=  heap_bh121_w38_10_d3;
            heap_bh121_w39_9_d1 <=  heap_bh121_w39_9;
            heap_bh121_w39_9_d2 <=  heap_bh121_w39_9_d1;
            heap_bh121_w39_9_d3 <=  heap_bh121_w39_9_d2;
            heap_bh121_w39_9_d4 <=  heap_bh121_w39_9_d3;
            heap_bh121_w40_9_d1 <=  heap_bh121_w40_9;
            heap_bh121_w40_9_d2 <=  heap_bh121_w40_9_d1;
            heap_bh121_w40_9_d3 <=  heap_bh121_w40_9_d2;
            heap_bh121_w40_9_d4 <=  heap_bh121_w40_9_d3;
            heap_bh121_w40_10_d1 <=  heap_bh121_w40_10;
            heap_bh121_w40_10_d2 <=  heap_bh121_w40_10_d1;
            heap_bh121_w40_10_d3 <=  heap_bh121_w40_10_d2;
            heap_bh121_w40_10_d4 <=  heap_bh121_w40_10_d3;
            heap_bh121_w41_9_d1 <=  heap_bh121_w41_9;
            heap_bh121_w41_9_d2 <=  heap_bh121_w41_9_d1;
            heap_bh121_w41_9_d3 <=  heap_bh121_w41_9_d2;
            heap_bh121_w41_9_d4 <=  heap_bh121_w41_9_d3;
            heap_bh121_w42_9_d1 <=  heap_bh121_w42_9;
            heap_bh121_w42_9_d2 <=  heap_bh121_w42_9_d1;
            heap_bh121_w42_9_d3 <=  heap_bh121_w42_9_d2;
            heap_bh121_w42_9_d4 <=  heap_bh121_w42_9_d3;
            heap_bh121_w42_10_d1 <=  heap_bh121_w42_10;
            heap_bh121_w42_10_d2 <=  heap_bh121_w42_10_d1;
            heap_bh121_w42_10_d3 <=  heap_bh121_w42_10_d2;
            heap_bh121_w42_10_d4 <=  heap_bh121_w42_10_d3;
            heap_bh121_w43_9_d1 <=  heap_bh121_w43_9;
            heap_bh121_w43_9_d2 <=  heap_bh121_w43_9_d1;
            heap_bh121_w43_9_d3 <=  heap_bh121_w43_9_d2;
            heap_bh121_w43_9_d4 <=  heap_bh121_w43_9_d3;
            heap_bh121_w44_9_d1 <=  heap_bh121_w44_9;
            heap_bh121_w44_9_d2 <=  heap_bh121_w44_9_d1;
            heap_bh121_w44_9_d3 <=  heap_bh121_w44_9_d2;
            heap_bh121_w44_9_d4 <=  heap_bh121_w44_9_d3;
            heap_bh121_w44_10_d1 <=  heap_bh121_w44_10;
            heap_bh121_w44_10_d2 <=  heap_bh121_w44_10_d1;
            heap_bh121_w44_10_d3 <=  heap_bh121_w44_10_d2;
            heap_bh121_w44_10_d4 <=  heap_bh121_w44_10_d3;
            heap_bh121_w45_9_d1 <=  heap_bh121_w45_9;
            heap_bh121_w45_9_d2 <=  heap_bh121_w45_9_d1;
            heap_bh121_w45_9_d3 <=  heap_bh121_w45_9_d2;
            heap_bh121_w45_9_d4 <=  heap_bh121_w45_9_d3;
            heap_bh121_w46_9_d1 <=  heap_bh121_w46_9;
            heap_bh121_w46_9_d2 <=  heap_bh121_w46_9_d1;
            heap_bh121_w46_9_d3 <=  heap_bh121_w46_9_d2;
            heap_bh121_w46_9_d4 <=  heap_bh121_w46_9_d3;
            heap_bh121_w46_10_d1 <=  heap_bh121_w46_10;
            heap_bh121_w46_10_d2 <=  heap_bh121_w46_10_d1;
            heap_bh121_w46_10_d3 <=  heap_bh121_w46_10_d2;
            heap_bh121_w46_10_d4 <=  heap_bh121_w46_10_d3;
            heap_bh121_w47_9_d1 <=  heap_bh121_w47_9;
            heap_bh121_w47_9_d2 <=  heap_bh121_w47_9_d1;
            heap_bh121_w47_9_d3 <=  heap_bh121_w47_9_d2;
            heap_bh121_w47_9_d4 <=  heap_bh121_w47_9_d3;
            heap_bh121_w48_9_d1 <=  heap_bh121_w48_9;
            heap_bh121_w48_9_d2 <=  heap_bh121_w48_9_d1;
            heap_bh121_w48_9_d3 <=  heap_bh121_w48_9_d2;
            heap_bh121_w48_9_d4 <=  heap_bh121_w48_9_d3;
            heap_bh121_w48_10_d1 <=  heap_bh121_w48_10;
            heap_bh121_w48_10_d2 <=  heap_bh121_w48_10_d1;
            heap_bh121_w48_10_d3 <=  heap_bh121_w48_10_d2;
            heap_bh121_w48_10_d4 <=  heap_bh121_w48_10_d3;
            heap_bh121_w49_9_d1 <=  heap_bh121_w49_9;
            heap_bh121_w49_9_d2 <=  heap_bh121_w49_9_d1;
            heap_bh121_w49_9_d3 <=  heap_bh121_w49_9_d2;
            heap_bh121_w49_9_d4 <=  heap_bh121_w49_9_d3;
            heap_bh121_w50_9_d1 <=  heap_bh121_w50_9;
            heap_bh121_w50_9_d2 <=  heap_bh121_w50_9_d1;
            heap_bh121_w50_9_d3 <=  heap_bh121_w50_9_d2;
            heap_bh121_w50_9_d4 <=  heap_bh121_w50_9_d3;
            heap_bh121_w50_10_d1 <=  heap_bh121_w50_10;
            heap_bh121_w50_10_d2 <=  heap_bh121_w50_10_d1;
            heap_bh121_w50_10_d3 <=  heap_bh121_w50_10_d2;
            heap_bh121_w50_10_d4 <=  heap_bh121_w50_10_d3;
            heap_bh121_w51_9_d1 <=  heap_bh121_w51_9;
            heap_bh121_w51_9_d2 <=  heap_bh121_w51_9_d1;
            heap_bh121_w51_9_d3 <=  heap_bh121_w51_9_d2;
            heap_bh121_w51_9_d4 <=  heap_bh121_w51_9_d3;
            heap_bh121_w52_9_d1 <=  heap_bh121_w52_9;
            heap_bh121_w52_9_d2 <=  heap_bh121_w52_9_d1;
            heap_bh121_w52_9_d3 <=  heap_bh121_w52_9_d2;
            heap_bh121_w52_9_d4 <=  heap_bh121_w52_9_d3;
            heap_bh121_w52_10_d1 <=  heap_bh121_w52_10;
            heap_bh121_w52_10_d2 <=  heap_bh121_w52_10_d1;
            heap_bh121_w52_10_d3 <=  heap_bh121_w52_10_d2;
            heap_bh121_w52_10_d4 <=  heap_bh121_w52_10_d3;
            heap_bh121_w53_9_d1 <=  heap_bh121_w53_9;
            heap_bh121_w53_9_d2 <=  heap_bh121_w53_9_d1;
            heap_bh121_w53_9_d3 <=  heap_bh121_w53_9_d2;
            heap_bh121_w53_9_d4 <=  heap_bh121_w53_9_d3;
            heap_bh121_w54_9_d1 <=  heap_bh121_w54_9;
            heap_bh121_w54_9_d2 <=  heap_bh121_w54_9_d1;
            heap_bh121_w54_9_d3 <=  heap_bh121_w54_9_d2;
            heap_bh121_w54_9_d4 <=  heap_bh121_w54_9_d3;
            heap_bh121_w57_9_d1 <=  heap_bh121_w57_9;
            heap_bh121_w58_7_d1 <=  heap_bh121_w58_7;
            heap_bh121_w59_7_d1 <=  heap_bh121_w59_7;
            heap_bh121_w59_8_d1 <=  heap_bh121_w59_8;
            heap_bh121_w60_6_d1 <=  heap_bh121_w60_6;
            heap_bh121_w60_6_d2 <=  heap_bh121_w60_6_d1;
            heap_bh121_w60_6_d3 <=  heap_bh121_w60_6_d2;
            heap_bh121_w60_6_d4 <=  heap_bh121_w60_6_d3;
            heap_bh121_w61_7_d1 <=  heap_bh121_w61_7;
            heap_bh121_w61_7_d2 <=  heap_bh121_w61_7_d1;
            heap_bh121_w61_7_d3 <=  heap_bh121_w61_7_d2;
            heap_bh121_w61_7_d4 <=  heap_bh121_w61_7_d3;
            heap_bh121_w61_8_d1 <=  heap_bh121_w61_8;
            heap_bh121_w61_8_d2 <=  heap_bh121_w61_8_d1;
            heap_bh121_w61_8_d3 <=  heap_bh121_w61_8_d2;
            heap_bh121_w61_8_d4 <=  heap_bh121_w61_8_d3;
            heap_bh121_w62_6_d1 <=  heap_bh121_w62_6;
            heap_bh121_w62_6_d2 <=  heap_bh121_w62_6_d1;
            heap_bh121_w62_6_d3 <=  heap_bh121_w62_6_d2;
            heap_bh121_w62_6_d4 <=  heap_bh121_w62_6_d3;
            heap_bh121_w63_7_d1 <=  heap_bh121_w63_7;
            heap_bh121_w63_7_d2 <=  heap_bh121_w63_7_d1;
            heap_bh121_w63_7_d3 <=  heap_bh121_w63_7_d2;
            heap_bh121_w63_7_d4 <=  heap_bh121_w63_7_d3;
            heap_bh121_w63_8_d1 <=  heap_bh121_w63_8;
            heap_bh121_w63_8_d2 <=  heap_bh121_w63_8_d1;
            heap_bh121_w63_8_d3 <=  heap_bh121_w63_8_d2;
            heap_bh121_w63_8_d4 <=  heap_bh121_w63_8_d3;
            heap_bh121_w64_6_d1 <=  heap_bh121_w64_6;
            heap_bh121_w64_6_d2 <=  heap_bh121_w64_6_d1;
            heap_bh121_w64_6_d3 <=  heap_bh121_w64_6_d2;
            heap_bh121_w64_6_d4 <=  heap_bh121_w64_6_d3;
            heap_bh121_w65_7_d1 <=  heap_bh121_w65_7;
            heap_bh121_w65_7_d2 <=  heap_bh121_w65_7_d1;
            heap_bh121_w65_7_d3 <=  heap_bh121_w65_7_d2;
            heap_bh121_w65_7_d4 <=  heap_bh121_w65_7_d3;
            heap_bh121_w65_8_d1 <=  heap_bh121_w65_8;
            heap_bh121_w65_8_d2 <=  heap_bh121_w65_8_d1;
            heap_bh121_w65_8_d3 <=  heap_bh121_w65_8_d2;
            heap_bh121_w65_8_d4 <=  heap_bh121_w65_8_d3;
            heap_bh121_w66_6_d1 <=  heap_bh121_w66_6;
            heap_bh121_w66_6_d2 <=  heap_bh121_w66_6_d1;
            heap_bh121_w66_6_d3 <=  heap_bh121_w66_6_d2;
            heap_bh121_w66_6_d4 <=  heap_bh121_w66_6_d3;
            heap_bh121_w67_7_d1 <=  heap_bh121_w67_7;
            heap_bh121_w67_7_d2 <=  heap_bh121_w67_7_d1;
            heap_bh121_w67_7_d3 <=  heap_bh121_w67_7_d2;
            heap_bh121_w67_7_d4 <=  heap_bh121_w67_7_d3;
            heap_bh121_w67_8_d1 <=  heap_bh121_w67_8;
            heap_bh121_w67_8_d2 <=  heap_bh121_w67_8_d1;
            heap_bh121_w67_8_d3 <=  heap_bh121_w67_8_d2;
            heap_bh121_w67_8_d4 <=  heap_bh121_w67_8_d3;
            heap_bh121_w68_6_d1 <=  heap_bh121_w68_6;
            heap_bh121_w68_6_d2 <=  heap_bh121_w68_6_d1;
            heap_bh121_w68_6_d3 <=  heap_bh121_w68_6_d2;
            heap_bh121_w68_6_d4 <=  heap_bh121_w68_6_d3;
            heap_bh121_w69_7_d1 <=  heap_bh121_w69_7;
            heap_bh121_w69_7_d2 <=  heap_bh121_w69_7_d1;
            heap_bh121_w69_7_d3 <=  heap_bh121_w69_7_d2;
            heap_bh121_w69_7_d4 <=  heap_bh121_w69_7_d3;
            heap_bh121_w69_8_d1 <=  heap_bh121_w69_8;
            heap_bh121_w69_8_d2 <=  heap_bh121_w69_8_d1;
            heap_bh121_w69_8_d3 <=  heap_bh121_w69_8_d2;
            heap_bh121_w69_8_d4 <=  heap_bh121_w69_8_d3;
            heap_bh121_w70_6_d1 <=  heap_bh121_w70_6;
            heap_bh121_w70_6_d2 <=  heap_bh121_w70_6_d1;
            heap_bh121_w70_6_d3 <=  heap_bh121_w70_6_d2;
            heap_bh121_w70_6_d4 <=  heap_bh121_w70_6_d3;
            heap_bh121_w71_7_d1 <=  heap_bh121_w71_7;
            heap_bh121_w71_7_d2 <=  heap_bh121_w71_7_d1;
            heap_bh121_w71_7_d3 <=  heap_bh121_w71_7_d2;
            heap_bh121_w71_7_d4 <=  heap_bh121_w71_7_d3;
            heap_bh121_w71_8_d1 <=  heap_bh121_w71_8;
            heap_bh121_w71_8_d2 <=  heap_bh121_w71_8_d1;
            heap_bh121_w71_8_d3 <=  heap_bh121_w71_8_d2;
            heap_bh121_w71_8_d4 <=  heap_bh121_w71_8_d3;
            heap_bh121_w72_4_d1 <=  heap_bh121_w72_4;
            heap_bh121_w72_4_d2 <=  heap_bh121_w72_4_d1;
            heap_bh121_w72_4_d3 <=  heap_bh121_w72_4_d2;
            heap_bh121_w72_4_d4 <=  heap_bh121_w72_4_d3;
            heap_bh121_w73_5_d1 <=  heap_bh121_w73_5;
            heap_bh121_w83_3_d1 <=  heap_bh121_w83_3;
            heap_bh121_w83_3_d2 <=  heap_bh121_w83_3_d1;
            heap_bh121_w83_3_d3 <=  heap_bh121_w83_3_d2;
            heap_bh121_w83_3_d4 <=  heap_bh121_w83_3_d3;
            heap_bh121_w84_2_d1 <=  heap_bh121_w84_2;
            heap_bh121_w84_2_d2 <=  heap_bh121_w84_2_d1;
            heap_bh121_w84_2_d3 <=  heap_bh121_w84_2_d2;
            heap_bh121_w84_2_d4 <=  heap_bh121_w84_2_d3;
            heap_bh121_w85_2_d1 <=  heap_bh121_w85_2;
            heap_bh121_w54_10_d1 <=  heap_bh121_w54_10;
            heap_bh121_w54_10_d2 <=  heap_bh121_w54_10_d1;
            heap_bh121_w54_10_d3 <=  heap_bh121_w54_10_d2;
            heap_bh121_w54_10_d4 <=  heap_bh121_w54_10_d3;
            heap_bh121_w55_9_d1 <=  heap_bh121_w55_9;
            heap_bh121_w55_9_d2 <=  heap_bh121_w55_9_d1;
            heap_bh121_w55_9_d3 <=  heap_bh121_w55_9_d2;
            heap_bh121_w55_9_d4 <=  heap_bh121_w55_9_d3;
            heap_bh121_w56_9_d1 <=  heap_bh121_w56_9;
            heap_bh121_w56_9_d2 <=  heap_bh121_w56_9_d1;
            heap_bh121_w56_9_d3 <=  heap_bh121_w56_9_d2;
            heap_bh121_w57_10_d1 <=  heap_bh121_w57_10;
            heap_bh121_w57_10_d2 <=  heap_bh121_w57_10_d1;
            heap_bh121_w57_10_d3 <=  heap_bh121_w57_10_d2;
            heap_bh121_w73_6_d1 <=  heap_bh121_w73_6;
            heap_bh121_w73_6_d2 <=  heap_bh121_w73_6_d1;
            heap_bh121_w73_6_d3 <=  heap_bh121_w73_6_d2;
            heap_bh121_w74_4_d1 <=  heap_bh121_w74_4;
            heap_bh121_w74_4_d2 <=  heap_bh121_w74_4_d1;
            heap_bh121_w74_4_d3 <=  heap_bh121_w74_4_d2;
            heap_bh121_w85_3_d1 <=  heap_bh121_w85_3;
            heap_bh121_w85_3_d2 <=  heap_bh121_w85_3_d1;
            heap_bh121_w85_3_d3 <=  heap_bh121_w85_3_d2;
            heap_bh121_w86_2_d1 <=  heap_bh121_w86_2;
            heap_bh121_w86_2_d2 <=  heap_bh121_w86_2_d1;
            heap_bh121_w86_2_d3 <=  heap_bh121_w86_2_d2;
            heap_bh121_w58_9_d1 <=  heap_bh121_w58_9;
            heap_bh121_w58_9_d2 <=  heap_bh121_w58_9_d1;
            heap_bh121_w58_9_d3 <=  heap_bh121_w58_9_d2;
            heap_bh121_w59_9_d1 <=  heap_bh121_w59_9;
            heap_bh121_w59_9_d2 <=  heap_bh121_w59_9_d1;
            heap_bh121_w59_9_d3 <=  heap_bh121_w59_9_d2;
            heap_bh121_w60_7_d1 <=  heap_bh121_w60_7;
            heap_bh121_w60_7_d2 <=  heap_bh121_w60_7_d1;
            heap_bh121_w60_7_d3 <=  heap_bh121_w60_7_d2;
            heap_bh121_w75_6_d1 <=  heap_bh121_w75_6;
            heap_bh121_w75_6_d2 <=  heap_bh121_w75_6_d1;
            heap_bh121_w75_6_d3 <=  heap_bh121_w75_6_d2;
            heap_bh121_w76_4_d1 <=  heap_bh121_w76_4;
            heap_bh121_w76_4_d2 <=  heap_bh121_w76_4_d1;
            heap_bh121_w76_4_d3 <=  heap_bh121_w76_4_d2;
            heap_bh121_w77_5_d1 <=  heap_bh121_w77_5;
            heap_bh121_w87_3_d1 <=  heap_bh121_w87_3;
            heap_bh121_w87_3_d2 <=  heap_bh121_w87_3_d1;
            heap_bh121_w87_3_d3 <=  heap_bh121_w87_3_d2;
            heap_bh121_w88_2_d1 <=  heap_bh121_w88_2;
            heap_bh121_w88_2_d2 <=  heap_bh121_w88_2_d1;
            heap_bh121_w88_2_d3 <=  heap_bh121_w88_2_d2;
            heap_bh121_w89_1_d1 <=  heap_bh121_w89_1;
            heap_bh121_w89_1_d2 <=  heap_bh121_w89_1_d1;
            heap_bh121_w89_1_d3 <=  heap_bh121_w89_1_d2;
            heap_bh121_w77_6_d1 <=  heap_bh121_w77_6;
            heap_bh121_w77_6_d2 <=  heap_bh121_w77_6_d1;
            heap_bh121_w78_4_d1 <=  heap_bh121_w78_4;
            heap_bh121_w78_4_d2 <=  heap_bh121_w78_4_d1;
            heap_bh121_w79_6_d1 <=  heap_bh121_w79_6;
            heap_bh121_w79_6_d2 <=  heap_bh121_w79_6_d1;
            heap_bh121_w80_4_d1 <=  heap_bh121_w80_4;
            heap_bh121_w80_4_d2 <=  heap_bh121_w80_4_d1;
            heap_bh121_w81_5_d1 <=  heap_bh121_w81_5;
            heap_bh121_w81_6_d1 <=  heap_bh121_w81_6;
            heap_bh121_w82_3_d1 <=  heap_bh121_w82_3;
            heap_bh121_w83_4_d1 <=  heap_bh121_w83_4;
         end if;
      end process;
   XX_m120 <= X ;
   YY_m120 <= Y ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch0_0 <= ("" & XX_m120(52 downto 29) & "") * ("" & YY_m120(52 downto 36) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w105_0 <= DSP_bh121_ch0_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w104_0 <= DSP_bh121_ch0_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w103_0 <= DSP_bh121_ch0_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w102_0 <= DSP_bh121_ch0_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w101_0 <= DSP_bh121_ch0_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w100_0 <= DSP_bh121_ch0_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w99_0 <= DSP_bh121_ch0_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w98_0 <= DSP_bh121_ch0_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w97_0 <= DSP_bh121_ch0_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w96_0 <= DSP_bh121_ch0_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w95_0 <= DSP_bh121_ch0_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w94_0 <= DSP_bh121_ch0_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w93_0 <= DSP_bh121_ch0_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w92_0 <= DSP_bh121_ch0_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w91_0 <= DSP_bh121_ch0_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w90_0 <= DSP_bh121_ch0_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w89_0 <= DSP_bh121_ch0_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w88_0 <= DSP_bh121_ch0_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w87_0 <= DSP_bh121_ch0_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w86_0 <= DSP_bh121_ch0_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w85_0 <= DSP_bh121_ch0_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w84_0 <= DSP_bh121_ch0_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w83_0 <= DSP_bh121_ch0_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w82_0 <= DSP_bh121_ch0_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w81_0 <= DSP_bh121_ch0_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w80_0 <= DSP_bh121_ch0_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w79_0 <= DSP_bh121_ch0_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w78_0 <= DSP_bh121_ch0_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w77_0 <= DSP_bh121_ch0_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w76_0 <= DSP_bh121_ch0_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w75_0 <= DSP_bh121_ch0_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w74_0 <= DSP_bh121_ch0_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w73_0 <= DSP_bh121_ch0_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w72_0 <= DSP_bh121_ch0_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w71_0 <= DSP_bh121_ch0_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w70_0 <= DSP_bh121_ch0_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w69_0 <= DSP_bh121_ch0_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w68_0 <= DSP_bh121_ch0_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w67_0 <= DSP_bh121_ch0_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w66_0 <= DSP_bh121_ch0_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w65_0 <= DSP_bh121_ch0_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch1_0 <= ("" & XX_m120(28 downto 5) & "") * ("" & YY_m120(52 downto 36) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w81_1 <= DSP_bh121_ch1_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w80_1 <= DSP_bh121_ch1_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w79_1 <= DSP_bh121_ch1_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w78_1 <= DSP_bh121_ch1_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w77_1 <= DSP_bh121_ch1_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w76_1 <= DSP_bh121_ch1_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w75_1 <= DSP_bh121_ch1_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w74_1 <= DSP_bh121_ch1_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w73_1 <= DSP_bh121_ch1_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w72_1 <= DSP_bh121_ch1_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w71_1 <= DSP_bh121_ch1_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w70_1 <= DSP_bh121_ch1_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w69_1 <= DSP_bh121_ch1_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w68_1 <= DSP_bh121_ch1_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w67_1 <= DSP_bh121_ch1_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w66_1 <= DSP_bh121_ch1_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w65_1 <= DSP_bh121_ch1_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w64_0 <= DSP_bh121_ch1_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w63_0 <= DSP_bh121_ch1_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w62_0 <= DSP_bh121_ch1_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w61_0 <= DSP_bh121_ch1_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w60_0 <= DSP_bh121_ch1_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w59_0 <= DSP_bh121_ch1_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w58_0 <= DSP_bh121_ch1_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w57_0 <= DSP_bh121_ch1_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w56_0 <= DSP_bh121_ch1_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w55_0 <= DSP_bh121_ch1_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w54_0 <= DSP_bh121_ch1_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w53_0 <= DSP_bh121_ch1_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w52_0 <= DSP_bh121_ch1_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w51_0 <= DSP_bh121_ch1_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w50_0 <= DSP_bh121_ch1_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w49_0 <= DSP_bh121_ch1_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w48_0 <= DSP_bh121_ch1_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w47_0 <= DSP_bh121_ch1_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w46_0 <= DSP_bh121_ch1_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w45_0 <= DSP_bh121_ch1_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w44_0 <= DSP_bh121_ch1_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w43_0 <= DSP_bh121_ch1_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w42_0 <= DSP_bh121_ch1_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w41_0 <= DSP_bh121_ch1_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch2_0 <= ("" & XX_m120(4 downto 0) & "0000000000000000000") * ("" & YY_m120(52 downto 36) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w57_1 <= DSP_bh121_ch2_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w56_1 <= DSP_bh121_ch2_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w55_1 <= DSP_bh121_ch2_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w54_1 <= DSP_bh121_ch2_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w53_1 <= DSP_bh121_ch2_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w52_1 <= DSP_bh121_ch2_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w51_1 <= DSP_bh121_ch2_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w50_1 <= DSP_bh121_ch2_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w49_1 <= DSP_bh121_ch2_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w48_1 <= DSP_bh121_ch2_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w47_1 <= DSP_bh121_ch2_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w46_1 <= DSP_bh121_ch2_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w45_1 <= DSP_bh121_ch2_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w44_1 <= DSP_bh121_ch2_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w43_1 <= DSP_bh121_ch2_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w42_1 <= DSP_bh121_ch2_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w41_1 <= DSP_bh121_ch2_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w40_0 <= DSP_bh121_ch2_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w39_0 <= DSP_bh121_ch2_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w38_0 <= DSP_bh121_ch2_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w37_0 <= DSP_bh121_ch2_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w36_0 <= DSP_bh121_ch2_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w35_0 <= DSP_bh121_ch2_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w34_0 <= DSP_bh121_ch2_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w33_0 <= DSP_bh121_ch2_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w32_0 <= DSP_bh121_ch2_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w31_0 <= DSP_bh121_ch2_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w30_0 <= DSP_bh121_ch2_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w29_0 <= DSP_bh121_ch2_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w28_0 <= DSP_bh121_ch2_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w27_0 <= DSP_bh121_ch2_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w26_0 <= DSP_bh121_ch2_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w25_0 <= DSP_bh121_ch2_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w24_0 <= DSP_bh121_ch2_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w23_0 <= DSP_bh121_ch2_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w22_0 <= DSP_bh121_ch2_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w21_0 <= DSP_bh121_ch2_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w20_0 <= DSP_bh121_ch2_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w19_0 <= DSP_bh121_ch2_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w18_0 <= DSP_bh121_ch2_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w17_0 <= DSP_bh121_ch2_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch3_0 <= ("" & XX_m120(52 downto 29) & "") * ("" & YY_m120(35 downto 19) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w88_1 <= DSP_bh121_ch3_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w87_1 <= DSP_bh121_ch3_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w86_1 <= DSP_bh121_ch3_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w85_1 <= DSP_bh121_ch3_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w84_1 <= DSP_bh121_ch3_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w83_1 <= DSP_bh121_ch3_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w82_1 <= DSP_bh121_ch3_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w81_2 <= DSP_bh121_ch3_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w80_2 <= DSP_bh121_ch3_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w79_2 <= DSP_bh121_ch3_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w78_2 <= DSP_bh121_ch3_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w77_2 <= DSP_bh121_ch3_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w76_2 <= DSP_bh121_ch3_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w75_2 <= DSP_bh121_ch3_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w74_2 <= DSP_bh121_ch3_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w73_2 <= DSP_bh121_ch3_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w72_2 <= DSP_bh121_ch3_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w71_2 <= DSP_bh121_ch3_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w70_2 <= DSP_bh121_ch3_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w69_2 <= DSP_bh121_ch3_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w68_2 <= DSP_bh121_ch3_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w67_2 <= DSP_bh121_ch3_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w66_2 <= DSP_bh121_ch3_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w65_2 <= DSP_bh121_ch3_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w64_1 <= DSP_bh121_ch3_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w63_1 <= DSP_bh121_ch3_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w62_1 <= DSP_bh121_ch3_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w61_1 <= DSP_bh121_ch3_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w60_1 <= DSP_bh121_ch3_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w59_1 <= DSP_bh121_ch3_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w58_1 <= DSP_bh121_ch3_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w57_2 <= DSP_bh121_ch3_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w56_2 <= DSP_bh121_ch3_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w55_2 <= DSP_bh121_ch3_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w54_2 <= DSP_bh121_ch3_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w53_2 <= DSP_bh121_ch3_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w52_2 <= DSP_bh121_ch3_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w51_2 <= DSP_bh121_ch3_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w50_2 <= DSP_bh121_ch3_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w49_2 <= DSP_bh121_ch3_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w48_2 <= DSP_bh121_ch3_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch4_0 <= ("" & XX_m120(28 downto 5) & "") * ("" & YY_m120(35 downto 19) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w64_2 <= DSP_bh121_ch4_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w63_2 <= DSP_bh121_ch4_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w62_2 <= DSP_bh121_ch4_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w61_2 <= DSP_bh121_ch4_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w60_2 <= DSP_bh121_ch4_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w59_2 <= DSP_bh121_ch4_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w58_2 <= DSP_bh121_ch4_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w57_3 <= DSP_bh121_ch4_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w56_3 <= DSP_bh121_ch4_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w55_3 <= DSP_bh121_ch4_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w54_3 <= DSP_bh121_ch4_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w53_3 <= DSP_bh121_ch4_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w52_3 <= DSP_bh121_ch4_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w51_3 <= DSP_bh121_ch4_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w50_3 <= DSP_bh121_ch4_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w49_3 <= DSP_bh121_ch4_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w48_3 <= DSP_bh121_ch4_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w47_2 <= DSP_bh121_ch4_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w46_2 <= DSP_bh121_ch4_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w45_2 <= DSP_bh121_ch4_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w44_2 <= DSP_bh121_ch4_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w43_2 <= DSP_bh121_ch4_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w42_2 <= DSP_bh121_ch4_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w41_2 <= DSP_bh121_ch4_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w40_1 <= DSP_bh121_ch4_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w39_1 <= DSP_bh121_ch4_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w38_1 <= DSP_bh121_ch4_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w37_1 <= DSP_bh121_ch4_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w36_1 <= DSP_bh121_ch4_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w35_1 <= DSP_bh121_ch4_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w34_1 <= DSP_bh121_ch4_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w33_1 <= DSP_bh121_ch4_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w32_1 <= DSP_bh121_ch4_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w31_1 <= DSP_bh121_ch4_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w30_1 <= DSP_bh121_ch4_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w29_1 <= DSP_bh121_ch4_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w28_1 <= DSP_bh121_ch4_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w27_1 <= DSP_bh121_ch4_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w26_1 <= DSP_bh121_ch4_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w25_1 <= DSP_bh121_ch4_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w24_1 <= DSP_bh121_ch4_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch5_0 <= ("" & XX_m120(4 downto 0) & "0000000000000000000") * ("" & YY_m120(35 downto 19) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w40_2 <= DSP_bh121_ch5_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w39_2 <= DSP_bh121_ch5_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w38_2 <= DSP_bh121_ch5_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w37_2 <= DSP_bh121_ch5_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w36_2 <= DSP_bh121_ch5_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w35_2 <= DSP_bh121_ch5_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w34_2 <= DSP_bh121_ch5_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w33_2 <= DSP_bh121_ch5_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w32_2 <= DSP_bh121_ch5_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w31_2 <= DSP_bh121_ch5_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w30_2 <= DSP_bh121_ch5_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w29_2 <= DSP_bh121_ch5_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w28_2 <= DSP_bh121_ch5_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w27_2 <= DSP_bh121_ch5_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w26_2 <= DSP_bh121_ch5_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w25_2 <= DSP_bh121_ch5_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w24_2 <= DSP_bh121_ch5_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w23_1 <= DSP_bh121_ch5_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w22_1 <= DSP_bh121_ch5_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w21_1 <= DSP_bh121_ch5_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w20_1 <= DSP_bh121_ch5_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w19_1 <= DSP_bh121_ch5_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w18_1 <= DSP_bh121_ch5_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w17_1 <= DSP_bh121_ch5_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w16_0 <= DSP_bh121_ch5_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w15_0 <= DSP_bh121_ch5_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w14_0 <= DSP_bh121_ch5_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w13_0 <= DSP_bh121_ch5_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w12_0 <= DSP_bh121_ch5_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w11_0 <= DSP_bh121_ch5_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w10_0 <= DSP_bh121_ch5_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w9_0 <= DSP_bh121_ch5_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w8_0 <= DSP_bh121_ch5_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w7_0 <= DSP_bh121_ch5_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w6_0 <= DSP_bh121_ch5_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w5_0 <= DSP_bh121_ch5_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w4_0 <= DSP_bh121_ch5_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w3_0 <= DSP_bh121_ch5_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w2_0 <= DSP_bh121_ch5_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w1_0 <= DSP_bh121_ch5_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w0_0 <= DSP_bh121_ch5_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch6_0 <= ("" & XX_m120(52 downto 29) & "") * ("" & YY_m120(18 downto 2) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w71_3 <= DSP_bh121_ch6_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w70_3 <= DSP_bh121_ch6_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w69_3 <= DSP_bh121_ch6_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w68_3 <= DSP_bh121_ch6_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w67_3 <= DSP_bh121_ch6_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w66_3 <= DSP_bh121_ch6_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w65_3 <= DSP_bh121_ch6_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w64_3 <= DSP_bh121_ch6_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w63_3 <= DSP_bh121_ch6_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w62_3 <= DSP_bh121_ch6_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w61_3 <= DSP_bh121_ch6_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w60_3 <= DSP_bh121_ch6_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w59_3 <= DSP_bh121_ch6_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w58_3 <= DSP_bh121_ch6_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w57_4 <= DSP_bh121_ch6_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w56_4 <= DSP_bh121_ch6_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w55_4 <= DSP_bh121_ch6_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w54_4 <= DSP_bh121_ch6_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w53_4 <= DSP_bh121_ch6_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w52_4 <= DSP_bh121_ch6_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w51_4 <= DSP_bh121_ch6_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w50_4 <= DSP_bh121_ch6_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w49_4 <= DSP_bh121_ch6_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w48_4 <= DSP_bh121_ch6_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w47_3 <= DSP_bh121_ch6_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w46_3 <= DSP_bh121_ch6_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w45_3 <= DSP_bh121_ch6_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w44_3 <= DSP_bh121_ch6_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w43_3 <= DSP_bh121_ch6_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w42_3 <= DSP_bh121_ch6_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w41_3 <= DSP_bh121_ch6_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w40_3 <= DSP_bh121_ch6_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w39_3 <= DSP_bh121_ch6_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w38_3 <= DSP_bh121_ch6_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w37_3 <= DSP_bh121_ch6_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w36_3 <= DSP_bh121_ch6_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w35_3 <= DSP_bh121_ch6_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w34_3 <= DSP_bh121_ch6_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w33_3 <= DSP_bh121_ch6_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w32_3 <= DSP_bh121_ch6_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w31_3 <= DSP_bh121_ch6_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch7_0 <= ("" & XX_m120(28 downto 5) & "") * ("" & YY_m120(18 downto 2) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w47_4 <= DSP_bh121_ch7_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w46_4 <= DSP_bh121_ch7_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w45_4 <= DSP_bh121_ch7_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w44_4 <= DSP_bh121_ch7_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w43_4 <= DSP_bh121_ch7_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w42_4 <= DSP_bh121_ch7_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w41_4 <= DSP_bh121_ch7_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w40_4 <= DSP_bh121_ch7_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w39_4 <= DSP_bh121_ch7_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w38_4 <= DSP_bh121_ch7_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w37_4 <= DSP_bh121_ch7_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w36_4 <= DSP_bh121_ch7_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w35_4 <= DSP_bh121_ch7_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w34_4 <= DSP_bh121_ch7_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w33_4 <= DSP_bh121_ch7_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w32_4 <= DSP_bh121_ch7_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w31_4 <= DSP_bh121_ch7_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w30_3 <= DSP_bh121_ch7_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w29_3 <= DSP_bh121_ch7_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w28_3 <= DSP_bh121_ch7_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w27_3 <= DSP_bh121_ch7_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w26_3 <= DSP_bh121_ch7_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w25_3 <= DSP_bh121_ch7_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w24_3 <= DSP_bh121_ch7_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w23_2 <= DSP_bh121_ch7_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w22_2 <= DSP_bh121_ch7_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w21_2 <= DSP_bh121_ch7_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w20_2 <= DSP_bh121_ch7_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w19_2 <= DSP_bh121_ch7_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w18_2 <= DSP_bh121_ch7_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w17_2 <= DSP_bh121_ch7_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w16_1 <= DSP_bh121_ch7_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w15_1 <= DSP_bh121_ch7_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w14_1 <= DSP_bh121_ch7_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w13_1 <= DSP_bh121_ch7_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w12_1 <= DSP_bh121_ch7_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w11_1 <= DSP_bh121_ch7_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w10_1 <= DSP_bh121_ch7_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w9_1 <= DSP_bh121_ch7_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w8_1 <= DSP_bh121_ch7_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w7_1 <= DSP_bh121_ch7_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch8_0 <= ("" & XX_m120(4 downto 0) & "0000000000000000000") * ("" & YY_m120(18 downto 2) & "");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w23_3 <= DSP_bh121_ch8_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w22_3 <= DSP_bh121_ch8_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w21_3 <= DSP_bh121_ch8_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w20_3 <= DSP_bh121_ch8_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w19_3 <= DSP_bh121_ch8_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w18_3 <= DSP_bh121_ch8_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w17_3 <= DSP_bh121_ch8_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w16_2 <= DSP_bh121_ch8_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w15_2 <= DSP_bh121_ch8_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w14_2 <= DSP_bh121_ch8_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w13_2 <= DSP_bh121_ch8_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w12_2 <= DSP_bh121_ch8_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w11_2 <= DSP_bh121_ch8_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w10_2 <= DSP_bh121_ch8_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w9_2 <= DSP_bh121_ch8_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w8_2 <= DSP_bh121_ch8_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w7_2 <= DSP_bh121_ch8_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w6_1 <= DSP_bh121_ch8_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w5_1 <= DSP_bh121_ch8_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w4_1 <= DSP_bh121_ch8_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w3_1 <= DSP_bh121_ch8_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w2_1 <= DSP_bh121_ch8_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w1_1 <= DSP_bh121_ch8_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w0_1 <= DSP_bh121_ch8_0_d1(17); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch9_0 <= ("" & XX_m120(52 downto 29) & "") * ("" & YY_m120(1 downto 0) & "000000000000000");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w54_5 <= DSP_bh121_ch9_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w53_5 <= DSP_bh121_ch9_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w52_5 <= DSP_bh121_ch9_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w51_5 <= DSP_bh121_ch9_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w50_5 <= DSP_bh121_ch9_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w49_5 <= DSP_bh121_ch9_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w48_5 <= DSP_bh121_ch9_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w47_5 <= DSP_bh121_ch9_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w46_5 <= DSP_bh121_ch9_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w45_5 <= DSP_bh121_ch9_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w44_5 <= DSP_bh121_ch9_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w43_5 <= DSP_bh121_ch9_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w42_5 <= DSP_bh121_ch9_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w41_5 <= DSP_bh121_ch9_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w40_5 <= DSP_bh121_ch9_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w39_5 <= DSP_bh121_ch9_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w38_5 <= DSP_bh121_ch9_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w37_5 <= DSP_bh121_ch9_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w36_5 <= DSP_bh121_ch9_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w35_5 <= DSP_bh121_ch9_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w34_5 <= DSP_bh121_ch9_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w33_5 <= DSP_bh121_ch9_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w32_5 <= DSP_bh121_ch9_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w31_5 <= DSP_bh121_ch9_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w30_4 <= DSP_bh121_ch9_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w29_4 <= DSP_bh121_ch9_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w28_4 <= DSP_bh121_ch9_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w27_4 <= DSP_bh121_ch9_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w26_4 <= DSP_bh121_ch9_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w25_4 <= DSP_bh121_ch9_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w24_4 <= DSP_bh121_ch9_0_d1(10); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w23_4 <= DSP_bh121_ch9_0_d1(9); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w22_4 <= DSP_bh121_ch9_0_d1(8); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w21_4 <= DSP_bh121_ch9_0_d1(7); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w20_4 <= DSP_bh121_ch9_0_d1(6); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w19_4 <= DSP_bh121_ch9_0_d1(5); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w18_4 <= DSP_bh121_ch9_0_d1(4); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w17_4 <= DSP_bh121_ch9_0_d1(3); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w16_3 <= DSP_bh121_ch9_0_d1(2); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w15_3 <= DSP_bh121_ch9_0_d1(1); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w14_3 <= DSP_bh121_ch9_0_d1(0); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch10_0 <= ("" & XX_m120(28 downto 5) & "") * ("" & YY_m120(1 downto 0) & "000000000000000");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w30_5 <= DSP_bh121_ch10_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w29_5 <= DSP_bh121_ch10_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w28_5 <= DSP_bh121_ch10_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w27_5 <= DSP_bh121_ch10_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w26_5 <= DSP_bh121_ch10_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w25_5 <= DSP_bh121_ch10_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w24_5 <= DSP_bh121_ch10_0_d1(34); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w23_5 <= DSP_bh121_ch10_0_d1(33); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w22_5 <= DSP_bh121_ch10_0_d1(32); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w21_5 <= DSP_bh121_ch10_0_d1(31); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w20_5 <= DSP_bh121_ch10_0_d1(30); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w19_5 <= DSP_bh121_ch10_0_d1(29); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w18_5 <= DSP_bh121_ch10_0_d1(28); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w17_5 <= DSP_bh121_ch10_0_d1(27); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w16_4 <= DSP_bh121_ch10_0_d1(26); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w15_4 <= DSP_bh121_ch10_0_d1(25); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w14_4 <= DSP_bh121_ch10_0_d1(24); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w13_3 <= DSP_bh121_ch10_0_d1(23); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w12_3 <= DSP_bh121_ch10_0_d1(22); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w11_3 <= DSP_bh121_ch10_0_d1(21); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w10_3 <= DSP_bh121_ch10_0_d1(20); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w9_3 <= DSP_bh121_ch10_0_d1(19); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w8_3 <= DSP_bh121_ch10_0_d1(18); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w7_3 <= DSP_bh121_ch10_0_d1(17); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w6_2 <= DSP_bh121_ch10_0_d1(16); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w5_2 <= DSP_bh121_ch10_0_d1(15); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w4_2 <= DSP_bh121_ch10_0_d1(14); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w3_2 <= DSP_bh121_ch10_0_d1(13); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w2_2 <= DSP_bh121_ch10_0_d1(12); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w1_2 <= DSP_bh121_ch10_0_d1(11); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w0_2 <= DSP_bh121_ch10_0_d1(10); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh121_ch11_0 <= ("" & XX_m120(4 downto 0) & "0000000000000000000") * ("" & YY_m120(1 downto 0) & "000000000000000");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh121_w6_3 <= DSP_bh121_ch11_0_d1(40); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w5_3 <= DSP_bh121_ch11_0_d1(39); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w4_3 <= DSP_bh121_ch11_0_d1(38); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w3_3 <= DSP_bh121_ch11_0_d1(37); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w2_3 <= DSP_bh121_ch11_0_d1(36); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w1_3 <= DSP_bh121_ch11_0_d1(35); -- cycle= 1 cp= 3.87e-10
   heap_bh121_w0_3 <= DSP_bh121_ch11_0_d1(34); -- cycle= 1 cp= 3.87e-10
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits

   ----------------Synchro barrier, entering cycle 1----------------

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_0_0 <= heap_bh121_w17_5 & heap_bh121_w17_4 & heap_bh121_w17_3 & heap_bh121_w17_2 & heap_bh121_w17_1 & heap_bh121_w17_0;
      Compressor_bh121_0: Compressor_6_3
      port map ( R => CompressorOut_bh121_0_0,
                 X0 => CompressorIn_bh121_0_0);
   heap_bh121_w17_6 <= CompressorOut_bh121_0_0(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w18_6 <= CompressorOut_bh121_0_0(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w19_6 <= CompressorOut_bh121_0_0(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_1_1 <= heap_bh121_w18_5 & heap_bh121_w18_4 & heap_bh121_w18_3 & heap_bh121_w18_2 & heap_bh121_w18_1 & heap_bh121_w18_0;
      Compressor_bh121_1: Compressor_6_3
      port map ( R => CompressorOut_bh121_1_1,
                 X0 => CompressorIn_bh121_1_1);
   heap_bh121_w18_7 <= CompressorOut_bh121_1_1(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w19_7 <= CompressorOut_bh121_1_1(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w20_6 <= CompressorOut_bh121_1_1(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_2_2 <= heap_bh121_w19_5 & heap_bh121_w19_4 & heap_bh121_w19_3 & heap_bh121_w19_2 & heap_bh121_w19_1 & heap_bh121_w19_0;
      Compressor_bh121_2: Compressor_6_3
      port map ( R => CompressorOut_bh121_2_2,
                 X0 => CompressorIn_bh121_2_2);
   heap_bh121_w19_8 <= CompressorOut_bh121_2_2(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w20_7 <= CompressorOut_bh121_2_2(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w21_6 <= CompressorOut_bh121_2_2(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_3_3 <= heap_bh121_w20_5 & heap_bh121_w20_4 & heap_bh121_w20_3 & heap_bh121_w20_2 & heap_bh121_w20_1 & heap_bh121_w20_0;
      Compressor_bh121_3: Compressor_6_3
      port map ( R => CompressorOut_bh121_3_3,
                 X0 => CompressorIn_bh121_3_3);
   heap_bh121_w20_8 <= CompressorOut_bh121_3_3(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w21_7 <= CompressorOut_bh121_3_3(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w22_6 <= CompressorOut_bh121_3_3(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_4_4 <= heap_bh121_w21_5 & heap_bh121_w21_4 & heap_bh121_w21_3 & heap_bh121_w21_2 & heap_bh121_w21_1 & heap_bh121_w21_0;
      Compressor_bh121_4: Compressor_6_3
      port map ( R => CompressorOut_bh121_4_4,
                 X0 => CompressorIn_bh121_4_4);
   heap_bh121_w21_8 <= CompressorOut_bh121_4_4(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w22_7 <= CompressorOut_bh121_4_4(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w23_6 <= CompressorOut_bh121_4_4(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_5_5 <= heap_bh121_w22_5 & heap_bh121_w22_4 & heap_bh121_w22_3 & heap_bh121_w22_2 & heap_bh121_w22_1 & heap_bh121_w22_0;
      Compressor_bh121_5: Compressor_6_3
      port map ( R => CompressorOut_bh121_5_5,
                 X0 => CompressorIn_bh121_5_5);
   heap_bh121_w22_8 <= CompressorOut_bh121_5_5(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w23_7 <= CompressorOut_bh121_5_5(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w24_6 <= CompressorOut_bh121_5_5(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_6_6 <= heap_bh121_w23_5 & heap_bh121_w23_4 & heap_bh121_w23_3 & heap_bh121_w23_2 & heap_bh121_w23_1 & heap_bh121_w23_0;
      Compressor_bh121_6: Compressor_6_3
      port map ( R => CompressorOut_bh121_6_6,
                 X0 => CompressorIn_bh121_6_6);
   heap_bh121_w23_8 <= CompressorOut_bh121_6_6(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w24_7 <= CompressorOut_bh121_6_6(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w25_6 <= CompressorOut_bh121_6_6(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_7_7 <= heap_bh121_w24_5 & heap_bh121_w24_4 & heap_bh121_w24_3 & heap_bh121_w24_2 & heap_bh121_w24_1 & heap_bh121_w24_0;
      Compressor_bh121_7: Compressor_6_3
      port map ( R => CompressorOut_bh121_7_7,
                 X0 => CompressorIn_bh121_7_7);
   heap_bh121_w24_8 <= CompressorOut_bh121_7_7(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w25_7 <= CompressorOut_bh121_7_7(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w26_6 <= CompressorOut_bh121_7_7(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_8_8 <= heap_bh121_w25_5 & heap_bh121_w25_4 & heap_bh121_w25_3 & heap_bh121_w25_2 & heap_bh121_w25_1 & heap_bh121_w25_0;
      Compressor_bh121_8: Compressor_6_3
      port map ( R => CompressorOut_bh121_8_8,
                 X0 => CompressorIn_bh121_8_8);
   heap_bh121_w25_8 <= CompressorOut_bh121_8_8(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w26_7 <= CompressorOut_bh121_8_8(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w27_6 <= CompressorOut_bh121_8_8(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_9_9 <= heap_bh121_w26_5 & heap_bh121_w26_4 & heap_bh121_w26_3 & heap_bh121_w26_2 & heap_bh121_w26_1 & heap_bh121_w26_0;
      Compressor_bh121_9: Compressor_6_3
      port map ( R => CompressorOut_bh121_9_9,
                 X0 => CompressorIn_bh121_9_9);
   heap_bh121_w26_8 <= CompressorOut_bh121_9_9(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w27_7 <= CompressorOut_bh121_9_9(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w28_6 <= CompressorOut_bh121_9_9(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_10_10 <= heap_bh121_w27_5 & heap_bh121_w27_4 & heap_bh121_w27_3 & heap_bh121_w27_2 & heap_bh121_w27_1 & heap_bh121_w27_0;
      Compressor_bh121_10: Compressor_6_3
      port map ( R => CompressorOut_bh121_10_10,
                 X0 => CompressorIn_bh121_10_10);
   heap_bh121_w27_8 <= CompressorOut_bh121_10_10(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w28_7 <= CompressorOut_bh121_10_10(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w29_6 <= CompressorOut_bh121_10_10(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_11_11 <= heap_bh121_w28_5 & heap_bh121_w28_4 & heap_bh121_w28_3 & heap_bh121_w28_2 & heap_bh121_w28_1 & heap_bh121_w28_0;
      Compressor_bh121_11: Compressor_6_3
      port map ( R => CompressorOut_bh121_11_11,
                 X0 => CompressorIn_bh121_11_11);
   heap_bh121_w28_8 <= CompressorOut_bh121_11_11(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w29_7 <= CompressorOut_bh121_11_11(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w30_6 <= CompressorOut_bh121_11_11(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_12_12 <= heap_bh121_w29_5 & heap_bh121_w29_4 & heap_bh121_w29_3 & heap_bh121_w29_2 & heap_bh121_w29_1 & heap_bh121_w29_0;
      Compressor_bh121_12: Compressor_6_3
      port map ( R => CompressorOut_bh121_12_12,
                 X0 => CompressorIn_bh121_12_12);
   heap_bh121_w29_8 <= CompressorOut_bh121_12_12(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w30_7 <= CompressorOut_bh121_12_12(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w31_6 <= CompressorOut_bh121_12_12(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_13_13 <= heap_bh121_w30_5 & heap_bh121_w30_4 & heap_bh121_w30_3 & heap_bh121_w30_2 & heap_bh121_w30_1 & heap_bh121_w30_0;
      Compressor_bh121_13: Compressor_6_3
      port map ( R => CompressorOut_bh121_13_13,
                 X0 => CompressorIn_bh121_13_13);
   heap_bh121_w30_8 <= CompressorOut_bh121_13_13(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w31_7 <= CompressorOut_bh121_13_13(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w32_6 <= CompressorOut_bh121_13_13(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_14_14 <= heap_bh121_w31_5 & heap_bh121_w31_4 & heap_bh121_w31_3 & heap_bh121_w31_2 & heap_bh121_w31_1 & heap_bh121_w31_0;
      Compressor_bh121_14: Compressor_6_3
      port map ( R => CompressorOut_bh121_14_14,
                 X0 => CompressorIn_bh121_14_14);
   heap_bh121_w31_8 <= CompressorOut_bh121_14_14(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w32_7 <= CompressorOut_bh121_14_14(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w33_6 <= CompressorOut_bh121_14_14(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_15_15 <= heap_bh121_w32_5 & heap_bh121_w32_4 & heap_bh121_w32_3 & heap_bh121_w32_2 & heap_bh121_w32_1 & heap_bh121_w32_0;
      Compressor_bh121_15: Compressor_6_3
      port map ( R => CompressorOut_bh121_15_15,
                 X0 => CompressorIn_bh121_15_15);
   heap_bh121_w32_8 <= CompressorOut_bh121_15_15(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w33_7 <= CompressorOut_bh121_15_15(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w34_6 <= CompressorOut_bh121_15_15(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_16_16 <= heap_bh121_w33_5 & heap_bh121_w33_4 & heap_bh121_w33_3 & heap_bh121_w33_2 & heap_bh121_w33_1 & heap_bh121_w33_0;
      Compressor_bh121_16: Compressor_6_3
      port map ( R => CompressorOut_bh121_16_16,
                 X0 => CompressorIn_bh121_16_16);
   heap_bh121_w33_8 <= CompressorOut_bh121_16_16(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w34_7 <= CompressorOut_bh121_16_16(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w35_6 <= CompressorOut_bh121_16_16(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_17_17 <= heap_bh121_w34_5 & heap_bh121_w34_4 & heap_bh121_w34_3 & heap_bh121_w34_2 & heap_bh121_w34_1 & heap_bh121_w34_0;
      Compressor_bh121_17: Compressor_6_3
      port map ( R => CompressorOut_bh121_17_17,
                 X0 => CompressorIn_bh121_17_17);
   heap_bh121_w34_8 <= CompressorOut_bh121_17_17(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w35_7 <= CompressorOut_bh121_17_17(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w36_6 <= CompressorOut_bh121_17_17(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_18_18 <= heap_bh121_w35_5 & heap_bh121_w35_4 & heap_bh121_w35_3 & heap_bh121_w35_2 & heap_bh121_w35_1 & heap_bh121_w35_0;
      Compressor_bh121_18: Compressor_6_3
      port map ( R => CompressorOut_bh121_18_18,
                 X0 => CompressorIn_bh121_18_18);
   heap_bh121_w35_8 <= CompressorOut_bh121_18_18(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w36_7 <= CompressorOut_bh121_18_18(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w37_6 <= CompressorOut_bh121_18_18(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_19_19 <= heap_bh121_w36_5 & heap_bh121_w36_4 & heap_bh121_w36_3 & heap_bh121_w36_2 & heap_bh121_w36_1 & heap_bh121_w36_0;
      Compressor_bh121_19: Compressor_6_3
      port map ( R => CompressorOut_bh121_19_19,
                 X0 => CompressorIn_bh121_19_19);
   heap_bh121_w36_8 <= CompressorOut_bh121_19_19(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w37_7 <= CompressorOut_bh121_19_19(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w38_6 <= CompressorOut_bh121_19_19(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_20_20 <= heap_bh121_w37_5 & heap_bh121_w37_4 & heap_bh121_w37_3 & heap_bh121_w37_2 & heap_bh121_w37_1 & heap_bh121_w37_0;
      Compressor_bh121_20: Compressor_6_3
      port map ( R => CompressorOut_bh121_20_20,
                 X0 => CompressorIn_bh121_20_20);
   heap_bh121_w37_8 <= CompressorOut_bh121_20_20(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w38_7 <= CompressorOut_bh121_20_20(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w39_6 <= CompressorOut_bh121_20_20(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_21_21 <= heap_bh121_w38_5 & heap_bh121_w38_4 & heap_bh121_w38_3 & heap_bh121_w38_2 & heap_bh121_w38_1 & heap_bh121_w38_0;
      Compressor_bh121_21: Compressor_6_3
      port map ( R => CompressorOut_bh121_21_21,
                 X0 => CompressorIn_bh121_21_21);
   heap_bh121_w38_8 <= CompressorOut_bh121_21_21(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w39_7 <= CompressorOut_bh121_21_21(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w40_6 <= CompressorOut_bh121_21_21(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_22_22 <= heap_bh121_w39_5 & heap_bh121_w39_4 & heap_bh121_w39_3 & heap_bh121_w39_2 & heap_bh121_w39_1 & heap_bh121_w39_0;
      Compressor_bh121_22: Compressor_6_3
      port map ( R => CompressorOut_bh121_22_22,
                 X0 => CompressorIn_bh121_22_22);
   heap_bh121_w39_8 <= CompressorOut_bh121_22_22(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w40_7 <= CompressorOut_bh121_22_22(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w41_6 <= CompressorOut_bh121_22_22(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_23_23 <= heap_bh121_w40_5 & heap_bh121_w40_4 & heap_bh121_w40_3 & heap_bh121_w40_2 & heap_bh121_w40_1 & heap_bh121_w40_0;
      Compressor_bh121_23: Compressor_6_3
      port map ( R => CompressorOut_bh121_23_23,
                 X0 => CompressorIn_bh121_23_23);
   heap_bh121_w40_8 <= CompressorOut_bh121_23_23(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w41_7 <= CompressorOut_bh121_23_23(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w42_6 <= CompressorOut_bh121_23_23(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_24_24 <= heap_bh121_w41_5 & heap_bh121_w41_4 & heap_bh121_w41_3 & heap_bh121_w41_2 & heap_bh121_w41_1 & heap_bh121_w41_0;
      Compressor_bh121_24: Compressor_6_3
      port map ( R => CompressorOut_bh121_24_24,
                 X0 => CompressorIn_bh121_24_24);
   heap_bh121_w41_8 <= CompressorOut_bh121_24_24(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w42_7 <= CompressorOut_bh121_24_24(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w43_6 <= CompressorOut_bh121_24_24(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_25_25 <= heap_bh121_w42_5 & heap_bh121_w42_4 & heap_bh121_w42_3 & heap_bh121_w42_2 & heap_bh121_w42_1 & heap_bh121_w42_0;
      Compressor_bh121_25: Compressor_6_3
      port map ( R => CompressorOut_bh121_25_25,
                 X0 => CompressorIn_bh121_25_25);
   heap_bh121_w42_8 <= CompressorOut_bh121_25_25(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w43_7 <= CompressorOut_bh121_25_25(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w44_6 <= CompressorOut_bh121_25_25(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_26_26 <= heap_bh121_w43_5 & heap_bh121_w43_4 & heap_bh121_w43_3 & heap_bh121_w43_2 & heap_bh121_w43_1 & heap_bh121_w43_0;
      Compressor_bh121_26: Compressor_6_3
      port map ( R => CompressorOut_bh121_26_26,
                 X0 => CompressorIn_bh121_26_26);
   heap_bh121_w43_8 <= CompressorOut_bh121_26_26(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w44_7 <= CompressorOut_bh121_26_26(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w45_6 <= CompressorOut_bh121_26_26(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_27_27 <= heap_bh121_w44_5 & heap_bh121_w44_4 & heap_bh121_w44_3 & heap_bh121_w44_2 & heap_bh121_w44_1 & heap_bh121_w44_0;
      Compressor_bh121_27: Compressor_6_3
      port map ( R => CompressorOut_bh121_27_27,
                 X0 => CompressorIn_bh121_27_27);
   heap_bh121_w44_8 <= CompressorOut_bh121_27_27(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w45_7 <= CompressorOut_bh121_27_27(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w46_6 <= CompressorOut_bh121_27_27(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_28_28 <= heap_bh121_w45_5 & heap_bh121_w45_4 & heap_bh121_w45_3 & heap_bh121_w45_2 & heap_bh121_w45_1 & heap_bh121_w45_0;
      Compressor_bh121_28: Compressor_6_3
      port map ( R => CompressorOut_bh121_28_28,
                 X0 => CompressorIn_bh121_28_28);
   heap_bh121_w45_8 <= CompressorOut_bh121_28_28(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w46_7 <= CompressorOut_bh121_28_28(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w47_6 <= CompressorOut_bh121_28_28(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_29_29 <= heap_bh121_w46_5 & heap_bh121_w46_4 & heap_bh121_w46_3 & heap_bh121_w46_2 & heap_bh121_w46_1 & heap_bh121_w46_0;
      Compressor_bh121_29: Compressor_6_3
      port map ( R => CompressorOut_bh121_29_29,
                 X0 => CompressorIn_bh121_29_29);
   heap_bh121_w46_8 <= CompressorOut_bh121_29_29(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w47_7 <= CompressorOut_bh121_29_29(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w48_6 <= CompressorOut_bh121_29_29(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_30_30 <= heap_bh121_w47_5 & heap_bh121_w47_4 & heap_bh121_w47_3 & heap_bh121_w47_2 & heap_bh121_w47_1 & heap_bh121_w47_0;
      Compressor_bh121_30: Compressor_6_3
      port map ( R => CompressorOut_bh121_30_30,
                 X0 => CompressorIn_bh121_30_30);
   heap_bh121_w47_8 <= CompressorOut_bh121_30_30(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w48_7 <= CompressorOut_bh121_30_30(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w49_6 <= CompressorOut_bh121_30_30(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_31_31 <= heap_bh121_w48_5 & heap_bh121_w48_4 & heap_bh121_w48_3 & heap_bh121_w48_2 & heap_bh121_w48_1 & heap_bh121_w48_0;
      Compressor_bh121_31: Compressor_6_3
      port map ( R => CompressorOut_bh121_31_31,
                 X0 => CompressorIn_bh121_31_31);
   heap_bh121_w48_8 <= CompressorOut_bh121_31_31(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w49_7 <= CompressorOut_bh121_31_31(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w50_6 <= CompressorOut_bh121_31_31(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_32_32 <= heap_bh121_w49_5 & heap_bh121_w49_4 & heap_bh121_w49_3 & heap_bh121_w49_2 & heap_bh121_w49_1 & heap_bh121_w49_0;
      Compressor_bh121_32: Compressor_6_3
      port map ( R => CompressorOut_bh121_32_32,
                 X0 => CompressorIn_bh121_32_32);
   heap_bh121_w49_8 <= CompressorOut_bh121_32_32(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w50_7 <= CompressorOut_bh121_32_32(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w51_6 <= CompressorOut_bh121_32_32(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_33_33 <= heap_bh121_w50_5 & heap_bh121_w50_4 & heap_bh121_w50_3 & heap_bh121_w50_2 & heap_bh121_w50_1 & heap_bh121_w50_0;
      Compressor_bh121_33: Compressor_6_3
      port map ( R => CompressorOut_bh121_33_33,
                 X0 => CompressorIn_bh121_33_33);
   heap_bh121_w50_8 <= CompressorOut_bh121_33_33(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w51_7 <= CompressorOut_bh121_33_33(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w52_6 <= CompressorOut_bh121_33_33(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_34_34 <= heap_bh121_w51_5 & heap_bh121_w51_4 & heap_bh121_w51_3 & heap_bh121_w51_2 & heap_bh121_w51_1 & heap_bh121_w51_0;
      Compressor_bh121_34: Compressor_6_3
      port map ( R => CompressorOut_bh121_34_34,
                 X0 => CompressorIn_bh121_34_34);
   heap_bh121_w51_8 <= CompressorOut_bh121_34_34(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w52_7 <= CompressorOut_bh121_34_34(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w53_6 <= CompressorOut_bh121_34_34(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_35_35 <= heap_bh121_w52_5 & heap_bh121_w52_4 & heap_bh121_w52_3 & heap_bh121_w52_2 & heap_bh121_w52_1 & heap_bh121_w52_0;
      Compressor_bh121_35: Compressor_6_3
      port map ( R => CompressorOut_bh121_35_35,
                 X0 => CompressorIn_bh121_35_35);
   heap_bh121_w52_8 <= CompressorOut_bh121_35_35(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w53_7 <= CompressorOut_bh121_35_35(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w54_6 <= CompressorOut_bh121_35_35(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_36_36 <= heap_bh121_w53_5 & heap_bh121_w53_4 & heap_bh121_w53_3 & heap_bh121_w53_2 & heap_bh121_w53_1 & heap_bh121_w53_0;
      Compressor_bh121_36: Compressor_6_3
      port map ( R => CompressorOut_bh121_36_36,
                 X0 => CompressorIn_bh121_36_36);
   heap_bh121_w53_8 <= CompressorOut_bh121_36_36(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w54_7 <= CompressorOut_bh121_36_36(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w55_5 <= CompressorOut_bh121_36_36(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_37_37 <= heap_bh121_w54_5 & heap_bh121_w54_4 & heap_bh121_w54_3 & heap_bh121_w54_2 & heap_bh121_w54_1 & heap_bh121_w54_0;
      Compressor_bh121_37: Compressor_6_3
      port map ( R => CompressorOut_bh121_37_37,
                 X0 => CompressorIn_bh121_37_37);
   heap_bh121_w54_8 <= CompressorOut_bh121_37_37(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w55_6 <= CompressorOut_bh121_37_37(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w56_5 <= CompressorOut_bh121_37_37(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_38_38 <= heap_bh121_w0_3 & heap_bh121_w0_2 & heap_bh121_w0_1 & heap_bh121_w0_0;
   CompressorIn_bh121_38_39(0) <= heap_bh121_w1_3;
      Compressor_bh121_38: Compressor_14_3
      port map ( R => CompressorOut_bh121_38_38,
                 X0 => CompressorIn_bh121_38_38,
                 X1 => CompressorIn_bh121_38_39);
   heap_bh121_w0_4 <= CompressorOut_bh121_38_38(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w1_4 <= CompressorOut_bh121_38_38(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w2_4 <= CompressorOut_bh121_38_38(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_39_40 <= heap_bh121_w2_3 & heap_bh121_w2_2 & heap_bh121_w2_1 & heap_bh121_w2_0;
   CompressorIn_bh121_39_41(0) <= heap_bh121_w3_3;
      Compressor_bh121_39: Compressor_14_3
      port map ( R => CompressorOut_bh121_39_39,
                 X0 => CompressorIn_bh121_39_40,
                 X1 => CompressorIn_bh121_39_41);
   heap_bh121_w2_5 <= CompressorOut_bh121_39_39(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w3_4 <= CompressorOut_bh121_39_39(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w4_4 <= CompressorOut_bh121_39_39(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_40_42 <= heap_bh121_w4_3 & heap_bh121_w4_2 & heap_bh121_w4_1 & heap_bh121_w4_0;
   CompressorIn_bh121_40_43(0) <= heap_bh121_w5_3;
      Compressor_bh121_40: Compressor_14_3
      port map ( R => CompressorOut_bh121_40_40,
                 X0 => CompressorIn_bh121_40_42,
                 X1 => CompressorIn_bh121_40_43);
   heap_bh121_w4_5 <= CompressorOut_bh121_40_40(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w5_4 <= CompressorOut_bh121_40_40(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w6_4 <= CompressorOut_bh121_40_40(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_41_44 <= heap_bh121_w6_3 & heap_bh121_w6_2 & heap_bh121_w6_1 & heap_bh121_w6_0;
   CompressorIn_bh121_41_45(0) <= heap_bh121_w7_3;
      Compressor_bh121_41: Compressor_14_3
      port map ( R => CompressorOut_bh121_41_41,
                 X0 => CompressorIn_bh121_41_44,
                 X1 => CompressorIn_bh121_41_45);
   heap_bh121_w6_5 <= CompressorOut_bh121_41_41(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w7_4 <= CompressorOut_bh121_41_41(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w8_4 <= CompressorOut_bh121_41_41(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_42_46 <= heap_bh121_w8_3 & heap_bh121_w8_2 & heap_bh121_w8_1 & heap_bh121_w8_0;
   CompressorIn_bh121_42_47(0) <= heap_bh121_w9_3;
      Compressor_bh121_42: Compressor_14_3
      port map ( R => CompressorOut_bh121_42_42,
                 X0 => CompressorIn_bh121_42_46,
                 X1 => CompressorIn_bh121_42_47);
   heap_bh121_w8_5 <= CompressorOut_bh121_42_42(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w9_4 <= CompressorOut_bh121_42_42(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w10_4 <= CompressorOut_bh121_42_42(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_43_48 <= heap_bh121_w10_3 & heap_bh121_w10_2 & heap_bh121_w10_1 & heap_bh121_w10_0;
   CompressorIn_bh121_43_49(0) <= heap_bh121_w11_3;
      Compressor_bh121_43: Compressor_14_3
      port map ( R => CompressorOut_bh121_43_43,
                 X0 => CompressorIn_bh121_43_48,
                 X1 => CompressorIn_bh121_43_49);
   heap_bh121_w10_5 <= CompressorOut_bh121_43_43(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w11_4 <= CompressorOut_bh121_43_43(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w12_4 <= CompressorOut_bh121_43_43(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_44_50 <= heap_bh121_w12_3 & heap_bh121_w12_2 & heap_bh121_w12_1 & heap_bh121_w12_0;
   CompressorIn_bh121_44_51(0) <= heap_bh121_w13_3;
      Compressor_bh121_44: Compressor_14_3
      port map ( R => CompressorOut_bh121_44_44,
                 X0 => CompressorIn_bh121_44_50,
                 X1 => CompressorIn_bh121_44_51);
   heap_bh121_w12_5 <= CompressorOut_bh121_44_44(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w13_4 <= CompressorOut_bh121_44_44(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w14_5 <= CompressorOut_bh121_44_44(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_45_52 <= heap_bh121_w14_4 & heap_bh121_w14_3 & heap_bh121_w14_2 & heap_bh121_w14_1;
   CompressorIn_bh121_45_53(0) <= heap_bh121_w15_4;
      Compressor_bh121_45: Compressor_14_3
      port map ( R => CompressorOut_bh121_45_45,
                 X0 => CompressorIn_bh121_45_52,
                 X1 => CompressorIn_bh121_45_53);
   heap_bh121_w14_6 <= CompressorOut_bh121_45_45(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w15_5 <= CompressorOut_bh121_45_45(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w16_5 <= CompressorOut_bh121_45_45(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_46_54 <= heap_bh121_w15_3 & heap_bh121_w15_2 & heap_bh121_w15_1 & heap_bh121_w15_0;
   CompressorIn_bh121_46_55(0) <= heap_bh121_w16_4;
      Compressor_bh121_46: Compressor_14_3
      port map ( R => CompressorOut_bh121_46_46,
                 X0 => CompressorIn_bh121_46_54,
                 X1 => CompressorIn_bh121_46_55);
   heap_bh121_w15_6 <= CompressorOut_bh121_46_46(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w16_6 <= CompressorOut_bh121_46_46(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w17_7 <= CompressorOut_bh121_46_46(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_47_56 <= heap_bh121_w55_4 & heap_bh121_w55_3 & heap_bh121_w55_2 & heap_bh121_w55_1;
   CompressorIn_bh121_47_57(0) <= heap_bh121_w56_4;
      Compressor_bh121_47: Compressor_14_3
      port map ( R => CompressorOut_bh121_47_47,
                 X0 => CompressorIn_bh121_47_56,
                 X1 => CompressorIn_bh121_47_57);
   heap_bh121_w55_7 <= CompressorOut_bh121_47_47(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w56_6 <= CompressorOut_bh121_47_47(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w57_5 <= CompressorOut_bh121_47_47(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_48_58 <= heap_bh121_w56_3 & heap_bh121_w56_2 & heap_bh121_w56_1 & heap_bh121_w56_0;
   CompressorIn_bh121_48_59(0) <= heap_bh121_w57_4;
      Compressor_bh121_48: Compressor_14_3
      port map ( R => CompressorOut_bh121_48_48,
                 X0 => CompressorIn_bh121_48_58,
                 X1 => CompressorIn_bh121_48_59);
   heap_bh121_w56_7 <= CompressorOut_bh121_48_48(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w57_6 <= CompressorOut_bh121_48_48(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w58_4 <= CompressorOut_bh121_48_48(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_49_60 <= heap_bh121_w57_3 & heap_bh121_w57_2 & heap_bh121_w57_1 & heap_bh121_w57_0;
   CompressorIn_bh121_49_61(0) <= heap_bh121_w58_3;
      Compressor_bh121_49: Compressor_14_3
      port map ( R => CompressorOut_bh121_49_49,
                 X0 => CompressorIn_bh121_49_60,
                 X1 => CompressorIn_bh121_49_61);
   heap_bh121_w57_7 <= CompressorOut_bh121_49_49(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w58_5 <= CompressorOut_bh121_49_49(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w59_4 <= CompressorOut_bh121_49_49(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_50_62 <= heap_bh121_w59_3 & heap_bh121_w59_2 & heap_bh121_w59_1 & heap_bh121_w59_0;
   CompressorIn_bh121_50_63(0) <= heap_bh121_w60_3;
      Compressor_bh121_50: Compressor_14_3
      port map ( R => CompressorOut_bh121_50_50,
                 X0 => CompressorIn_bh121_50_62,
                 X1 => CompressorIn_bh121_50_63);
   heap_bh121_w59_5 <= CompressorOut_bh121_50_50(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w60_4 <= CompressorOut_bh121_50_50(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w61_4 <= CompressorOut_bh121_50_50(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_51_64 <= heap_bh121_w61_3 & heap_bh121_w61_2 & heap_bh121_w61_1 & heap_bh121_w61_0;
   CompressorIn_bh121_51_65(0) <= heap_bh121_w62_3;
      Compressor_bh121_51: Compressor_14_3
      port map ( R => CompressorOut_bh121_51_51,
                 X0 => CompressorIn_bh121_51_64,
                 X1 => CompressorIn_bh121_51_65);
   heap_bh121_w61_5 <= CompressorOut_bh121_51_51(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w62_4 <= CompressorOut_bh121_51_51(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w63_4 <= CompressorOut_bh121_51_51(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_52_66 <= heap_bh121_w63_3 & heap_bh121_w63_2 & heap_bh121_w63_1 & heap_bh121_w63_0;
   CompressorIn_bh121_52_67(0) <= heap_bh121_w64_3;
      Compressor_bh121_52: Compressor_14_3
      port map ( R => CompressorOut_bh121_52_52,
                 X0 => CompressorIn_bh121_52_66,
                 X1 => CompressorIn_bh121_52_67);
   heap_bh121_w63_5 <= CompressorOut_bh121_52_52(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w64_4 <= CompressorOut_bh121_52_52(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w65_4 <= CompressorOut_bh121_52_52(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_53_68 <= heap_bh121_w65_3 & heap_bh121_w65_2 & heap_bh121_w65_1 & heap_bh121_w65_0;
   CompressorIn_bh121_53_69(0) <= heap_bh121_w66_3;
      Compressor_bh121_53: Compressor_14_3
      port map ( R => CompressorOut_bh121_53_53,
                 X0 => CompressorIn_bh121_53_68,
                 X1 => CompressorIn_bh121_53_69);
   heap_bh121_w65_5 <= CompressorOut_bh121_53_53(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w66_4 <= CompressorOut_bh121_53_53(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w67_4 <= CompressorOut_bh121_53_53(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_54_70 <= heap_bh121_w67_3 & heap_bh121_w67_2 & heap_bh121_w67_1 & heap_bh121_w67_0;
   CompressorIn_bh121_54_71(0) <= heap_bh121_w68_3;
      Compressor_bh121_54: Compressor_14_3
      port map ( R => CompressorOut_bh121_54_54,
                 X0 => CompressorIn_bh121_54_70,
                 X1 => CompressorIn_bh121_54_71);
   heap_bh121_w67_5 <= CompressorOut_bh121_54_54(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w68_4 <= CompressorOut_bh121_54_54(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w69_4 <= CompressorOut_bh121_54_54(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_55_72 <= heap_bh121_w69_3 & heap_bh121_w69_2 & heap_bh121_w69_1 & heap_bh121_w69_0;
   CompressorIn_bh121_55_73(0) <= heap_bh121_w70_3;
      Compressor_bh121_55: Compressor_14_3
      port map ( R => CompressorOut_bh121_55_55,
                 X0 => CompressorIn_bh121_55_72,
                 X1 => CompressorIn_bh121_55_73);
   heap_bh121_w69_5 <= CompressorOut_bh121_55_55(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w70_4 <= CompressorOut_bh121_55_55(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w71_4 <= CompressorOut_bh121_55_55(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_56_74 <= heap_bh121_w71_3 & heap_bh121_w71_2 & heap_bh121_w71_1 & heap_bh121_w71_0;
   CompressorIn_bh121_56_75(0) <= heap_bh121_w72_2;
      Compressor_bh121_56: Compressor_14_3
      port map ( R => CompressorOut_bh121_56_56,
                 X0 => CompressorIn_bh121_56_74,
                 X1 => CompressorIn_bh121_56_75);
   heap_bh121_w71_5 <= CompressorOut_bh121_56_56(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w72_3 <= CompressorOut_bh121_56_56(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w73_3 <= CompressorOut_bh121_56_56(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_57_76 <= heap_bh121_w16_3 & heap_bh121_w16_2 & heap_bh121_w16_1 & heap_bh121_w16_0;
      Compressor_bh121_57: Compressor_4_3
      port map ( R => CompressorOut_bh121_57_57,
                 X0 => CompressorIn_bh121_57_76);
   heap_bh121_w16_7 <= CompressorOut_bh121_57_57(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w17_8 <= CompressorOut_bh121_57_57(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w18_8 <= CompressorOut_bh121_57_57(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_58_77 <= heap_bh121_w73_2 & heap_bh121_w73_1 & heap_bh121_w73_0;
   CompressorIn_bh121_58_78 <= heap_bh121_w74_2 & heap_bh121_w74_1;
      Compressor_bh121_58: Compressor_23_3
      port map ( R => CompressorOut_bh121_58_58,
                 X0 => CompressorIn_bh121_58_77,
                 X1 => CompressorIn_bh121_58_78);
   heap_bh121_w73_4 <= CompressorOut_bh121_58_58(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w74_3 <= CompressorOut_bh121_58_58(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w75_3 <= CompressorOut_bh121_58_58(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_59_79 <= heap_bh121_w75_2 & heap_bh121_w75_1 & heap_bh121_w75_0;
   CompressorIn_bh121_59_80 <= heap_bh121_w76_2 & heap_bh121_w76_1;
      Compressor_bh121_59: Compressor_23_3
      port map ( R => CompressorOut_bh121_59_59,
                 X0 => CompressorIn_bh121_59_79,
                 X1 => CompressorIn_bh121_59_80);
   heap_bh121_w75_4 <= CompressorOut_bh121_59_59(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w76_3 <= CompressorOut_bh121_59_59(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w77_3 <= CompressorOut_bh121_59_59(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_60_81 <= heap_bh121_w77_2 & heap_bh121_w77_1 & heap_bh121_w77_0;
   CompressorIn_bh121_60_82 <= heap_bh121_w78_2 & heap_bh121_w78_1;
      Compressor_bh121_60: Compressor_23_3
      port map ( R => CompressorOut_bh121_60_60,
                 X0 => CompressorIn_bh121_60_81,
                 X1 => CompressorIn_bh121_60_82);
   heap_bh121_w77_4 <= CompressorOut_bh121_60_60(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w78_3 <= CompressorOut_bh121_60_60(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w79_3 <= CompressorOut_bh121_60_60(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_61_83 <= heap_bh121_w79_2 & heap_bh121_w79_1 & heap_bh121_w79_0;
   CompressorIn_bh121_61_84 <= heap_bh121_w80_2 & heap_bh121_w80_1;
      Compressor_bh121_61: Compressor_23_3
      port map ( R => CompressorOut_bh121_61_61,
                 X0 => CompressorIn_bh121_61_83,
                 X1 => CompressorIn_bh121_61_84);
   heap_bh121_w79_4 <= CompressorOut_bh121_61_61(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w80_3 <= CompressorOut_bh121_61_61(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w81_3 <= CompressorOut_bh121_61_61(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_62_85 <= heap_bh121_w81_2 & heap_bh121_w81_1 & heap_bh121_w81_0;
   CompressorIn_bh121_62_86 <= heap_bh121_w82_1 & heap_bh121_w82_0;
      Compressor_bh121_62: Compressor_23_3
      port map ( R => CompressorOut_bh121_62_62,
                 X0 => CompressorIn_bh121_62_85,
                 X1 => CompressorIn_bh121_62_86);
   heap_bh121_w81_4 <= CompressorOut_bh121_62_62(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w82_2 <= CompressorOut_bh121_62_62(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w83_2 <= CompressorOut_bh121_62_62(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_63_87 <= heap_bh121_w13_2 & heap_bh121_w13_1 & heap_bh121_w13_0;
   CompressorIn_bh121_63_88(0) <= heap_bh121_w14_0;
      Compressor_bh121_63: Compressor_13_3
      port map ( R => CompressorOut_bh121_63_63,
                 X0 => CompressorIn_bh121_63_87,
                 X1 => CompressorIn_bh121_63_88);
   heap_bh121_w13_5 <= CompressorOut_bh121_63_63(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w14_7 <= CompressorOut_bh121_63_63(1); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w15_7 <= CompressorOut_bh121_63_63(2); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_64_89 <= heap_bh121_w1_2 & heap_bh121_w1_1 & heap_bh121_w1_0;
      Compressor_bh121_64: Compressor_3_2
      port map ( R => CompressorOut_bh121_64_64,
                 X0 => CompressorIn_bh121_64_89);
   heap_bh121_w1_5 <= CompressorOut_bh121_64_64(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w2_6 <= CompressorOut_bh121_64_64(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_65_90 <= heap_bh121_w3_2 & heap_bh121_w3_1 & heap_bh121_w3_0;
      Compressor_bh121_65: Compressor_3_2
      port map ( R => CompressorOut_bh121_65_65,
                 X0 => CompressorIn_bh121_65_90);
   heap_bh121_w3_5 <= CompressorOut_bh121_65_65(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w4_6 <= CompressorOut_bh121_65_65(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_66_91 <= heap_bh121_w5_2 & heap_bh121_w5_1 & heap_bh121_w5_0;
      Compressor_bh121_66: Compressor_3_2
      port map ( R => CompressorOut_bh121_66_66,
                 X0 => CompressorIn_bh121_66_91);
   heap_bh121_w5_5 <= CompressorOut_bh121_66_66(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w6_6 <= CompressorOut_bh121_66_66(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_67_92 <= heap_bh121_w7_2 & heap_bh121_w7_1 & heap_bh121_w7_0;
      Compressor_bh121_67: Compressor_3_2
      port map ( R => CompressorOut_bh121_67_67,
                 X0 => CompressorIn_bh121_67_92);
   heap_bh121_w7_5 <= CompressorOut_bh121_67_67(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w8_6 <= CompressorOut_bh121_67_67(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_68_93 <= heap_bh121_w9_2 & heap_bh121_w9_1 & heap_bh121_w9_0;
      Compressor_bh121_68: Compressor_3_2
      port map ( R => CompressorOut_bh121_68_68,
                 X0 => CompressorIn_bh121_68_93);
   heap_bh121_w9_5 <= CompressorOut_bh121_68_68(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w10_6 <= CompressorOut_bh121_68_68(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_69_94 <= heap_bh121_w11_2 & heap_bh121_w11_1 & heap_bh121_w11_0;
      Compressor_bh121_69: Compressor_3_2
      port map ( R => CompressorOut_bh121_69_69,
                 X0 => CompressorIn_bh121_69_94);
   heap_bh121_w11_5 <= CompressorOut_bh121_69_69(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w12_6 <= CompressorOut_bh121_69_69(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_70_95 <= heap_bh121_w58_2 & heap_bh121_w58_1 & heap_bh121_w58_0;
      Compressor_bh121_70: Compressor_3_2
      port map ( R => CompressorOut_bh121_70_70,
                 X0 => CompressorIn_bh121_70_95);
   heap_bh121_w58_6 <= CompressorOut_bh121_70_70(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w59_6 <= CompressorOut_bh121_70_70(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_71_96 <= heap_bh121_w60_2 & heap_bh121_w60_1 & heap_bh121_w60_0;
      Compressor_bh121_71: Compressor_3_2
      port map ( R => CompressorOut_bh121_71_71,
                 X0 => CompressorIn_bh121_71_96);
   heap_bh121_w60_5 <= CompressorOut_bh121_71_71(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w61_6 <= CompressorOut_bh121_71_71(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_72_97 <= heap_bh121_w62_2 & heap_bh121_w62_1 & heap_bh121_w62_0;
      Compressor_bh121_72: Compressor_3_2
      port map ( R => CompressorOut_bh121_72_72,
                 X0 => CompressorIn_bh121_72_97);
   heap_bh121_w62_5 <= CompressorOut_bh121_72_72(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w63_6 <= CompressorOut_bh121_72_72(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_73_98 <= heap_bh121_w64_2 & heap_bh121_w64_1 & heap_bh121_w64_0;
      Compressor_bh121_73: Compressor_3_2
      port map ( R => CompressorOut_bh121_73_73,
                 X0 => CompressorIn_bh121_73_98);
   heap_bh121_w64_5 <= CompressorOut_bh121_73_73(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w65_6 <= CompressorOut_bh121_73_73(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_74_99 <= heap_bh121_w66_2 & heap_bh121_w66_1 & heap_bh121_w66_0;
      Compressor_bh121_74: Compressor_3_2
      port map ( R => CompressorOut_bh121_74_74,
                 X0 => CompressorIn_bh121_74_99);
   heap_bh121_w66_5 <= CompressorOut_bh121_74_74(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w67_6 <= CompressorOut_bh121_74_74(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_75_100 <= heap_bh121_w68_2 & heap_bh121_w68_1 & heap_bh121_w68_0;
      Compressor_bh121_75: Compressor_3_2
      port map ( R => CompressorOut_bh121_75_75,
                 X0 => CompressorIn_bh121_75_100);
   heap_bh121_w68_5 <= CompressorOut_bh121_75_75(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w69_6 <= CompressorOut_bh121_75_75(1); -- cycle= 1 cp= 9.1772e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_76_101 <= heap_bh121_w70_2 & heap_bh121_w70_1 & heap_bh121_w70_0;
      Compressor_bh121_76: Compressor_3_2
      port map ( R => CompressorOut_bh121_76_76,
                 X0 => CompressorIn_bh121_76_101);
   heap_bh121_w70_5 <= CompressorOut_bh121_76_76(0); -- cycle= 1 cp= 9.1772e-10
   heap_bh121_w71_6 <= CompressorOut_bh121_76_76(1); -- cycle= 1 cp= 9.1772e-10
   ----------------Synchro barrier, entering cycle 1----------------
   tempR_bh121_0 <= heap_bh121_w0_4; -- already compressed

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_77_102 <= heap_bh121_w55_0 & heap_bh121_w55_7 & heap_bh121_w55_6 & heap_bh121_w55_5;
   CompressorIn_bh121_77_103(0) <= heap_bh121_w56_7;
      Compressor_bh121_77: Compressor_14_3
      port map ( R => CompressorOut_bh121_77_77,
                 X0 => CompressorIn_bh121_77_102,
                 X1 => CompressorIn_bh121_77_103);
   heap_bh121_w55_8 <= CompressorOut_bh121_77_77(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w56_8 <= CompressorOut_bh121_77_77(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w57_8 <= CompressorOut_bh121_77_77(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_78_104 <= heap_bh121_w2_6 & heap_bh121_w2_5 & heap_bh121_w2_4;
   CompressorIn_bh121_78_105 <= heap_bh121_w3_5 & heap_bh121_w3_4;
      Compressor_bh121_78: Compressor_23_3
      port map ( R => CompressorOut_bh121_78_78,
                 X0 => CompressorIn_bh121_78_104,
                 X1 => CompressorIn_bh121_78_105);
   heap_bh121_w2_7 <= CompressorOut_bh121_78_78(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w3_6 <= CompressorOut_bh121_78_78(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w4_7 <= CompressorOut_bh121_78_78(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_79_106 <= heap_bh121_w4_6 & heap_bh121_w4_5 & heap_bh121_w4_4;
   CompressorIn_bh121_79_107 <= heap_bh121_w5_5 & heap_bh121_w5_4;
      Compressor_bh121_79: Compressor_23_3
      port map ( R => CompressorOut_bh121_79_79,
                 X0 => CompressorIn_bh121_79_106,
                 X1 => CompressorIn_bh121_79_107);
   heap_bh121_w4_8 <= CompressorOut_bh121_79_79(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w5_6 <= CompressorOut_bh121_79_79(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w6_7 <= CompressorOut_bh121_79_79(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_80_108 <= heap_bh121_w6_6 & heap_bh121_w6_5 & heap_bh121_w6_4;
   CompressorIn_bh121_80_109 <= heap_bh121_w7_5 & heap_bh121_w7_4;
      Compressor_bh121_80: Compressor_23_3
      port map ( R => CompressorOut_bh121_80_80,
                 X0 => CompressorIn_bh121_80_108,
                 X1 => CompressorIn_bh121_80_109);
   heap_bh121_w6_8 <= CompressorOut_bh121_80_80(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w7_6 <= CompressorOut_bh121_80_80(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w8_7 <= CompressorOut_bh121_80_80(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_81_110 <= heap_bh121_w8_6 & heap_bh121_w8_5 & heap_bh121_w8_4;
   CompressorIn_bh121_81_111 <= heap_bh121_w9_5 & heap_bh121_w9_4;
      Compressor_bh121_81: Compressor_23_3
      port map ( R => CompressorOut_bh121_81_81,
                 X0 => CompressorIn_bh121_81_110,
                 X1 => CompressorIn_bh121_81_111);
   heap_bh121_w8_8 <= CompressorOut_bh121_81_81(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w9_6 <= CompressorOut_bh121_81_81(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w10_7 <= CompressorOut_bh121_81_81(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_82_112 <= heap_bh121_w10_6 & heap_bh121_w10_5 & heap_bh121_w10_4;
   CompressorIn_bh121_82_113 <= heap_bh121_w11_5 & heap_bh121_w11_4;
      Compressor_bh121_82: Compressor_23_3
      port map ( R => CompressorOut_bh121_82_82,
                 X0 => CompressorIn_bh121_82_112,
                 X1 => CompressorIn_bh121_82_113);
   heap_bh121_w10_8 <= CompressorOut_bh121_82_82(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w11_6 <= CompressorOut_bh121_82_82(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w12_7 <= CompressorOut_bh121_82_82(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_83_114 <= heap_bh121_w12_6 & heap_bh121_w12_5 & heap_bh121_w12_4;
   CompressorIn_bh121_83_115 <= heap_bh121_w13_5 & heap_bh121_w13_4;
      Compressor_bh121_83: Compressor_23_3
      port map ( R => CompressorOut_bh121_83_83,
                 X0 => CompressorIn_bh121_83_114,
                 X1 => CompressorIn_bh121_83_115);
   heap_bh121_w12_8 <= CompressorOut_bh121_83_83(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w13_6 <= CompressorOut_bh121_83_83(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w14_8 <= CompressorOut_bh121_83_83(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_84_116 <= heap_bh121_w14_7 & heap_bh121_w14_6 & heap_bh121_w14_5;
   CompressorIn_bh121_84_117 <= heap_bh121_w15_7 & heap_bh121_w15_6;
      Compressor_bh121_84: Compressor_23_3
      port map ( R => CompressorOut_bh121_84_84,
                 X0 => CompressorIn_bh121_84_116,
                 X1 => CompressorIn_bh121_84_117);
   heap_bh121_w14_9 <= CompressorOut_bh121_84_84(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w15_8 <= CompressorOut_bh121_84_84(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w16_8 <= CompressorOut_bh121_84_84(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_85_118 <= heap_bh121_w16_7 & heap_bh121_w16_6 & heap_bh121_w16_5;
   CompressorIn_bh121_85_119 <= heap_bh121_w17_8 & heap_bh121_w17_7;
      Compressor_bh121_85: Compressor_23_3
      port map ( R => CompressorOut_bh121_85_85,
                 X0 => CompressorIn_bh121_85_118,
                 X1 => CompressorIn_bh121_85_119);
   heap_bh121_w16_9 <= CompressorOut_bh121_85_85(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w17_9 <= CompressorOut_bh121_85_85(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w18_9 <= CompressorOut_bh121_85_85(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_86_120 <= heap_bh121_w18_8 & heap_bh121_w18_7 & heap_bh121_w18_6;
   CompressorIn_bh121_86_121 <= heap_bh121_w19_8 & heap_bh121_w19_7;
      Compressor_bh121_86: Compressor_23_3
      port map ( R => CompressorOut_bh121_86_86,
                 X0 => CompressorIn_bh121_86_120,
                 X1 => CompressorIn_bh121_86_121);
   heap_bh121_w18_10 <= CompressorOut_bh121_86_86(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w19_9 <= CompressorOut_bh121_86_86(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w20_9 <= CompressorOut_bh121_86_86(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_87_122 <= heap_bh121_w20_8 & heap_bh121_w20_7 & heap_bh121_w20_6;
   CompressorIn_bh121_87_123 <= heap_bh121_w21_8 & heap_bh121_w21_7;
      Compressor_bh121_87: Compressor_23_3
      port map ( R => CompressorOut_bh121_87_87,
                 X0 => CompressorIn_bh121_87_122,
                 X1 => CompressorIn_bh121_87_123);
   heap_bh121_w20_10 <= CompressorOut_bh121_87_87(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w21_9 <= CompressorOut_bh121_87_87(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w22_9 <= CompressorOut_bh121_87_87(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_88_124 <= heap_bh121_w22_8 & heap_bh121_w22_7 & heap_bh121_w22_6;
   CompressorIn_bh121_88_125 <= heap_bh121_w23_8 & heap_bh121_w23_7;
      Compressor_bh121_88: Compressor_23_3
      port map ( R => CompressorOut_bh121_88_88,
                 X0 => CompressorIn_bh121_88_124,
                 X1 => CompressorIn_bh121_88_125);
   heap_bh121_w22_10 <= CompressorOut_bh121_88_88(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w23_9 <= CompressorOut_bh121_88_88(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w24_9 <= CompressorOut_bh121_88_88(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_89_126 <= heap_bh121_w24_8 & heap_bh121_w24_7 & heap_bh121_w24_6;
   CompressorIn_bh121_89_127 <= heap_bh121_w25_8 & heap_bh121_w25_7;
      Compressor_bh121_89: Compressor_23_3
      port map ( R => CompressorOut_bh121_89_89,
                 X0 => CompressorIn_bh121_89_126,
                 X1 => CompressorIn_bh121_89_127);
   heap_bh121_w24_10 <= CompressorOut_bh121_89_89(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w25_9 <= CompressorOut_bh121_89_89(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w26_9 <= CompressorOut_bh121_89_89(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_90_128 <= heap_bh121_w26_8 & heap_bh121_w26_7 & heap_bh121_w26_6;
   CompressorIn_bh121_90_129 <= heap_bh121_w27_8 & heap_bh121_w27_7;
      Compressor_bh121_90: Compressor_23_3
      port map ( R => CompressorOut_bh121_90_90,
                 X0 => CompressorIn_bh121_90_128,
                 X1 => CompressorIn_bh121_90_129);
   heap_bh121_w26_10 <= CompressorOut_bh121_90_90(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w27_9 <= CompressorOut_bh121_90_90(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w28_9 <= CompressorOut_bh121_90_90(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_91_130 <= heap_bh121_w28_8 & heap_bh121_w28_7 & heap_bh121_w28_6;
   CompressorIn_bh121_91_131 <= heap_bh121_w29_8 & heap_bh121_w29_7;
      Compressor_bh121_91: Compressor_23_3
      port map ( R => CompressorOut_bh121_91_91,
                 X0 => CompressorIn_bh121_91_130,
                 X1 => CompressorIn_bh121_91_131);
   heap_bh121_w28_10 <= CompressorOut_bh121_91_91(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w29_9 <= CompressorOut_bh121_91_91(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w30_9 <= CompressorOut_bh121_91_91(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_92_132 <= heap_bh121_w30_8 & heap_bh121_w30_7 & heap_bh121_w30_6;
   CompressorIn_bh121_92_133 <= heap_bh121_w31_8 & heap_bh121_w31_7;
      Compressor_bh121_92: Compressor_23_3
      port map ( R => CompressorOut_bh121_92_92,
                 X0 => CompressorIn_bh121_92_132,
                 X1 => CompressorIn_bh121_92_133);
   heap_bh121_w30_10 <= CompressorOut_bh121_92_92(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w31_9 <= CompressorOut_bh121_92_92(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w32_9 <= CompressorOut_bh121_92_92(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_93_134 <= heap_bh121_w32_8 & heap_bh121_w32_7 & heap_bh121_w32_6;
   CompressorIn_bh121_93_135 <= heap_bh121_w33_8 & heap_bh121_w33_7;
      Compressor_bh121_93: Compressor_23_3
      port map ( R => CompressorOut_bh121_93_93,
                 X0 => CompressorIn_bh121_93_134,
                 X1 => CompressorIn_bh121_93_135);
   heap_bh121_w32_10 <= CompressorOut_bh121_93_93(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w33_9 <= CompressorOut_bh121_93_93(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w34_9 <= CompressorOut_bh121_93_93(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_94_136 <= heap_bh121_w34_8 & heap_bh121_w34_7 & heap_bh121_w34_6;
   CompressorIn_bh121_94_137 <= heap_bh121_w35_8 & heap_bh121_w35_7;
      Compressor_bh121_94: Compressor_23_3
      port map ( R => CompressorOut_bh121_94_94,
                 X0 => CompressorIn_bh121_94_136,
                 X1 => CompressorIn_bh121_94_137);
   heap_bh121_w34_10 <= CompressorOut_bh121_94_94(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w35_9 <= CompressorOut_bh121_94_94(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w36_9 <= CompressorOut_bh121_94_94(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_95_138 <= heap_bh121_w36_8 & heap_bh121_w36_7 & heap_bh121_w36_6;
   CompressorIn_bh121_95_139 <= heap_bh121_w37_8 & heap_bh121_w37_7;
      Compressor_bh121_95: Compressor_23_3
      port map ( R => CompressorOut_bh121_95_95,
                 X0 => CompressorIn_bh121_95_138,
                 X1 => CompressorIn_bh121_95_139);
   heap_bh121_w36_10 <= CompressorOut_bh121_95_95(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w37_9 <= CompressorOut_bh121_95_95(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w38_9 <= CompressorOut_bh121_95_95(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_96_140 <= heap_bh121_w38_8 & heap_bh121_w38_7 & heap_bh121_w38_6;
   CompressorIn_bh121_96_141 <= heap_bh121_w39_8 & heap_bh121_w39_7;
      Compressor_bh121_96: Compressor_23_3
      port map ( R => CompressorOut_bh121_96_96,
                 X0 => CompressorIn_bh121_96_140,
                 X1 => CompressorIn_bh121_96_141);
   heap_bh121_w38_10 <= CompressorOut_bh121_96_96(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w39_9 <= CompressorOut_bh121_96_96(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w40_9 <= CompressorOut_bh121_96_96(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_97_142 <= heap_bh121_w40_8 & heap_bh121_w40_7 & heap_bh121_w40_6;
   CompressorIn_bh121_97_143 <= heap_bh121_w41_8 & heap_bh121_w41_7;
      Compressor_bh121_97: Compressor_23_3
      port map ( R => CompressorOut_bh121_97_97,
                 X0 => CompressorIn_bh121_97_142,
                 X1 => CompressorIn_bh121_97_143);
   heap_bh121_w40_10 <= CompressorOut_bh121_97_97(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w41_9 <= CompressorOut_bh121_97_97(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w42_9 <= CompressorOut_bh121_97_97(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_98_144 <= heap_bh121_w42_8 & heap_bh121_w42_7 & heap_bh121_w42_6;
   CompressorIn_bh121_98_145 <= heap_bh121_w43_8 & heap_bh121_w43_7;
      Compressor_bh121_98: Compressor_23_3
      port map ( R => CompressorOut_bh121_98_98,
                 X0 => CompressorIn_bh121_98_144,
                 X1 => CompressorIn_bh121_98_145);
   heap_bh121_w42_10 <= CompressorOut_bh121_98_98(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w43_9 <= CompressorOut_bh121_98_98(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w44_9 <= CompressorOut_bh121_98_98(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_99_146 <= heap_bh121_w44_8 & heap_bh121_w44_7 & heap_bh121_w44_6;
   CompressorIn_bh121_99_147 <= heap_bh121_w45_8 & heap_bh121_w45_7;
      Compressor_bh121_99: Compressor_23_3
      port map ( R => CompressorOut_bh121_99_99,
                 X0 => CompressorIn_bh121_99_146,
                 X1 => CompressorIn_bh121_99_147);
   heap_bh121_w44_10 <= CompressorOut_bh121_99_99(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w45_9 <= CompressorOut_bh121_99_99(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w46_9 <= CompressorOut_bh121_99_99(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_100_148 <= heap_bh121_w46_8 & heap_bh121_w46_7 & heap_bh121_w46_6;
   CompressorIn_bh121_100_149 <= heap_bh121_w47_8 & heap_bh121_w47_7;
      Compressor_bh121_100: Compressor_23_3
      port map ( R => CompressorOut_bh121_100_100,
                 X0 => CompressorIn_bh121_100_148,
                 X1 => CompressorIn_bh121_100_149);
   heap_bh121_w46_10 <= CompressorOut_bh121_100_100(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w47_9 <= CompressorOut_bh121_100_100(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w48_9 <= CompressorOut_bh121_100_100(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_101_150 <= heap_bh121_w48_8 & heap_bh121_w48_7 & heap_bh121_w48_6;
   CompressorIn_bh121_101_151 <= heap_bh121_w49_8 & heap_bh121_w49_7;
      Compressor_bh121_101: Compressor_23_3
      port map ( R => CompressorOut_bh121_101_101,
                 X0 => CompressorIn_bh121_101_150,
                 X1 => CompressorIn_bh121_101_151);
   heap_bh121_w48_10 <= CompressorOut_bh121_101_101(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w49_9 <= CompressorOut_bh121_101_101(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w50_9 <= CompressorOut_bh121_101_101(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_102_152 <= heap_bh121_w50_8 & heap_bh121_w50_7 & heap_bh121_w50_6;
   CompressorIn_bh121_102_153 <= heap_bh121_w51_8 & heap_bh121_w51_7;
      Compressor_bh121_102: Compressor_23_3
      port map ( R => CompressorOut_bh121_102_102,
                 X0 => CompressorIn_bh121_102_152,
                 X1 => CompressorIn_bh121_102_153);
   heap_bh121_w50_10 <= CompressorOut_bh121_102_102(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w51_9 <= CompressorOut_bh121_102_102(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w52_9 <= CompressorOut_bh121_102_102(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_103_154 <= heap_bh121_w52_8 & heap_bh121_w52_7 & heap_bh121_w52_6;
   CompressorIn_bh121_103_155 <= heap_bh121_w53_8 & heap_bh121_w53_7;
      Compressor_bh121_103: Compressor_23_3
      port map ( R => CompressorOut_bh121_103_103,
                 X0 => CompressorIn_bh121_103_154,
                 X1 => CompressorIn_bh121_103_155);
   heap_bh121_w52_10 <= CompressorOut_bh121_103_103(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w53_9 <= CompressorOut_bh121_103_103(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w54_9 <= CompressorOut_bh121_103_103(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_104_156 <= heap_bh121_w57_7 & heap_bh121_w57_6 & heap_bh121_w57_5;
   CompressorIn_bh121_104_157 <= heap_bh121_w58_6 & heap_bh121_w58_5;
      Compressor_bh121_104: Compressor_23_3
      port map ( R => CompressorOut_bh121_104_104,
                 X0 => CompressorIn_bh121_104_156,
                 X1 => CompressorIn_bh121_104_157);
   heap_bh121_w57_9 <= CompressorOut_bh121_104_104(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w58_7 <= CompressorOut_bh121_104_104(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w59_7 <= CompressorOut_bh121_104_104(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_105_158 <= heap_bh121_w59_6 & heap_bh121_w59_5 & heap_bh121_w59_4;
   CompressorIn_bh121_105_159 <= heap_bh121_w60_5 & heap_bh121_w60_4;
      Compressor_bh121_105: Compressor_23_3
      port map ( R => CompressorOut_bh121_105_105,
                 X0 => CompressorIn_bh121_105_158,
                 X1 => CompressorIn_bh121_105_159);
   heap_bh121_w59_8 <= CompressorOut_bh121_105_105(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w60_6 <= CompressorOut_bh121_105_105(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w61_7 <= CompressorOut_bh121_105_105(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_106_160 <= heap_bh121_w61_6 & heap_bh121_w61_5 & heap_bh121_w61_4;
   CompressorIn_bh121_106_161 <= heap_bh121_w62_5 & heap_bh121_w62_4;
      Compressor_bh121_106: Compressor_23_3
      port map ( R => CompressorOut_bh121_106_106,
                 X0 => CompressorIn_bh121_106_160,
                 X1 => CompressorIn_bh121_106_161);
   heap_bh121_w61_8 <= CompressorOut_bh121_106_106(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w62_6 <= CompressorOut_bh121_106_106(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w63_7 <= CompressorOut_bh121_106_106(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_107_162 <= heap_bh121_w63_6 & heap_bh121_w63_5 & heap_bh121_w63_4;
   CompressorIn_bh121_107_163 <= heap_bh121_w64_5 & heap_bh121_w64_4;
      Compressor_bh121_107: Compressor_23_3
      port map ( R => CompressorOut_bh121_107_107,
                 X0 => CompressorIn_bh121_107_162,
                 X1 => CompressorIn_bh121_107_163);
   heap_bh121_w63_8 <= CompressorOut_bh121_107_107(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w64_6 <= CompressorOut_bh121_107_107(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w65_7 <= CompressorOut_bh121_107_107(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_108_164 <= heap_bh121_w65_6 & heap_bh121_w65_5 & heap_bh121_w65_4;
   CompressorIn_bh121_108_165 <= heap_bh121_w66_5 & heap_bh121_w66_4;
      Compressor_bh121_108: Compressor_23_3
      port map ( R => CompressorOut_bh121_108_108,
                 X0 => CompressorIn_bh121_108_164,
                 X1 => CompressorIn_bh121_108_165);
   heap_bh121_w65_8 <= CompressorOut_bh121_108_108(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w66_6 <= CompressorOut_bh121_108_108(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w67_7 <= CompressorOut_bh121_108_108(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_109_166 <= heap_bh121_w67_6 & heap_bh121_w67_5 & heap_bh121_w67_4;
   CompressorIn_bh121_109_167 <= heap_bh121_w68_5 & heap_bh121_w68_4;
      Compressor_bh121_109: Compressor_23_3
      port map ( R => CompressorOut_bh121_109_109,
                 X0 => CompressorIn_bh121_109_166,
                 X1 => CompressorIn_bh121_109_167);
   heap_bh121_w67_8 <= CompressorOut_bh121_109_109(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w68_6 <= CompressorOut_bh121_109_109(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w69_7 <= CompressorOut_bh121_109_109(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_110_168 <= heap_bh121_w69_6 & heap_bh121_w69_5 & heap_bh121_w69_4;
   CompressorIn_bh121_110_169 <= heap_bh121_w70_5 & heap_bh121_w70_4;
      Compressor_bh121_110: Compressor_23_3
      port map ( R => CompressorOut_bh121_110_110,
                 X0 => CompressorIn_bh121_110_168,
                 X1 => CompressorIn_bh121_110_169);
   heap_bh121_w69_8 <= CompressorOut_bh121_110_110(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w70_6 <= CompressorOut_bh121_110_110(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w71_7 <= CompressorOut_bh121_110_110(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_111_170 <= heap_bh121_w71_6 & heap_bh121_w71_5 & heap_bh121_w71_4;
   CompressorIn_bh121_111_171 <= heap_bh121_w72_1 & heap_bh121_w72_0;
      Compressor_bh121_111: Compressor_23_3
      port map ( R => CompressorOut_bh121_111_111,
                 X0 => CompressorIn_bh121_111_170,
                 X1 => CompressorIn_bh121_111_171);
   heap_bh121_w71_8 <= CompressorOut_bh121_111_111(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w72_4 <= CompressorOut_bh121_111_111(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w73_5 <= CompressorOut_bh121_111_111(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_112_172 <= heap_bh121_w83_1 & heap_bh121_w83_0 & heap_bh121_w83_2;
   CompressorIn_bh121_112_173 <= heap_bh121_w84_1 & heap_bh121_w84_0;
      Compressor_bh121_112: Compressor_23_3
      port map ( R => CompressorOut_bh121_112_112,
                 X0 => CompressorIn_bh121_112_172,
                 X1 => CompressorIn_bh121_112_173);
   heap_bh121_w83_3 <= CompressorOut_bh121_112_112(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w84_2 <= CompressorOut_bh121_112_112(1); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w85_2 <= CompressorOut_bh121_112_112(2); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh121_113_174 <= heap_bh121_w54_8 & heap_bh121_w54_7 & heap_bh121_w54_6;
      Compressor_bh121_113: Compressor_3_2
      port map ( R => CompressorOut_bh121_113_113,
                 X0 => CompressorIn_bh121_113_174);
   heap_bh121_w54_10 <= CompressorOut_bh121_113_113(0); -- cycle= 1 cp= 1.44844e-09
   heap_bh121_w55_9 <= CompressorOut_bh121_113_113(1); -- cycle= 1 cp= 1.44844e-09

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh121_114_175 <= heap_bh121_w56_6_d1 & heap_bh121_w56_5_d1 & heap_bh121_w56_8_d1;
   CompressorIn_bh121_114_176 <= heap_bh121_w57_9_d1 & heap_bh121_w57_8_d1;
      Compressor_bh121_114: Compressor_23_3
      port map ( R => CompressorOut_bh121_114_114,
                 X0 => CompressorIn_bh121_114_175,
                 X1 => CompressorIn_bh121_114_176);
   heap_bh121_w56_9 <= CompressorOut_bh121_114_114(0); -- cycle= 2 cp= 5.3072e-10
   heap_bh121_w57_10 <= CompressorOut_bh121_114_114(1); -- cycle= 2 cp= 5.3072e-10
   heap_bh121_w58_8 <= CompressorOut_bh121_114_114(2); -- cycle= 2 cp= 5.3072e-10

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh121_115_177 <= heap_bh121_w73_4_d1 & heap_bh121_w73_3_d1 & heap_bh121_w73_5_d1;
   CompressorIn_bh121_115_178 <= heap_bh121_w74_0_d1 & heap_bh121_w74_3_d1;
      Compressor_bh121_115: Compressor_23_3
      port map ( R => CompressorOut_bh121_115_115,
                 X0 => CompressorIn_bh121_115_177,
                 X1 => CompressorIn_bh121_115_178);
   heap_bh121_w73_6 <= CompressorOut_bh121_115_115(0); -- cycle= 2 cp= 5.3072e-10
   heap_bh121_w74_4 <= CompressorOut_bh121_115_115(1); -- cycle= 2 cp= 5.3072e-10
   heap_bh121_w75_5 <= CompressorOut_bh121_115_115(2); -- cycle= 2 cp= 5.3072e-10

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh121_116_179 <= heap_bh121_w85_1_d1 & heap_bh121_w85_0_d1 & heap_bh121_w85_2_d1;
   CompressorIn_bh121_116_180 <= heap_bh121_w86_1_d1 & heap_bh121_w86_0_d1;
      Compressor_bh121_116: Compressor_23_3
      port map ( R => CompressorOut_bh121_116_116,
                 X0 => CompressorIn_bh121_116_179,
                 X1 => CompressorIn_bh121_116_180);
   heap_bh121_w85_3 <= CompressorOut_bh121_116_116(0); -- cycle= 2 cp= 5.3072e-10
   heap_bh121_w86_2 <= CompressorOut_bh121_116_116(1); -- cycle= 2 cp= 5.3072e-10
   heap_bh121_w87_2 <= CompressorOut_bh121_116_116(2); -- cycle= 2 cp= 5.3072e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh121_117_181 <= heap_bh121_w58_4_d1 & heap_bh121_w58_7_d1 & heap_bh121_w58_8;
   CompressorIn_bh121_117_182 <= heap_bh121_w59_8_d1 & heap_bh121_w59_7_d1;
      Compressor_bh121_117: Compressor_23_3
      port map ( R => CompressorOut_bh121_117_117,
                 X0 => CompressorIn_bh121_117_181,
                 X1 => CompressorIn_bh121_117_182);
   heap_bh121_w58_9 <= CompressorOut_bh121_117_117(0); -- cycle= 2 cp= 1.06144e-09
   heap_bh121_w59_9 <= CompressorOut_bh121_117_117(1); -- cycle= 2 cp= 1.06144e-09
   heap_bh121_w60_7 <= CompressorOut_bh121_117_117(2); -- cycle= 2 cp= 1.06144e-09

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh121_118_183 <= heap_bh121_w75_4_d1 & heap_bh121_w75_3_d1 & heap_bh121_w75_5;
   CompressorIn_bh121_118_184 <= heap_bh121_w76_0_d1 & heap_bh121_w76_3_d1;
      Compressor_bh121_118: Compressor_23_3
      port map ( R => CompressorOut_bh121_118_118,
                 X0 => CompressorIn_bh121_118_183,
                 X1 => CompressorIn_bh121_118_184);
   heap_bh121_w75_6 <= CompressorOut_bh121_118_118(0); -- cycle= 2 cp= 1.06144e-09
   heap_bh121_w76_4 <= CompressorOut_bh121_118_118(1); -- cycle= 2 cp= 1.06144e-09
   heap_bh121_w77_5 <= CompressorOut_bh121_118_118(2); -- cycle= 2 cp= 1.06144e-09

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh121_119_185 <= heap_bh121_w87_1_d1 & heap_bh121_w87_0_d1 & heap_bh121_w87_2;
   CompressorIn_bh121_119_186 <= heap_bh121_w88_1_d1 & heap_bh121_w88_0_d1;
      Compressor_bh121_119: Compressor_23_3
      port map ( R => CompressorOut_bh121_119_119,
                 X0 => CompressorIn_bh121_119_185,
                 X1 => CompressorIn_bh121_119_186);
   heap_bh121_w87_3 <= CompressorOut_bh121_119_119(0); -- cycle= 2 cp= 1.06144e-09
   heap_bh121_w88_2 <= CompressorOut_bh121_119_119(1); -- cycle= 2 cp= 1.06144e-09
   heap_bh121_w89_1 <= CompressorOut_bh121_119_119(2); -- cycle= 2 cp= 1.06144e-09

   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   CompressorIn_bh121_120_187 <= heap_bh121_w77_4_d2 & heap_bh121_w77_3_d2 & heap_bh121_w77_5_d1;
   CompressorIn_bh121_120_188 <= heap_bh121_w78_0_d2 & heap_bh121_w78_3_d2;
      Compressor_bh121_120: Compressor_23_3
      port map ( R => CompressorOut_bh121_120_120,
                 X0 => CompressorIn_bh121_120_187,
                 X1 => CompressorIn_bh121_120_188);
   heap_bh121_w77_6 <= CompressorOut_bh121_120_120(0); -- cycle= 3 cp= 5.3072e-10
   heap_bh121_w78_4 <= CompressorOut_bh121_120_120(1); -- cycle= 3 cp= 5.3072e-10
   heap_bh121_w79_5 <= CompressorOut_bh121_120_120(2); -- cycle= 3 cp= 5.3072e-10

   ----------------Synchro barrier, entering cycle 3----------------
   CompressorIn_bh121_121_189 <= heap_bh121_w79_4_d2 & heap_bh121_w79_3_d2 & heap_bh121_w79_5;
   CompressorIn_bh121_121_190 <= heap_bh121_w80_0_d2 & heap_bh121_w80_3_d2;
      Compressor_bh121_121: Compressor_23_3
      port map ( R => CompressorOut_bh121_121_121,
                 X0 => CompressorIn_bh121_121_189,
                 X1 => CompressorIn_bh121_121_190);
   heap_bh121_w79_6 <= CompressorOut_bh121_121_121(0); -- cycle= 3 cp= 1.06144e-09
   heap_bh121_w80_4 <= CompressorOut_bh121_121_121(1); -- cycle= 3 cp= 1.06144e-09
   heap_bh121_w81_5 <= CompressorOut_bh121_121_121(2); -- cycle= 3 cp= 1.06144e-09

   ----------------Synchro barrier, entering cycle 3----------------
   ----------------Synchro barrier, entering cycle 4----------------
   CompressorIn_bh121_122_191 <= heap_bh121_w81_4_d3 & heap_bh121_w81_3_d3 & heap_bh121_w81_5_d1;
   CompressorIn_bh121_122_192(0) <= heap_bh121_w82_2_d3;
      Compressor_bh121_122: Compressor_13_3
      port map ( R => CompressorOut_bh121_122_122,
                 X0 => CompressorIn_bh121_122_191,
                 X1 => CompressorIn_bh121_122_192);
   heap_bh121_w81_6 <= CompressorOut_bh121_122_122(0); -- cycle= 4 cp= 5.3072e-10
   heap_bh121_w82_3 <= CompressorOut_bh121_122_122(1); -- cycle= 4 cp= 5.3072e-10
   heap_bh121_w83_4 <= CompressorOut_bh121_122_122(2); -- cycle= 4 cp= 5.3072e-10
   ----------------Synchro barrier, entering cycle 4----------------
   ----------------Synchro barrier, entering cycle 5----------------
   finalAdderIn0_bh121 <= "0" & heap_bh121_w105_0_d4 & heap_bh121_w104_0_d4 & heap_bh121_w103_0_d4 & heap_bh121_w102_0_d4 & heap_bh121_w101_0_d4 & heap_bh121_w100_0_d4 & heap_bh121_w99_0_d4 & heap_bh121_w98_0_d4 & heap_bh121_w97_0_d4 & heap_bh121_w96_0_d4 & heap_bh121_w95_0_d4 & heap_bh121_w94_0_d4 & heap_bh121_w93_0_d4 & heap_bh121_w92_0_d4 & heap_bh121_w91_0_d4 & heap_bh121_w90_0_d4 & heap_bh121_w89_0_d4 & heap_bh121_w88_2_d3 & heap_bh121_w87_3_d3 & heap_bh121_w86_2_d3 & heap_bh121_w85_3_d3 & heap_bh121_w84_2_d4 & heap_bh121_w83_3_d4 & heap_bh121_w82_3_d1 & heap_bh121_w81_6_d1 & heap_bh121_w80_4_d2 & heap_bh121_w79_6_d2 & heap_bh121_w78_4_d2 & heap_bh121_w77_6_d2 & heap_bh121_w76_4_d3 & heap_bh121_w75_6_d3 & heap_bh121_w74_4_d3 & heap_bh121_w73_6_d3 & heap_bh121_w72_3_d4 & heap_bh121_w71_8_d4 & heap_bh121_w70_6_d4 & heap_bh121_w69_8_d4 & heap_bh121_w68_6_d4 & heap_bh121_w67_8_d4 & heap_bh121_w66_6_d4 & heap_bh121_w65_8_d4 & heap_bh121_w64_6_d4 & heap_bh121_w63_8_d4 & heap_bh121_w62_6_d4 & heap_bh121_w61_8_d4 & heap_bh121_w60_6_d4 & heap_bh121_w59_9_d3 & heap_bh121_w58_9_d3 & heap_bh121_w57_10_d3 & heap_bh121_w56_9_d3 & heap_bh121_w55_9_d4 & heap_bh121_w54_10_d4 & heap_bh121_w53_6_d4 & heap_bh121_w52_10_d4 & heap_bh121_w51_6_d4 & heap_bh121_w50_10_d4 & heap_bh121_w49_6_d4 & heap_bh121_w48_10_d4 & heap_bh121_w47_6_d4 & heap_bh121_w46_10_d4 & heap_bh121_w45_6_d4 & heap_bh121_w44_10_d4 & heap_bh121_w43_6_d4 & heap_bh121_w42_10_d4 & heap_bh121_w41_6_d4 & heap_bh121_w40_10_d4 & heap_bh121_w39_6_d4 & heap_bh121_w38_10_d4 & heap_bh121_w37_6_d4 & heap_bh121_w36_10_d4 & heap_bh121_w35_6_d4 & heap_bh121_w34_10_d4 & heap_bh121_w33_6_d4 & heap_bh121_w32_10_d4 & heap_bh121_w31_6_d4 & heap_bh121_w30_10_d4 & heap_bh121_w29_6_d4 & heap_bh121_w28_10_d4 & heap_bh121_w27_6_d4 & heap_bh121_w26_10_d4 & heap_bh121_w25_6_d4 & heap_bh121_w24_10_d4 & heap_bh121_w23_6_d4 & heap_bh121_w22_10_d4 & heap_bh121_w21_6_d4 & heap_bh121_w20_10_d4 & heap_bh121_w19_6_d4 & heap_bh121_w18_10_d4 & heap_bh121_w17_6_d4 & heap_bh121_w16_9_d4 & heap_bh121_w15_5_d4 & heap_bh121_w14_9_d4 & heap_bh121_w13_6_d4 & heap_bh121_w12_8_d4 & heap_bh121_w11_6_d4 & heap_bh121_w10_8_d4 & heap_bh121_w9_6_d4 & heap_bh121_w8_8_d4 & heap_bh121_w7_6_d4 & heap_bh121_w6_8_d4 & heap_bh121_w5_6_d4 & heap_bh121_w4_8_d4 & heap_bh121_w3_6_d4 & heap_bh121_w2_7_d4 & heap_bh121_w1_5_d4;
   finalAdderIn1_bh121 <= "0" & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh121_w89_1_d3 & '0' & '0' & '0' & '0' & '0' & heap_bh121_w83_4_d1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh121_w72_4_d4 & heap_bh121_w71_7_d4 & '0' & heap_bh121_w69_7_d4 & '0' & heap_bh121_w67_7_d4 & '0' & heap_bh121_w65_7_d4 & '0' & heap_bh121_w63_7_d4 & '0' & heap_bh121_w61_7_d4 & heap_bh121_w60_7_d3 & '0' & '0' & '0' & '0' & heap_bh121_w55_8_d4 & heap_bh121_w54_9_d4 & heap_bh121_w53_9_d4 & heap_bh121_w52_9_d4 & heap_bh121_w51_9_d4 & heap_bh121_w50_9_d4 & heap_bh121_w49_9_d4 & heap_bh121_w48_9_d4 & heap_bh121_w47_9_d4 & heap_bh121_w46_9_d4 & heap_bh121_w45_9_d4 & heap_bh121_w44_9_d4 & heap_bh121_w43_9_d4 & heap_bh121_w42_9_d4 & heap_bh121_w41_9_d4 & heap_bh121_w40_9_d4 & heap_bh121_w39_9_d4 & heap_bh121_w38_9_d4 & heap_bh121_w37_9_d4 & heap_bh121_w36_9_d4 & heap_bh121_w35_9_d4 & heap_bh121_w34_9_d4 & heap_bh121_w33_9_d4 & heap_bh121_w32_9_d4 & heap_bh121_w31_9_d4 & heap_bh121_w30_9_d4 & heap_bh121_w29_9_d4 & heap_bh121_w28_9_d4 & heap_bh121_w27_9_d4 & heap_bh121_w26_9_d4 & heap_bh121_w25_9_d4 & heap_bh121_w24_9_d4 & heap_bh121_w23_9_d4 & heap_bh121_w22_9_d4 & heap_bh121_w21_9_d4 & heap_bh121_w20_9_d4 & heap_bh121_w19_9_d4 & heap_bh121_w18_9_d4 & heap_bh121_w17_9_d4 & heap_bh121_w16_8_d4 & heap_bh121_w15_8_d4 & heap_bh121_w14_8_d4 & '0' & heap_bh121_w12_7_d4 & '0' & heap_bh121_w10_7_d4 & '0' & heap_bh121_w8_7_d4 & '0' & heap_bh121_w6_7_d4 & '0' & heap_bh121_w4_7_d4 & '0' & '0' & heap_bh121_w1_4_d4;
   finalAdderCin_bh121 <= '0';
      Adder_final121_0: IntAdder_106_f500_uid253  -- pipelineDepth=5 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh121,
                 R => finalAdderOut_bh121,
                 X => finalAdderIn0_bh121,
                 Y => finalAdderIn1_bh121);
   ----------------Synchro barrier, entering cycle 10----------------
   -- concatenate all the compressed chunks
   CompressionResult121 <= finalAdderOut_bh121 & tempR_bh121_0_d9;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult121(105 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_65_f500_uid261
--                     (IntAdderClassical_65_f500_uid263)
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

entity IntAdder_65_f500_uid261 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(64 downto 0);
          Y : in  std_logic_vector(64 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(64 downto 0)   );
end entity;

architecture arch of IntAdder_65_f500_uid261 is
signal x0 :  std_logic_vector(19 downto 0);
signal y0 :  std_logic_vector(19 downto 0);
signal x1, x1_d1 :  std_logic_vector(19 downto 0);
signal y1, y1_d1 :  std_logic_vector(19 downto 0);
signal x2, x2_d1, x2_d2 :  std_logic_vector(19 downto 0);
signal y2, y2_d1, y2_d2 :  std_logic_vector(19 downto 0);
signal x3, x3_d1, x3_d2, x3_d3 :  std_logic_vector(4 downto 0);
signal y3, y3_d1, y3_d2, y3_d3 :  std_logic_vector(4 downto 0);
signal sum0, sum0_d1, sum0_d2, sum0_d3 :  std_logic_vector(20 downto 0);
signal sum1, sum1_d1, sum1_d2 :  std_logic_vector(20 downto 0);
signal sum2, sum2_d1 :  std_logic_vector(20 downto 0);
signal sum3 :  std_logic_vector(5 downto 0);
signal X_d1 :  std_logic_vector(64 downto 0);
signal Y_d1 :  std_logic_vector(64 downto 0);
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
   x3 <= X_d1(64 downto 60);
   y3 <= Y_d1(64 downto 60);
   sum0 <= ( "0" & x0) + ( "0" & y0)  + Cin_d1;
   ----------------Synchro barrier, entering cycle 2----------------
   sum1 <= ( "0" & x1_d1) + ( "0" & y1_d1)  + sum0_d1(20);
   ----------------Synchro barrier, entering cycle 3----------------
   sum2 <= ( "0" & x2_d2) + ( "0" & y2_d2)  + sum1_d1(20);
   ----------------Synchro barrier, entering cycle 4----------------
   sum3 <= ( "0" & x3_d3) + ( "0" & y3_d3)  + sum2_d1(20);
   R <= sum3(4 downto 0) & sum2_d1(19 downto 0) & sum1_d2(19 downto 0) & sum0_d3(19 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                     wrapped_fp_mult_expr_FU_64_64_500
--                  (FPMultiplier_11_52_11_52_11_52_uid117)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2011
--------------------------------------------------------------------------------
-- Pipeline depth: 15 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity wrapped_fp_mult_expr_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          Y : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of wrapped_fp_mult_expr_FU_64_64_500 is
   component IntAdder_65_f500_uid261 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(64 downto 0);
             Y : in  std_logic_vector(64 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(64 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_53_53_106_unsigned_uid119 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(52 downto 0);
             Y : in  std_logic_vector(52 downto 0);
             R : out  std_logic_vector(105 downto 0)   );
   end component;

signal sign, sign_d1, sign_d2, sign_d3, sign_d4, sign_d5, sign_d6, sign_d7, sign_d8, sign_d9, sign_d10, sign_d11, sign_d12, sign_d13, sign_d14, sign_d15 : std_logic;
signal expX :  std_logic_vector(10 downto 0);
signal expY :  std_logic_vector(10 downto 0);
signal expSumPreSub, expSumPreSub_d1 :  std_logic_vector(12 downto 0);
signal bias, bias_d1 :  std_logic_vector(12 downto 0);
signal expSum, expSum_d1, expSum_d2, expSum_d3, expSum_d4, expSum_d5, expSum_d6, expSum_d7, expSum_d8, expSum_d9 :  std_logic_vector(12 downto 0);
signal sigX :  std_logic_vector(52 downto 0);
signal sigY :  std_logic_vector(52 downto 0);
signal sigProd :  std_logic_vector(105 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1, exc_d2, exc_d3, exc_d4, exc_d5, exc_d6, exc_d7, exc_d8, exc_d9, exc_d10, exc_d11, exc_d12, exc_d13, exc_d14, exc_d15 :  std_logic_vector(1 downto 0);
signal norm : std_logic;
signal expPostNorm :  std_logic_vector(12 downto 0);
signal sigProdExt, sigProdExt_d1 :  std_logic_vector(105 downto 0);
signal expSig, expSig_d1 :  std_logic_vector(64 downto 0);
signal sticky, sticky_d1 : std_logic;
signal guard : std_logic;
signal round : std_logic;
signal expSigPostRound :  std_logic_vector(64 downto 0);
signal excPostNorm :  std_logic_vector(1 downto 0);
signal finalExc :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sign_d1 <=  sign;
            sign_d2 <=  sign_d1;
            sign_d3 <=  sign_d2;
            sign_d4 <=  sign_d3;
            sign_d5 <=  sign_d4;
            sign_d6 <=  sign_d5;
            sign_d7 <=  sign_d6;
            sign_d8 <=  sign_d7;
            sign_d9 <=  sign_d8;
            sign_d10 <=  sign_d9;
            sign_d11 <=  sign_d10;
            sign_d12 <=  sign_d11;
            sign_d13 <=  sign_d12;
            sign_d14 <=  sign_d13;
            sign_d15 <=  sign_d14;
            expSumPreSub_d1 <=  expSumPreSub;
            bias_d1 <=  bias;
            expSum_d1 <=  expSum;
            expSum_d2 <=  expSum_d1;
            expSum_d3 <=  expSum_d2;
            expSum_d4 <=  expSum_d3;
            expSum_d5 <=  expSum_d4;
            expSum_d6 <=  expSum_d5;
            expSum_d7 <=  expSum_d6;
            expSum_d8 <=  expSum_d7;
            expSum_d9 <=  expSum_d8;
            exc_d1 <=  exc;
            exc_d2 <=  exc_d1;
            exc_d3 <=  exc_d2;
            exc_d4 <=  exc_d3;
            exc_d5 <=  exc_d4;
            exc_d6 <=  exc_d5;
            exc_d7 <=  exc_d6;
            exc_d8 <=  exc_d7;
            exc_d9 <=  exc_d8;
            exc_d10 <=  exc_d9;
            exc_d11 <=  exc_d10;
            exc_d12 <=  exc_d11;
            exc_d13 <=  exc_d12;
            exc_d14 <=  exc_d13;
            exc_d15 <=  exc_d14;
            sigProdExt_d1 <=  sigProdExt;
            expSig_d1 <=  expSig;
            sticky_d1 <=  sticky;
         end if;
      end process;
   sign <= X(63) xor Y(63);
   expX <= X(62 downto 52);
   expY <= Y(62 downto 52);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(1023,13);
   ----------------Synchro barrier, entering cycle 1----------------
   expSum <= expSumPreSub_d1 - bias_d1;
   ----------------Synchro barrier, entering cycle 0----------------
   sigX <= "1" & X(51 downto 0);
   sigY <= "1" & Y(51 downto 0);
   SignificandMultiplication: IntMultiplier_UsingDSP_53_53_106_unsigned_uid119  -- pipelineDepth=10 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => sigProd,
                 X => sigX,
                 Y => sigY);
   ----------------Synchro barrier, entering cycle 10----------------
   ----------------Synchro barrier, entering cycle 0----------------
   excSel <= X(65 downto 64) & Y(65 downto 64);
   with excSel select 
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   ----------------Synchro barrier, entering cycle 10----------------
   norm <= sigProd(105);
   -- exponent update
   expPostNorm <= expSum_d9 + ("000000000000" & norm);
   ----------------Synchro barrier, entering cycle 10----------------
   -- significand normalization shift
   sigProdExt <= sigProd(104 downto 0) & "0" when norm='1' else
                         sigProd(103 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(105 downto 54);
   sticky <= sigProdExt(53);
   ----------------Synchro barrier, entering cycle 11----------------
   guard <= '0' when sigProdExt_d1(52 downto 0)="00000000000000000000000000000000000000000000000000000" else '1';
   round <= sticky_d1 and ( (guard and not(sigProdExt_d1(54))) or (sigProdExt_d1(54) ))  ;
      RoundingAdder: IntAdder_65_f500_uid261  -- pipelineDepth=4 maxInDelay=1.57344e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => round,
                 R => expSigPostRound,
                 X => expSig_d1,
                 Y => "00000000000000000000000000000000000000000000000000000000000000000");
   ----------------Synchro barrier, entering cycle 15----------------
   with expSigPostRound(64 downto 63) select
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d15 select 
   finalExc <= exc_d15 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d15 & expSigPostRound(62 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                     in_wrap_fp_mult_expr_FU_64_64_500
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

entity in_wrap_fp_mult_expr_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of in_wrap_fp_mult_expr_FU_64_64_500 is
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
--                     out_wrap_fp_mult_expr_FU_64_64_500
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

entity out_wrap_fp_mult_expr_FU_64_64_500 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of out_wrap_fp_mult_expr_FU_64_64_500 is
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
--                              fp_mult_expr_FU_64_64_500
-- Operator automatically generated by FloPoCo framework version svn-trunk
-- assemblying operators generated by the Infinite Virtual Library FloPoCoLib
-- Send any bug to: BUG_REPORT_ADDRESS
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fp_mult_expr_FU_64_64_500 is
   generic(BITSIZE_X: integer := 64; BITSIZE_Y: integer := 64; BITSIZE_R: integer := 64);
   port (
      X : in std_logic_vector(BITSIZE_X-1 downto 0);
      Y : in std_logic_vector(BITSIZE_Y-1 downto 0);
      clock : in std_logic;
      reset : in std_logic;
      R : out std_logic_vector(BITSIZE_R-1 downto 0)
      
   );
end entity;

architecture arch of fp_mult_expr_FU_64_64_500 is
   component wrapped_fp_mult_expr_FU_64_64_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         X : in std_logic_vector(65 downto 0);
         Y : in std_logic_vector(65 downto 0);
         R : out std_logic_vector(65 downto 0)
         
      );
   end component;
   component in_wrap_fp_mult_expr_FU_64_64_500
      port (
         clk : in std_logic;
         rst : in std_logic;
         X : in std_logic_vector(63 downto 0);
         R : out std_logic_vector(65 downto 0)
         
      );
   end component;
   component out_wrap_fp_mult_expr_FU_64_64_500
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
      fu : wrapped_fp_mult_expr_FU_64_64_500 port map (X => wireIn1, Y => wireIn2, R => wireOut1, clk=> clock, rst=> reset);
      in1 : in_wrap_fp_mult_expr_FU_64_64_500 port map (X=>X, R=>wireIn1, clk=> clock, rst=> reset);
      in2 : in_wrap_fp_mult_expr_FU_64_64_500 port map (X=>Y, R=>wireIn2, clk=> clock, rst=> reset);
      out1 : out_wrap_fp_mult_expr_FU_64_64_500 port map (X=>wireOut1, R=>R, clk=> clock, rst=> reset);
end architecture;

