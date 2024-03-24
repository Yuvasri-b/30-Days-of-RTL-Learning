module jk_flip_flop (
    input J, K, CLK,
    output reg Q, Qbar
);

    always @(posedge CLK)
    begin
        if (J & ~K)
            Q <= 1;
        else if (~J & K)
            Q <= 0;
        else if (J & K)
            Q <= ~Q;
        // No change if both J and K are 0
    end

    assign Qbar = ~Q;

endmodule

`timescale 1ns / 1ns

module jk_flip_flop_tb;
    reg J, K, CLK;
    wire Q, Qbar;

    // Instantiate the JK flip-flop
    jk_flip_flop jk_flip_flop_inst (
        .J(J),
        .K(K),
        .CLK(CLK),
        .Q(Q),
        .Qbar(Qbar)
    );

   
    always #5 CLK = ~CLK; // Toggle clock every 5 time units

    
    initial begin
        J = 0; K = 0; CLK = 0;
        #100;
        J = 1; K = 0; // Set J
        #100; 
        J = 0; K = 1; // Reset J
        #100; 
        J = 1; K = 1; // Toggle
        #100; 
        J = 0; K = 0; // Hold
        #100; 
        
    end

  

endmodule

