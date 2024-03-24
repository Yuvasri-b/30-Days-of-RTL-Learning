
module comparator_2x2(
    input [1:0] A,
    input [1:0] B,
    output A_greater_B,
    output A_equal_B,
    output A_less_B
);

assign A_greater_B = (A > B);
assign A_equal_B   = (A == B);
assign A_less_B    = (A < B);

endmodule
