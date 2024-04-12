module elevator(
   input clk, reset,
   input [4:0] floor_req, // floor request signals
   output reg [4:0] floor_pos // signal indicating elevator position
);

parameter IDLE = 3'b000;
parameter MOVING_UP = 3'b001;
parameter MOVING_DOWN = 3'b010;
parameter STOPPED = 3'b011;

reg [2:0] state; 
reg [4:0] floor_req_reg; // register to hold floor requests
reg [4:0] floor_pos_reg; // register to hold elevator position

always @(posedge clk, posedge reset) begin
   if (reset) begin
       state <= IDLE; // reset to idle state
       floor_req_reg <= 5'b00000;
       floor_pos_reg <= 5'b00000;
       floor_pos <= floor_pos_reg;
   end else begin
       case (state)
           IDLE: begin
               if (floor_req != 5'b00000) begin
                   if (floor_req > floor_pos_reg) begin
                       state <= MOVING_UP; // move up to requested floor
                   end else if (floor_req < floor_pos_reg) begin
                       state <= MOVING_DOWN; // move down to requested floor
                   end else begin
                       state <= STOPPED; // already at requested floor
                   end
               end
           end
           MOVING_UP: begin
               if (floor_pos_reg == floor_req) begin
                   state <= STOPPED; // reached requested floor
               end else begin
                   floor_pos_reg <= floor_pos_reg + 1; // move up one floor
               end
           end
           MOVING_DOWN: begin
               if (floor_pos_reg == floor_req) begin
                   state <= STOPPED; // reached requested floor
               end else begin
                   floor_pos_reg <= floor_pos_reg - 1; // move down one floor
               end
           end
           STOPPED: begin
               floor_req_reg[floor_pos_reg] <= 1'b0; // clear request for current floor
               if (floor_req != 5'b00000) begin
                   if (floor_req > floor_pos_reg) begin
                       state <= MOVING_UP; // move up to requested floor
                   end else if (floor_req < floor_pos_reg) begin
                       state <= MOVING_DOWN; // move down to requested floor
                   end else begin
                       state <= STOPPED; // already at requested floor
                   end
               end else begin
                   state <= IDLE; // no more requests, go back to idle state
               end
           end
       endcase
       floor_pos <= floor_pos_reg;
       floor_req_reg[floor_req] <= 1'b1; // set request for requested floor
   end
end

endmodule
