module CarryLookAheadAdder(x, y, cin, sum, cout);

input [2:0] x, y;
input cin;
output [2:0] sum;
output cout;

wire c0, c1;
wire [2:0] p, q;

assign q[0] = x[0] & y[0];
assign q[1] = x[1] & y[1];
assign q[2] = x[2] & y[2];
assign p[0] = x[0] | y[0];
assign p[1] = x[1] | y[1];
assign p[2] = x[2] | y[2];
assign c0 = q[0] | (p[0] & cin);
assign c1 = q[1] | (p[1] & q[0]) | (p[1] & p[0] & cin);
assign cout = q[2] | (p[2] & q[1]) | (p[2] & p[1] & q[0]) | (p[2] & p[1] & p[0] & cin);

assign sum[0] = (p[0] ^ q[0]) ^ cin;
assign sum[1] = (p[1] ^ q[1]) ^ c0;
assign sum[2] = (p[2] ^ q[2]) ^ c1;

endmodule
