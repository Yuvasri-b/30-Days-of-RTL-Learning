
module ring_counter_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	ring_counter uut (
		.clk(clk), 
		.rst(rst), 
		.q(q)
	);

initial begin
		clk = 1; rst = 1;
		#10; clk=1; rst=0;
	end
	
	always
	forever #5 clk=~clk;
	
	initial begin
	$monitor("time=%g clk=%b rst=%b count=%b",$time,clk,rst,q);
	#2000 $finish;
	end
	
endmodule