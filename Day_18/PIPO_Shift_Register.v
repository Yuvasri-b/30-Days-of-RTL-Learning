module pipo(din,clk,dout);
input wire [3:0] din;
input wire clk;
output reg [3:0] dout;

always @(posedge clk)
begin 
dout <= din;
end
endmodule
