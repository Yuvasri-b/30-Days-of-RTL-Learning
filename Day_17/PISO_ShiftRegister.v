
`timescale 1ns / 1ps

module PISO_shift_register (
    input wire clk, reset, parallel_in,
    output wire serial_out );

reg [3:0] shift_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 4'b0000; 
    end else begin
        shift_reg[0] <= parallel_in;
        shift_reg[1] <= shift_reg[0];
        shift_reg[2] <= shift_reg[1];
        shift_reg[3] <= shift_reg[2];
    end
end

assign serial_out = shift_reg[3];

endmodule