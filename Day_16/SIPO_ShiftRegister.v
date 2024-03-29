
module sipo_shift_register(
    input wire clk,       // Clock input
    input wire reset,     // Reset input
    input wire serial_in, // Serial input
    output reg [3:0] parallel_out  // 4-bit Parallel output
);

    reg [3:0] register;

    always @(posedge clk or posedge reset) begin
        if (reset) begin  // Reset condition
            register <= 4'b0000;
        end else begin
            register <= {register[2:0], serial_in};  // Shift register operation
        end
    end

    assign parallel_out = register;  // Output parallel data

endmodule
