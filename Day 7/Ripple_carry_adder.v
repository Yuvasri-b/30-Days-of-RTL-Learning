// 3-bit RIPPLE-CARRY ADDER  


module RippleCarryAdder(x, y, cin, sum, cout);
input [2:0] x, y;
input cin;
output [2:0] sum;
output cout;

wire c0, c1;

assign #10 sum[0]= (x[0] ^ y[0]) ^ cin;
assign #10 sum[1]= (x[1] ^ y[1]) ^ c0;
assign #10 sum[2]= (x[2] ^ y[2]) ^ c1;

assign #10 c0= (x[0] & y[0]) | (x[0] & cin) | (y[0] & cin) ;
assign #10 c1= (x[1] & y[1]) | (x[1] & c0) | (y[1] & c0) ;
assign #10 cout= (x[2] & y[2]) | (x[2] & c1) | (y[2] & c1) ;


endmodule