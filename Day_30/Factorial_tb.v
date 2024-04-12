module testbench;
reg [7:0] num;
wire [31:0] result;

factorial dut(.num(num), .result(result));

initial begin
    num = 6; #10; 
    num = 9; #10;
end

initial begin
    $monitor("num = %0d, result = %0d", num, result);
end
      
endmodule
