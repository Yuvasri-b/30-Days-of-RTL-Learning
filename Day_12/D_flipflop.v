module d_flip_flop (
    input D, CLK,
    output reg Q, Qbar
);

    always @(posedge CLK)
    begin
        Q <= D; // Capture input D on the rising edge of the clock
    end

    assign Qbar = ~Q;

endmodule

`timescale 1ns / 1ns

module d_flip_flop_tb;
    reg D, CLK;
    wire Q, Qbar;

   
    d_flip_flop d_flip_flop_inst (
        .D(D),
        .CLK(CLK),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    always #50 CLK = ~CLK; // Toggle clock every 5 time units

    // Stimulus
    initial begin
        D = 0; CLK = 0;
        #100; 
        D = 1; // Set D
        #100; 
        D = 0; // Reset D
        #100; 
        D = 1; // Set D again
        #100; 
        
    end


endmodule

