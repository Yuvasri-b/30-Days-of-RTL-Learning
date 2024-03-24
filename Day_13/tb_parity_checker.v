
`timescale 1ns / 1ps

module tb_parity_checker;

    // Inputs
    reg [7:0] data_in;
    
    // Outputs
    wire parity;
    
    // Instantiate the parity checker
    parity_checker uut (
        .data_in(data_in),
        .parity(parity)
    );

    // Stimulus
    initial begin
        // Test even parity
        data_in = 8'b10101010;
        #100;
    
        
        // Test odd parity
        data_in = 8'b11011010;
        #100;
      
    end
    
endmodule
