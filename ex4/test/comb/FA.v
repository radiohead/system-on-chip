module ADD_FULL (s,cout,x,y,cin);
output s,cout;
input x,y,cin;
//internal nodes also declared as wires
wire cin,x,y,s,cout,s1,c1,c2;
ADD_HALF HA1(s1,c1,x,y);
ADD_HALF HA2(s,c2,cin,s1);
or (cout,c1,c2);
endmodule

