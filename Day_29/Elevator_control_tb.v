module elevator_tb;

reg clk;
reg reset;
reg [4:0] floor_req;
wire [4:0] floor_pos;

elevator dut ( .clk(clk), .reset(reset), .floor_req(floor_req), .floor_pos(floor_pos));

initial begin
    clk = 1'b0;
    reset = 1'b1;
    floor_req = 5'b00000;
    #10 reset = 1'b0; 
    #10 floor_req = 5'b00100; // request floor 3
    #100 floor_req = 5'b00010; // request floor 2
    #100 floor_req = 5'b01000; // request floor 4
    #100 floor_req = 5'b00001; // request floor 1
    #100 floor_req = 5'b01010; // request floor 5
    #100 $finish; 
end

always #5 clk = ~clk;

endmodule
