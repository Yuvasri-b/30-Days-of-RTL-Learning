module UniversalShiftRegister(
    input clk,      // Clock input
    input rst,      // Reset input
    input shift_left, // Shift left control input
    input shift_right, // Shift right control input
    input [3:0] data_in, // Data input
    output reg [3:0] data_out // Data output
);

// Initialize internal signals
reg [3:0] shift_reg;

// Shift register logic
always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 4'b0000; // Reset shift register
    end else if (shift_left) begin
        shift_reg <= {shift_reg[2:0], data_in[0]}; // Shift left
    end else if (shift_right) begin
        shift_reg <= {data_in[3], shift_reg[3:1]}; // Shift right
    end
end

// Assign data output
assign data_out = shift_reg;

endmodule

