
module ADD_HALF_0 ( s, c, x, y );
  input x, y;
  output s, c;


  HS65_LLS_XOR2X3 U3 ( .A(y), .B(x), .Z(s) );
  HS65_LL_AND2X4 U4 ( .A(y), .B(x), .Z(c) );
endmodule


module ADD_HALF_1 ( s, c, x, y );
  input x, y;
  output s, c;


  HS65_LLS_XOR2X3 U3 ( .A(y), .B(x), .Z(s) );
  HS65_LL_AND2X4 U4 ( .A(y), .B(x), .Z(c) );
endmodule


module ADD_FULL ( s, cout, x, y, cin );
  input x, y, cin;
  output s, cout;
  wire   s1, c1, c2;

  ADD_HALF_1 HA1 ( .s(s1), .c(c1), .x(x), .y(y) );
  ADD_HALF_0 HA2 ( .s(s), .c(c2), .x(cin), .y(s1) );
  HS65_LL_OR2X4 U2 ( .A(c1), .B(c2), .Z(cout) );
endmodule

