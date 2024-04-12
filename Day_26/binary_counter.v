module binary_counter (
    input clk,       // Clock input
    input rst,       // Reset input
    output reg [3:0] count // Output count
);

// Always block to increment the counter on the rising edge of the clock
always @(posedge clk or posedge rst) begin
    if (rst)            // Reset condition
        count <= 4'b0000; // Reset the count
    else if (count == 4'b1111) // If count reaches the maximum value
        count <= 4'b0000; // Reset the count
    else
        count <= count + 1; // Increment the count
end

endmodule

