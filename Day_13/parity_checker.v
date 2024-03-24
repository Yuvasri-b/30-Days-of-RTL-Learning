module parity_checker (
    input [7:0] data_in,
    output reg parity
);

// Internal signals
reg [7:0] data_temp;
reg [2:0] count; // Changed to reg [2:0] to accommodate count up to 8

// Loop variable declaration
integer i;

// Assign the temporary data to the input and count the number of ones
always @ (data_in)
begin
    data_temp <= data_in; // Non-blocking assignment
    count = 0;
    for (i = 0; i < 8; i = i + 1) // Loop variable usage
    begin
        if (data_in[i] == 1'b1)
            count = count + 1;
    end
end

// Check if count is odd to set the parity
always @* // Sensitivity to all signals in the block
begin
    if (count % 2 == 1)
        parity = 1'b1; // Blocking assignment
    else
        parity = 1'b0; // Blocking assignment
end

endmodule

