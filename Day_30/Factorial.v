

module factorial(
    input [7:0] num,
    output reg [31:0] result
);

integer i; 

always @(*) begin
    result = 1;
    for (i=1; i<=num; i=i+1) 
        result = result * i;
end

endmodule