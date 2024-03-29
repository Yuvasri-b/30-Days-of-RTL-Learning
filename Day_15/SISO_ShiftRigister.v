module siso_shift_register(
    input wire clk,     // Clock input
    input wire reset,   // Reset input
    input wire serial_in,  // Serial input
    output reg [3:0] serial_out  // 4-bit Serial output
);

    reg [3:0] register;  

    always @(posedge clk or posedge reset) begin
        if (reset) begin  // Reset condition
            register <= 4'b0000;
        end else begin
            register <= {register[2:0], serial_in};  // Shift register operation
        end
    end

    always @(posedge clk) begin
        serial_out <= register;  // Output serial data on every clock cycle
    end

endmodule

