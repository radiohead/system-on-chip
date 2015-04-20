-- VHDL pattern output written by  TetraMAX (TM)  Y-2006.06-i060525_175841 
-- Date: Mon Apr 20 10:39:09 2015
-- Module tested: shift_adder

--     Uncollapsed Stuck Fault Summary Report
-- -----------------------------------------------
-- fault class                     code   #faults
-- ------------------------------  ----  ---------
-- Detected                         DT        227
-- Possibly detected                PT          2
-- Undetectable                     UD          1
-- ATPG untestable                  AU          0
-- Not detected                     ND          0
-- -----------------------------------------------
-- total faults                               230
-- test coverage                            99.56%
-- -----------------------------------------------
-- 
--            Pattern Summary Report
-- -----------------------------------------------
-- #internal patterns                           4
--     #full_sequential patterns                4
-- -----------------------------------------------
-- 
-- rule  severity  #fails  description
-- ----  --------  ------  ---------------------------------
-- N2    warning       91  unsupported construct
-- N21   warning        1  unsupported UDP entry
-- B7    warning        1  undriven module output pin
-- B8    warning        1  unconnected module input pin
-- C2    warning        8  unstable nonscan DFF when clocks off
-- 
-- There are no clocks
-- There are no constraint ports
-- There are no equivalent pins
-- There are no net connections

LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.Std_Logic_TextIO.all;
USE Std.TextIO.all;
USE Std.Standard.all;

ENTITY shift_adder_test IS
END shift_adder_test;

