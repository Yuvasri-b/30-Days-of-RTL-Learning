
`timescale 1ns / 1ps

module traffic_light_tb();

reg clk;
reg reset;

wire red;
wire yellow;
wire green;

traffic_light_controller dut( .clk(clk), .reset(reset), .red(red), .yellow(yellow),
  .green(green) );

always #5 clk = ~clk; 

initial begin
  clk = 0;
  reset = 1;
  #100 reset = 0;

  #100;

end

endmodule