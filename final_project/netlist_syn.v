
module clock_divider ( clock, reset, enable_all, enable_clk1, enable_clk2, 
        enable_clk3, clk1, clk2, clk3 );
  input clock, reset, enable_all, enable_clk1, enable_clk2, enable_clk3;
  output clk1, clk2, clk3;
  wire   clk1_internal, clk2_internal, clk3_internal, N18, N19, N20, N30, N33,
         N47, N48, N49, N50, N51, N52, N53, N55, N66, N67, N68, N69, N70, N71,
         N80, N81, N82, N83, n2, n3, n4, n5, n6, n7, n8, n9, n13, n14, n15,
         n16, n17, n18, n19, n20;
  wire   [3:0] clk1_counter;
  wire   [2:0] clk2_counter;
  wire   [1:0] clk3_counter;
  tri   clk1;
  tri   clk2;
  tri   clk3;

  OR2X1 U10 ( .O(N82), .I1(N71), .I2(N80) );
  OR2X1 U15 ( .O(N68), .I1(N53), .I2(N66) );
  OR2X1 U21 ( .O(N49), .I1(N30), .I2(N47) );
  OR2X1 U24 ( .O(n3), .I1(clk1_counter[3]), .I2(clk1_counter[2]) );
  TIE1X1 U32 ( .O(n13) );
  DFFX1 \clk1_counter_reg[3]  ( .Q(clk1_counter[3]), .D(N52), .CK(clock) );
  DFFX1 \clk1_counter_reg[0]  ( .Q(clk1_counter[0]), .QB(N30), .D(N49), .CK(
        clock) );
  DFFX1 \clk1_counter_reg[1]  ( .Q(clk1_counter[1]), .D(N50), .CK(clock) );
  DFFX1 \clk1_counter_reg[2]  ( .Q(clk1_counter[2]), .D(N51), .CK(clock) );
  DFFX1 \clk2_counter_reg[2]  ( .Q(clk2_counter[2]), .D(N70), .CK(clock) );
  DFFX1 \clk2_counter_reg[0]  ( .Q(clk2_counter[0]), .QB(N53), .D(N68), .CK(
        clock) );
  DFFX1 \clk2_counter_reg[1]  ( .Q(clk2_counter[1]), .D(N69), .CK(clock) );
  DFFX1 \clk3_counter_reg[0]  ( .Q(clk3_counter[0]), .QB(N71), .D(N82), .CK(
        clock) );
  DFFX1 \clk3_counter_reg[1]  ( .Q(clk3_counter[1]), .D(N83), .CK(clock) );
  DFFX1 clk1_tri_enable_reg ( .QB(n7), .D(N18), .CK(clock) );
  DFFX1 clk2_tri_enable_reg ( .QB(n9), .D(N19), .CK(clock) );
  DFFX1 clk3_tri_enable_reg ( .QB(n5), .D(N20), .CK(clock) );
  DFFX1 clk1_reg ( .QB(n6), .D(clk1_internal), .CK(clock) );
  DFFX1 clk2_reg ( .QB(n8), .D(clk2_internal), .CK(clock) );
  DFFX1 clk3_reg ( .QB(n4), .D(clk3_internal), .CK(clock) );
  QDFCLRBX1 clk1_internal_reg ( .Q(clk1_internal), .D(N48), .CK(clock), .RB(
        n13), .LD(N47) );
  QDFCLRBX1 clk2_internal_reg ( .Q(clk2_internal), .D(N67), .CK(clock), .RB(
        n13), .LD(N66) );
  QDFCLRBX1 clk3_internal_reg ( .Q(clk3_internal), .D(N81), .CK(clock), .RB(
        n13), .LD(N80) );
  INVTX1 clk2_tri ( .O(clk2), .I(n8), .E(n9) );
  INVTX1 clk1_tri ( .O(clk1), .I(n6), .E(n7) );
  INVTX1 clk3_tri ( .O(clk3), .I(n4), .E(n5) );
  OAI13X1 U33 ( .O(N47), .A1(n2), .B1(n3), .B2(clk1_counter[1]), .B3(
        clk1_counter[0]) );
  OAI13X1 U34 ( .O(N66), .A1(n2), .B1(clk2_counter[0]), .B2(clk2_counter[2]), 
        .B3(clk2_counter[1]) );
  OAI12X1 U35 ( .O(N80), .A1(n2), .B1(clk3_counter[1]), .B2(clk3_counter[0])
         );
  NR2X1 U36 ( .O(N50), .I1(n14), .I2(N47) );
  XOR2X1 U37 ( .O(n14), .I1(clk1_counter[1]), .I2(N30) );
  NR2X1 U38 ( .O(N51), .I1(n15), .I2(N47) );
  XOR2X1 U39 ( .O(n15), .I1(clk1_counter[2]), .I2(n19) );
  AN2B1XLP U40 ( .O(N52), .I1(N33), .B1(N47) );
  XOR2X1 U41 ( .O(N33), .I1(clk1_counter[3]), .I2(n20) );
  AN2B1XLP U42 ( .O(n20), .I1(clk1_counter[2]), .B1(n19) );
  ND2X1 U43 ( .O(n19), .I1(clk1_counter[1]), .I2(clk1_counter[0]) );
  NR2X1 U44 ( .O(N69), .I1(n16), .I2(N66) );
  XOR2X1 U45 ( .O(n16), .I1(clk2_counter[1]), .I2(N53) );
  AN2B1XLP U46 ( .O(N70), .I1(N55), .B1(N66) );
  XOR2X1 U47 ( .O(N55), .I1(clk2_counter[2]), .I2(n18) );
  AN2X1 U48 ( .O(n18), .I1(clk2_counter[1]), .I2(clk2_counter[0]) );
  OAI12X1 U49 ( .O(N20), .A1(n2), .B1(enable_clk3), .B2(enable_all) );
  OAI12X1 U50 ( .O(N18), .A1(n2), .B1(enable_clk1), .B2(enable_all) );
  OAI12X1 U51 ( .O(N19), .A1(n2), .B1(enable_clk2), .B2(enable_all) );
  NR2X1 U52 ( .O(N83), .I1(n17), .I2(N80) );
  XNR2X1 U53 ( .O(n17), .I1(clk3_counter[1]), .I2(clk3_counter[0]) );
  ND2X1 U54 ( .O(N48), .I1(clk1_internal), .I2(n2) );
  ND2X1 U55 ( .O(N67), .I1(clk2_internal), .I2(n2) );
  ND2X1 U56 ( .O(N81), .I1(clk3_internal), .I2(n2) );
  INVX1 U57 ( .O(n2), .I(reset) );
endmodule