ARCHITECTURE testbench OF shift_adder_test IS

   constant NINPUTS: INTEGER := 18;
   constant NOUTPUTS: INTEGER := 9;
   SUBTYPE InVector IS std_logic_vector (0 TO NINPUTS-1);
   SUBTYPE OutVector IS std_logic_vector (0 TO NOUTPUTS-1);
   TYPE POString IS ARRAY (0 TO NOUTPUTS-1) OF LINE;
   SIGNAL PO, ALLPOS, XPCT, MASK: OutVector;
   SIGNAL PI, ALLPIS: InVector;

   -- *** Signal Declarations ***
   SIGNAL clock, reset: std_logic;
   SIGNAL lefthand: std_logic_vector(7 DOWNTO 0);
   SIGNAL righthand: std_logic_vector(7 DOWNTO 0);
   SIGNAL result: std_logic_vector(8 DOWNTO 0);

   -- *** Component Declaration ***
   COMPONENT shift_adder PORT (
      clock: IN std_logic;
      reset: IN std_logic;
      lefthand: IN std_logic_vector(7 DOWNTO 0);
      righthand: IN std_logic_vector(7 DOWNTO 0);
      result: OUT std_logic_vector(8 DOWNTO 0));
   END COMPONENT;

   -- *** Procedures ***


   PROCEDURE measurePO (
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   VARIABLE firstfail: BOOLEAN;
   VARIABLE L : Line;
   BEGIN
      firstfail := TRUE;
      FOR bit IN 0 TO NOUTPUTS-1 LOOP
         IF (MASK(bit) = '1') THEN
            IF(XPCT(bit) /= PO(bit)) THEN
               IF (firstfail = TRUE) THEN
                  Std.TextIO.Write(L, String'("T = "));
                  Std.TextIO.Write(L, now);
                  Std.TextIO.Write(L, String'(" ----- ERROR(S) during pattern "));
                  Std.TextIO.Write(L, pattern);
                  Std.TextIO.Write(L, String'(" -----"));
                  Std.TextIO.WriteLine(Output, L);
                  firstfail := FALSE;
               END IF;
               Std.TextIO.Write(L, String'("T = "));
               Std.TextIO.Write(L, now);
               Std.TextIO.Write(L, String'(" : "));
               Std.TextIO.Write(L, String'(POnames(bit).all));
               Std.TextIO.Write(L, String'(" (output "));
               Std.TextIO.Write(L, bit);
               Std.TextIO.Write(L, String'("), expected "));
               IEEE.Std_Logic_TextIO.Write(L, XPCT(bit));
               Std.TextIO.Write(L, String'(", got "));
               IEEE.Std_Logic_TextIO.Write(L, PO(bit));
               Std.TextIO.WriteLine(Output, L);
               nofails := nofails + 1;
            END IF;
         END IF;
      END LOOP;
      DEALLOCATE(L);
   END measurePO;


   PROCEDURE forcePI_default_WFT (
      SIGNAL ALLPIS: IN InVector;
      SIGNAL PI: OUT InVector ) IS
   BEGIN
      PI <= ALLPIS;
   END forcePI_default_WFT;

   PROCEDURE measurePO_default_WFT (
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      ALLPOS <= PO;
      wait for 0 ns; measurePO(ALLPOS, XPCT, MASK, nofails, pattern, POnames);
   END measurePO_default_WFT;


   PROCEDURE capture (
      SIGNAL ALLPIS : IN InVector;
      SIGNAL PI : OUT InVector;
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      forcePI_default_WFT(ALLPIS, PI);
      wait for 140 ns; measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
      wait for 60 ns;
   END capture;
   BEGIN -------------------------------- testbench body --------------------------------
   -- *** Map inputs and bidis ***
   clock <= PI(0);
   reset <= PI(1);
   lefthand <= PI(2 TO 9);
   righthand <= PI(10 TO 17);

   -- *** Map outputs and bidis ***
   PO(0 TO 8) <= result;

   -- *** Instantiation of Component ***
   dut: shift_adder port map (
      clock => clock,
      reset => reset,
      lefthand => lefthand,
      righthand => righthand,
      result => result);

   -- *** Main Process ***
   PROCESS
   variable nofails, pattern: INTEGER;
   variable POnames: POString;
   variable L : Line;
   BEGIN
      POnames(0) := new STRING'("result[8]");
      POnames(1) := new STRING'("result[7]");
      POnames(2) := new STRING'("result[6]");
      POnames(3) := new STRING'("result[5]");
      POnames(4) := new STRING'("result[4]");
      POnames(5) := new STRING'("result[3]");
      POnames(6) := new STRING'("result[2]");
      POnames(7) := new STRING'("result[1]");
      POnames(8) := new STRING'("result[0]");
      nofails := 0; pattern := -1;
      -- *** No test setup procedure ***

      -- *** Non-scan test ***
pattern := 0; -- 0
wait for 0 ns;
PI <= "000101010110110010";
wait for 100 ns; -- 100
XPCT <= "0XXXXXXXX";
MASK <= "100000000";
wait for 40 ns; -- 140
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 200
wait for 0 ns;
PI <= "111011110101100111";
wait for 100 ns; -- 300
XPCT <= "000000111";
MASK <= "111111111";
wait for 40 ns; -- 340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 400
wait for 0 ns;
PI <= "000010100111111011";
wait for 100 ns; -- 500
XPCT <= "000000111";
MASK <= "111111111";
wait for 40 ns; -- 540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 600
wait for 0 ns;
PI <= "101110011100110101";
wait for 100 ns; -- 700
XPCT <= "000100100";
MASK <= "111111111";
wait for 40 ns; -- 740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 800
wait for 0 ns;
PI <= "000101010101011100";
wait for 100 ns; -- 900
XPCT <= "000100100";
MASK <= "111111111";
wait for 40 ns; -- 940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1000
wait for 0 ns;
PI <= "110010010100110010";
wait for 100 ns; -- 1100
XPCT <= "010110001";
MASK <= "111111111";
wait for 40 ns; -- 1140
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1200

pattern := 1; -- 1200
wait for 0 ns;
PI <= "001000011010100110";
wait for 100 ns; -- 1300
XPCT <= "010110001";
MASK <= "111111111";
wait for 40 ns; -- 1340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1400
wait for 0 ns;
PI <= "100000001010101101";
wait for 100 ns; -- 1500
XPCT <= "000101100";
MASK <= "111111111";
wait for 40 ns; -- 1540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1600
wait for 0 ns;
PI <= "011010101101011010";
wait for 100 ns; -- 1700
XPCT <= "000101100";
MASK <= "111111111";
wait for 40 ns; -- 1740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1800
wait for 0 ns;
PI <= "101010101010010010";
wait for 100 ns; -- 1900
XPCT <= "000000000";
MASK <= "111111111";
wait for 40 ns; -- 1940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2000
wait for 0 ns;
PI <= "010100011101110101";
wait for 100 ns; -- 2100
XPCT <= "000000000";
MASK <= "111111111";
wait for 40 ns; -- 2140
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2200
wait for 0 ns;
PI <= "101010010011100000";
wait for 100 ns; -- 2300
XPCT <= "000000000";
MASK <= "111111111";
wait for 40 ns; -- 2340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2400

pattern := 2; -- 2400
wait for 0 ns;
PI <= "010101110111000010";
wait for 100 ns; -- 2500
XPCT <= "000000000";
MASK <= "111111111";
wait for 40 ns; -- 2540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2600
wait for 0 ns;
PI <= "110100110100000000";
wait for 100 ns; -- 2700
XPCT <= "000000000";
MASK <= "111111111";
wait for 40 ns; -- 2740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2800

pattern := 3; -- 2800
wait for 0 ns;
PI <= "001011100010110001";
wait for 100 ns; -- 2900
XPCT <= "000000000";
MASK <= "111111111";
wait for 40 ns; -- 2940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3000
wait for 0 ns;
PI <= "110101101010101000";
wait for 100 ns; -- 3100
XPCT <= "001101001";
MASK <= "111111111";
wait for 40 ns; -- 3140
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3200
wait for 0 ns;
PI <= "011010011010111110";
wait for 100 ns; -- 3300
XPCT <= "001101001";
MASK <= "111111111";
wait for 40 ns; -- 3340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3400
wait for 0 ns;
PI <= "100100100110011000";
wait for 100 ns; -- 3500
XPCT <= "000000000";
MASK <= "111111111";
wait for 40 ns; -- 3540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3600


      Std.TextIO.Write(L, String'("Simulation of "));
      Std.TextIO.Write(L, pattern + 1);
      Std.TextIO.Write(L, String'(" patterns completed with "));
      Std.TextIO.Write(L, nofails);
      Std.TextIO.Write(L, String'(" errors"));
      Std.TextIO.WriteLine(Output, L);
      WAIT;
      DEALLOCATE(L);
      DEALLOCATE(POnames(0));
      DEALLOCATE(POnames(1));
      DEALLOCATE(POnames(2));
      DEALLOCATE(POnames(3));
      DEALLOCATE(POnames(4));
      DEALLOCATE(POnames(5));
      DEALLOCATE(POnames(6));
      DEALLOCATE(POnames(7));
      DEALLOCATE(POnames(8));
   END PROCESS;
END testbench;

CONFIGURATION shift_adder_ctl OF shift_adder_test IS
   FOR testbench
      FOR dut: shift_adder USE ENTITY WORK.shift_adder;
      END FOR;
   END FOR;
END shift_adder_ctl;
