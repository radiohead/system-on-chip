
module shift_adder_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  XOR3X1 U1_7 ( .O(SUM[7]), .I1(A[7]), .I2(B[7]), .I3(carry[7]) );
  AN2X1 U1 ( .O(carry[1]), .I1(A[0]), .I2(B[0]) );
  XOR2X1 U2 ( .O(SUM[0]), .I1(B[0]), .I2(A[0]) );
  FA1X1 U1_1 ( .S(SUM[1]), .CO(carry[2]), .A(A[1]), .B(B[1]), .CI(carry[1]) );
  FA1X1 U1_2 ( .S(SUM[2]), .CO(carry[3]), .A(A[2]), .B(B[2]), .CI(carry[2]) );
  FA1X1 U1_3 ( .S(SUM[3]), .CO(carry[4]), .A(A[3]), .B(B[3]), .CI(carry[3]) );
  FA1X1 U1_4 ( .S(SUM[4]), .CO(carry[5]), .A(A[4]), .B(B[4]), .CI(carry[4]) );
  FA1X1 U1_5 ( .S(SUM[5]), .CO(carry[6]), .A(A[5]), .B(B[5]), .CI(carry[5]) );
  FA1X1 U1_6 ( .S(SUM[6]), .CO(carry[7]), .A(A[6]), .B(B[6]), .CI(carry[6]) );
endmodule


module shift_adder ( clock, reset, lefthand, righthand, result );
  input [7:0] lefthand;
  input [7:0] righthand;
  output [8:0] result;
  input clock, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18;

  QDFFX1 \result_reg[7]  ( .Q(result[7]), .D(N18), .CK(clock) );
  QDFFX1 \result_reg[6]  ( .Q(result[6]), .D(N17), .CK(clock) );
  QDFFX1 \result_reg[5]  ( .Q(result[5]), .D(N16), .CK(clock) );
  QDFFX1 \result_reg[4]  ( .Q(result[4]), .D(N15), .CK(clock) );
  QDFFX1 \result_reg[3]  ( .Q(result[3]), .D(N14), .CK(clock) );
  QDFFX1 \result_reg[2]  ( .Q(result[2]), .D(N13), .CK(clock) );
  QDFFX1 \result_reg[1]  ( .Q(result[1]), .D(N12), .CK(clock) );
  QDFFX1 \result_reg[0]  ( .Q(result[0]), .D(N11), .CK(clock) );
  AN2B1XLP U13 ( .O(N11), .I1(N3), .B1(reset) );
  AN2B1XLP U14 ( .O(N18), .I1(N10), .B1(reset) );
  AN2B1XLP U15 ( .O(N17), .I1(N9), .B1(reset) );
  AN2B1XLP U16 ( .O(N16), .I1(N8), .B1(reset) );
  AN2B1XLP U17 ( .O(N15), .I1(N7), .B1(reset) );
  AN2B1XLP U18 ( .O(N14), .I1(N6), .B1(reset) );
  AN2B1XLP U19 ( .O(N13), .I1(N5), .B1(reset) );
  AN2B1XLP U20 ( .O(N12), .I1(N4), .B1(reset) );
  TIE0X1 U21 ( .O(result[8]) );
  shift_adder_DW01_add_0 add_31 ( .A(lefthand), .B(righthand), .CI(result[8]), 
        .SUM({N10, N9, N8, N7, N6, N5, N4, N3}) );
endmodule

