`timescale 1ns / 1ns

module UniversalShiftRegister_tb;

    // Inputs
    reg clk;
    reg rst;
    reg shift_left;
    reg shift_right;
    reg [3:0] data_in;

    // Outputs
    wire [3:0] data_out;

    // Instantiate the UniversalShiftRegister module
    UniversalShiftRegister uut (
        .clk(clk),
        .rst(rst),
        .shift_left(shift_left),
        .shift_right(shift_right),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        rst = 1;
        shift_left = 0;
        shift_right = 0;
        data_in = 4'b0000;

        #10 rst = 0; // De-assert reset after 10 time units

        // Test cases
        #20 data_in = 4'b1010; // Input data: 1010

        // Shift left test
        #30 shift_left = 1; // Shift left
        #40 shift_left = 0;

        // Shift right test
        #50 shift_right = 1; // Shift right
        #60 shift_right = 0;

        // End simulation
        #10 $finish;
    end

endmodule

