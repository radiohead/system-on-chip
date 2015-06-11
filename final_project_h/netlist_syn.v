
module multiplier_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , \carry[7] , \carry[6] , \carry[5] , \carry[4] , \carry[3] ,
         \carry[2] ;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  XOR2X1 U1 ( .O(SUM[7]), .I1(A[7]), .I2(\carry[7] ) );
  AN2X1 U2 ( .O(\carry[2] ), .I1(A[1]), .I2(B[1]) );
  XOR2X1 U3 ( .O(SUM[1]), .I1(B[1]), .I2(A[1]) );
  FA1X1 U1_2 ( .S(SUM[2]), .CO(\carry[3] ), .A(A[2]), .B(B[2]), .CI(\carry[2] ) );
  FA1X1 U1_3 ( .S(SUM[3]), .CO(\carry[4] ), .A(A[3]), .B(B[3]), .CI(\carry[3] ) );
  FA1X1 U1_4 ( .S(SUM[4]), .CO(\carry[5] ), .A(A[4]), .B(B[4]), .CI(\carry[4] ) );
  FA1X1 U1_5 ( .S(SUM[5]), .CO(\carry[6] ), .A(A[5]), .B(B[5]), .CI(\carry[5] ) );
  FA1X1 U1_6 ( .S(SUM[6]), .CO(\carry[7] ), .A(A[6]), .B(B[6]), .CI(\carry[6] ) );
endmodule


