module sr_flip_flop (
    input S, R,
    output reg Q, Qbar
);

    always @(S, R)
    begin
        if (R & ~S) // Reset
        begin
            Q <= 0;
            Qbar <= 1;
        end
        else if (S & ~R) // Set
        begin
            Q <= 1;
            Qbar <= 0;
        end
    end
endmodule

`timescale 1ns / 1ns 

module sr_flip_flop_tb;
    reg S, R;
    wire Q, Qbar;

    // Instantiate the SR flip-flop
    sr_flip_flop sr_flip_flop_inst (
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Stimulus
    initial begin
        // Test case 1: Set
        S = 1;
        R = 0;
        #100;
        S = 0; // Deassert S
        #100;
        // Test case 2: Reset
        S = 0;
        R = 1;
        #100;
        R = 0; // Deassert R
        #10;
        // Test case 3: Hold previous state
        S = 0;
        R = 0;
        #100;
        
    end

  

endmodule

