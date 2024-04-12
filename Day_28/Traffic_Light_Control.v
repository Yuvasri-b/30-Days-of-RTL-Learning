
`timescale 1ns / 1ps

module traffic_light_controller(
  input clk, reset, 
  output reg red, yellow, green );

localparam RED = 3'b001; 
localparam YELLOW = 3'b010;
localparam GREEN = 3'b100;

reg [2:0] state; 

always @(posedge clk)
begin
  if (reset) 
    state <= RED;
  else
    case (state)
      RED: begin
        red <= 1'b1;
        yellow <= 1'b0;
        green <= 1'b0;
        state <= YELLOW;
      end

      YELLOW: begin
        red <= 1'b0;
        yellow <= 1'b1; 
        green <= 1'b0;
        state <= GREEN;
      end

      GREEN: begin
        red <= 1'b0;
        yellow <= 1'b0;
        green <= 1'b1;
        state <= RED;
      end
    endcase
end

endmodule