module multiplier ( x, y, clock, reset, enable, z );
  input [3:0] x;
  input [3:0] y;
  output [7:0] z;
  input clock, reset, enable;
  wire   N3, \pp0[3] , \pp0[2] , N4, N5, N6, N7, \pp1[4] , \pp1[3] , N8, N9,
         N10, N11, \pp2[5] , \pp2[4] , \pp2[3] , \pp2[2] , N12, N13, N14, N15,
         \pp3[6] , \pp3[5] , \pp3[4] , \pp3[3] , N16, N17, N18, N35, N36, N37,
         N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         \add_2_root_add_0_root_add_65_3/carry[6] ,
         \add_2_root_add_0_root_add_65_3/carry[5] ,
         \add_2_root_add_0_root_add_65_3/carry[4] ,
         \add_1_root_add_0_root_add_65_3/carry[5] ,
         \add_1_root_add_0_root_add_65_3/carry[4] ,
         \add_1_root_add_0_root_add_65_3/carry[3] , N33, N32, N31, N30, N29,
         N28, N27, N26, N25, N24, N23, N22, N21, N20;

  TIE1X1 U68 ( .O(n33) );
  QDFCLRBX1 \pp1_reg[3]  ( .Q(\pp1[3] ), .D(N9), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp0_reg[2]  ( .Q(\pp0[2] ), .D(N5), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp2_reg[4]  ( .Q(\pp2[4] ), .D(N13), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp3_reg[5]  ( .Q(\pp3[5] ), .D(N17), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp1_reg[1]  ( .Q(N20), .D(N7), .CK(clock), .RB(n33), .LD(enable)
         );
  QDFCLRBX1 \pp1_reg[2]  ( .Q(N21), .D(N8), .CK(clock), .RB(n33), .LD(enable)
         );
  QDFCLRBX1 \pp1_reg[4]  ( .Q(\pp1[4] ), .D(N10), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp0_reg[0]  ( .Q(N27), .D(N3), .CK(clock), .RB(n33), .LD(enable)
         );
  QDFCLRBX1 \pp0_reg[1]  ( .Q(N28), .D(N4), .CK(clock), .RB(n33), .LD(enable)
         );
  QDFCLRBX1 \pp0_reg[3]  ( .Q(\pp0[3] ), .D(N6), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp2_reg[2]  ( .Q(\pp2[2] ), .D(N11), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp2_reg[3]  ( .Q(\pp2[3] ), .D(N12), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp2_reg[5]  ( .Q(\pp2[5] ), .D(N14), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp3_reg[3]  ( .Q(\pp3[3] ), .D(N15), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp3_reg[4]  ( .Q(\pp3[4] ), .D(N16), .CK(clock), .RB(n33), .LD(
        enable) );
  QDFCLRBX1 \pp3_reg[6]  ( .Q(\pp3[6] ), .D(N18), .CK(clock), .RB(n33), .LD(
        enable) );
  NR2X1 U69 ( .O(N10), .I1(n26), .I2(n29) );
  NR2X1 U70 ( .O(N9), .I1(n25), .I2(n26) );
  NR2X1 U71 ( .O(N8), .I1(n26), .I2(n27) );
  NR2X1 U72 ( .O(N7), .I1(n26), .I2(n28) );
  NR2X1 U73 ( .O(N17), .I1(n25), .I2(n31) );
  NR2X1 U74 ( .O(N5), .I1(n25), .I2(n30) );
  NR2X1 U75 ( .O(N13), .I1(n25), .I2(n32) );
  NR2X1 U76 ( .O(N18), .I1(n29), .I2(n31) );
  NR2X1 U77 ( .O(N16), .I1(n27), .I2(n31) );
  NR2X1 U78 ( .O(N15), .I1(n28), .I2(n31) );
  NR2X1 U79 ( .O(N6), .I1(n29), .I2(n30) );
  NR2X1 U80 ( .O(N4), .I1(n27), .I2(n30) );
  NR2X1 U81 ( .O(N3), .I1(n28), .I2(n30) );
  NR2X1 U82 ( .O(N14), .I1(n29), .I2(n32) );
  NR2X1 U83 ( .O(N12), .I1(n27), .I2(n32) );
  NR2X1 U84 ( .O(N11), .I1(n28), .I2(n32) );
  QDFFRBX1 \z_reg[7]  ( .Q(z[7]), .D(N50), .CK(clock), .RB(n24) );
  QDFFRBX1 \z_reg[6]  ( .Q(z[6]), .D(N49), .CK(clock), .RB(n24) );
  QDFFRBX1 \z_reg[5]  ( .Q(z[5]), .D(N48), .CK(clock), .RB(n24) );
  QDFFRBX1 \z_reg[4]  ( .Q(z[4]), .D(N47), .CK(clock), .RB(n24) );
  QDFFRBX1 \z_reg[3]  ( .Q(z[3]), .D(N46), .CK(clock), .RB(n24) );
  QDFFRBX1 \z_reg[2]  ( .Q(z[2]), .D(N45), .CK(clock), .RB(n24) );
  QDFFRBX1 \z_reg[1]  ( .Q(z[1]), .D(N44), .CK(clock), .RB(n24) );
  QDFFRBX1 \z_reg[0]  ( .Q(z[0]), .D(N43), .CK(clock), .RB(n24) );
  INVX1 U85 ( .O(n25), .I(x[2]) );
  INVX1 U86 ( .O(n26), .I(y[1]) );
  INVX1 U87 ( .O(n29), .I(x[3]) );
  INVX1 U88 ( .O(n27), .I(x[1]) );
  INVX1 U89 ( .O(n28), .I(x[0]) );
  INVX1 U90 ( .O(n31), .I(y[3]) );
  INVX1 U91 ( .O(n30), .I(y[0]) );
  INVX1 U92 ( .O(n32), .I(y[2]) );
  AN2X1 U93 ( .O(N44), .I1(N36), .I2(enable) );
  AN2X1 U94 ( .O(N50), .I1(enable), .I2(N42) );
  AN2X1 U95 ( .O(N49), .I1(N41), .I2(enable) );
  AN2X1 U96 ( .O(N48), .I1(N40), .I2(enable) );
  AN2X1 U97 ( .O(N47), .I1(N39), .I2(enable) );
  AN2X1 U98 ( .O(N46), .I1(N38), .I2(enable) );
  AN2X1 U99 ( .O(N45), .I1(N37), .I2(enable) );
  AN2X1 U100 ( .O(N43), .I1(N35), .I2(enable) );
  INVX1 U101 ( .O(n24), .I(reset) );
  TIE0X1 U102 ( .O(n34) );
  AN2X1 U103 ( .O(N26), .I1(\add_2_root_add_0_root_add_65_3/carry[6] ), .I2(
        \pp3[6] ) );
  XOR2X1 U104 ( .O(N25), .I1(\pp3[6] ), .I2(
        \add_2_root_add_0_root_add_65_3/carry[6] ) );
  AN2X1 U105 ( .O(N33), .I1(\add_1_root_add_0_root_add_65_3/carry[5] ), .I2(
        \pp2[5] ) );
  XOR2X1 U106 ( .O(N32), .I1(\pp2[5] ), .I2(
        \add_1_root_add_0_root_add_65_3/carry[5] ) );
  AN2X1 U107 ( .O(\add_2_root_add_0_root_add_65_3/carry[6] ), .I1(
        \add_2_root_add_0_root_add_65_3/carry[5] ), .I2(\pp3[5] ) );
  XOR2X1 U108 ( .O(N24), .I1(\pp3[5] ), .I2(
        \add_2_root_add_0_root_add_65_3/carry[5] ) );
  AN2X1 U109 ( .O(\add_1_root_add_0_root_add_65_3/carry[5] ), .I1(
        \add_1_root_add_0_root_add_65_3/carry[4] ), .I2(\pp2[4] ) );
  XOR2X1 U110 ( .O(N31), .I1(\pp2[4] ), .I2(
        \add_1_root_add_0_root_add_65_3/carry[4] ) );
  AN2X1 U111 ( .O(\add_2_root_add_0_root_add_65_3/carry[4] ), .I1(\pp3[3] ), 
        .I2(\pp1[3] ) );
  XOR2X1 U112 ( .O(N22), .I1(\pp1[3] ), .I2(\pp3[3] ) );
  AN2X1 U113 ( .O(\add_1_root_add_0_root_add_65_3/carry[3] ), .I1(\pp2[2] ), 
        .I2(\pp0[2] ) );
  XOR2X1 U114 ( .O(N29), .I1(\pp0[2] ), .I2(\pp2[2] ) );
  FA1X1 \add_2_root_add_0_root_add_65_3/U1_4  ( .S(N23), .CO(
        \add_2_root_add_0_root_add_65_3/carry[5] ), .A(\pp3[4] ), .B(\pp1[4] ), 
        .CI(\add_2_root_add_0_root_add_65_3/carry[4] ) );
  FA1X1 \add_1_root_add_0_root_add_65_3/U1_3  ( .S(N30), .CO(
        \add_1_root_add_0_root_add_65_3/carry[4] ), .A(\pp2[3] ), .B(\pp0[3] ), 
        .CI(\add_1_root_add_0_root_add_65_3/carry[3] ) );
  multiplier_DW01_add_0 add_0_root_add_0_root_add_65_3 ( .A({N26, N25, N24, 
        N23, N22, N21, N20, n34}), .B({n34, N33, N32, N31, N30, N29, N28, N27}), .CI(n34), .SUM({N42, N41, N40, N39, N38, N37, N36, N35}) );
endmodule

