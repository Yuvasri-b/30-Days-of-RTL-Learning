module MealyStateMachine_tb;

    // Inputs
    reg clk;
    reg reset;
    reg bit_in;

    // Outputs
    wire bit_out;

    // Instantiate the MealyStateMachine design
    MealyStateMachine dut (
        .clk(clk),
        .reset(reset),
        .bit_in(bit_in),
        .bit_out(bit_out)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;  // Half period delay
        clk = 1;
        #5;  // Half period delay
    end

    // Reset initialization
    initial begin
        reset = 1;
        #10;  // Reset for a few cycles
        reset = 0;
    end

    // Stimulus generation
    initial begin
        // Apply input stimuli
        bit_in = 1'b0;
        #20;
        bit_in = 1'b1;
        #20;
        bit_in = 1'b1;
        #20;
        bit_in = 1'b0;
        #20;
        
    end

endmodule

