module ADD_HALF (s,c,x,y);
output s,c;
input x,y;
wire s,c,x,y;
// this line is optional since nodes default to wires
xor G1 (s,x,y); // instantiation of XOR gate
and G2 (c,x,y); // instantiation of AND gate
endmodule