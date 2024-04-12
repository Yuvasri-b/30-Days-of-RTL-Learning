module shift_and_add_multiplier(
    input [3:0] multiplicand,
    input [3:0] multiplier,
    output reg [7:0] product
);

reg [7:0] accumulator;
integer i;

always @(*) begin
    accumulator = multiplicand;
    product = 0;
    for (i = 0; i < 8; i = i + 1) begin
        if (multiplier[i] == 1)
            product = product + accumulator;
        accumulator = accumulator << 1;
    end
end

endmodule

