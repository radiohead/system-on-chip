
module shift_adder_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  HS65_LL_FA1X4 U1_1 ( .A0(A[1]), .B0(B[1]), .CI(carry[1]), .CO(carry[2]), 
        .S0(SUM[1]) );
  HS65_LL_FA1X4 U1_2 ( .A0(A[2]), .B0(B[2]), .CI(carry[2]), .CO(carry[3]), 
        .S0(SUM[2]) );
  HS65_LL_FA1X4 U1_3 ( .A0(A[3]), .B0(B[3]), .CI(carry[3]), .CO(carry[4]), 
        .S0(SUM[3]) );
  HS65_LL_FA1X4 U1_4 ( .A0(A[4]), .B0(B[4]), .CI(carry[4]), .CO(carry[5]), 
        .S0(SUM[4]) );
  HS65_LL_FA1X4 U1_5 ( .A0(A[5]), .B0(B[5]), .CI(carry[5]), .CO(carry[6]), 
        .S0(SUM[5]) );
  HS65_LL_FA1X4 U1_6 ( .A0(A[6]), .B0(B[6]), .CI(carry[6]), .CO(carry[7]), 
        .S0(SUM[6]) );
  HS65_LLS_XOR3X2 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Z(SUM[7]) );
  HS65_LL_AND2X4 U1 ( .A(B[0]), .B(A[0]), .Z(carry[1]) );
  HS65_LLS_XOR2X3 U2 ( .A(A[0]), .B(B[0]), .Z(SUM[0]) );
endmodule


module shift_adder ( clock, reset, lefthand, righthand, result );
  input [7:0] lefthand;
  input [7:0] righthand;
  output [8:0] result;
  input clock, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18;
  assign result[8] = 1'b0;

  HS65_LL_DFPQX9 \result_reg[0]  ( .CP(clock), .D(N11), .Q(result[0]) );
  HS65_LL_DFPQX9 \result_reg[1]  ( .CP(clock), .D(N12), .Q(result[1]) );
  HS65_LL_DFPQX9 \result_reg[2]  ( .CP(clock), .D(N13), .Q(result[2]) );
  HS65_LL_DFPQX9 \result_reg[3]  ( .CP(clock), .D(N14), .Q(result[3]) );
  HS65_LL_DFPQX9 \result_reg[4]  ( .CP(clock), .D(N15), .Q(result[4]) );
  HS65_LL_DFPQX9 \result_reg[5]  ( .CP(clock), .D(N16), .Q(result[5]) );
  HS65_LL_DFPQX9 \result_reg[6]  ( .CP(clock), .D(N17), .Q(result[6]) );
  HS65_LL_DFPQX9 \result_reg[7]  ( .CP(clock), .D(N18), .Q(result[7]) );
  HS65_LL_NOR2AX3 U13 ( .A(N3), .B(reset), .Z(N11) );
  HS65_LL_NOR2AX3 U14 ( .A(N10), .B(reset), .Z(N18) );
  HS65_LL_NOR2AX3 U15 ( .A(N9), .B(reset), .Z(N17) );
  HS65_LL_NOR2AX3 U16 ( .A(N8), .B(reset), .Z(N16) );
  HS65_LL_NOR2AX3 U17 ( .A(N7), .B(reset), .Z(N15) );
  HS65_LL_NOR2AX3 U18 ( .A(N6), .B(reset), .Z(N14) );
  HS65_LL_NOR2AX3 U19 ( .A(N5), .B(reset), .Z(N13) );
  HS65_LL_NOR2AX3 U20 ( .A(N4), .B(reset), .Z(N12) );
  shift_adder_DW01_add_0 add_31 ( .A(lefthand), .B(righthand), .CI(1'b0), 
        .SUM({N10, N9, N8, N7, N6, N5, N4, N3}) );
endmodule

