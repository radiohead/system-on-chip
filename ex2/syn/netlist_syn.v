
// Generated by Cadence Encounter(R) RTL Compiler RC12.22 - v12.20-s014_1

// Verification Directory fv/shift_adder 

module shift_adder(clock, reset, lefthand, righthand, result);
  input clock, reset;
  input [7:0] lefthand, righthand;
  output [8:0] result;
  wire clock, reset;
  wire [7:0] lefthand, righthand;
  wire [8:0] result;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41;
  assign result[8] = 1'b0;
  QDFFX1 \result_reg[7] (.CK (clock), .D (n_41), .Q (result[7]));
  MUXB2X1 g434(.S (n_39), .A (n_2), .B (n_3), .EB (reset), .O (n_41));
  QDFFX1 \result_reg[6] (.CK (clock), .D (n_40), .Q (result[6]));
  MUXB2X1 g436(.S (n_38), .A (n_22), .B (n_21), .EB (reset), .O (n_40));
  AO12X1 g438(.A1 (n_9), .B1 (n_38), .B2 (n_8), .O (n_39));
  QDFFX1 \result_reg[5] (.CK (clock), .D (n_37), .Q (result[5]));
  MUXB2X1 g439(.S (n_36), .A (n_28), .B (n_27), .EB (reset), .O (n_37));
  AO12X1 g441(.A1 (n_16), .B1 (n_36), .B2 (n_15), .O (n_38));
  QDFFX1 \result_reg[4] (.CK (clock), .D (n_35), .Q (result[4]));
  MUXB2X1 g442(.S (n_34), .A (n_18), .B (n_17), .EB (reset), .O (n_35));
  AO12X1 g444(.A1 (n_5), .B1 (n_34), .B2 (n_4), .O (n_36));
  QDFFX1 \result_reg[3] (.CK (clock), .D (n_33), .Q (result[3]));
  MUXB2X1 g445(.S (n_32), .A (n_20), .B (n_19), .EB (reset), .O (n_33));
  QDFFX1 \result_reg[2] (.CK (clock), .D (n_31), .Q (result[2]));
  AO12X1 g447(.A1 (n_7), .B1 (n_32), .B2 (n_6), .O (n_34));
  QDFFX1 \result_reg[1] (.CK (clock), .D (n_29), .Q (result[1]));
  MUXB2X1 g448(.S (n_30), .A (n_24), .B (n_23), .EB (reset), .O (n_31));
  AO12X1 g450(.A1 (n_11), .B1 (n_30), .B2 (n_10), .O (n_32));
  MUXB2X1 g451(.S (n_14), .A (n_26), .B (n_1), .EB (reset), .O (n_29));
  QDFFX1 \result_reg[0] (.CK (clock), .D (n_25), .Q (result[0]));
  INVX1 g456(.I (n_27), .O (n_28));
  OAI12X1 g453(.A1 (n_12), .B1 (n_13), .B2 (n_26), .O (n_30));
  MUXB2X1 g454(.S (lefthand[0]), .A (righthand[0]), .B (n_0), .EB
       (reset), .O (n_25));
  INVX1 g459(.I (n_23), .O (n_24));
  INVX1 g461(.I (n_21), .O (n_22));
  INVX1 g463(.I (n_19), .O (n_20));
  INVX1 g465(.I (n_17), .O (n_18));
  OR2B1XLP g457(.I1 (n_16), .B1 (n_15), .O (n_27));
  OR2B1XLP g458(.I1 (n_13), .B1 (n_12), .O (n_14));
  OR2B1XLP g460(.I1 (n_11), .B1 (n_10), .O (n_23));
  OR2B1XLP g462(.I1 (n_9), .B1 (n_8), .O (n_21));
  OR2B1XLP g464(.I1 (n_7), .B1 (n_6), .O (n_19));
  OR2B1XLP g466(.I1 (n_5), .B1 (n_4), .O (n_17));
  INVX1 g467(.I (n_2), .O (n_3));
  MAOI1X1 g468(.A1 (lefthand[7]), .A2 (righthand[7]), .B1
       (righthand[7]), .B2 (lefthand[7]), .O (n_2));
  INVXLP g455(.I (n_26), .O (n_1));
  AN2X1 g469(.I1 (lefthand[2]), .I2 (righthand[2]), .O (n_11));
  ND2X1 g479(.I1 (lefthand[1]), .I2 (righthand[1]), .O (n_12));
  AN2X1 g470(.I1 (lefthand[4]), .I2 (righthand[4]), .O (n_5));
  ND2X1 g471(.I1 (lefthand[0]), .I2 (righthand[0]), .O (n_26));
  NR2X1 g472(.I1 (lefthand[1]), .I2 (righthand[1]), .O (n_13));
  AN2X1 g473(.I1 (lefthand[6]), .I2 (righthand[6]), .O (n_9));
  OR2X1 g474(.I1 (lefthand[6]), .I2 (righthand[6]), .O (n_8));
  OR2X1 g476(.I1 (lefthand[4]), .I2 (righthand[4]), .O (n_4));
  OR2X1 g481(.I1 (lefthand[5]), .I2 (righthand[5]), .O (n_15));
  AN2X1 g478(.I1 (lefthand[5]), .I2 (righthand[5]), .O (n_16));
  OR2X1 g475(.I1 (lefthand[2]), .I2 (righthand[2]), .O (n_10));
  AN2X1 g480(.I1 (lefthand[3]), .I2 (righthand[3]), .O (n_7));
  OR2X1 g477(.I1 (lefthand[3]), .I2 (righthand[3]), .O (n_6));
  INVX1 g482(.I (righthand[0]), .O (n_0));
endmodule

