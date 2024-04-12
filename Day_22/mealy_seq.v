module MealyStateMachine (
    input clk,       // Clock input
    input reset,     // Reset input
    input bit_in,    // Input stream
    output reg bit_out  // Output
);

// State declaration
parameter S_IDLE = 2'b00;    // Idle state
parameter S_0 = 2'b01;       // State after 0
parameter S_01 = 2'b10;      // State after 01
parameter S_011 = 2'b11;     // State after 011

// Internal state register
reg [1:0] state;

// Next state and output logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S_IDLE; // Reset to initial state
        bit_out <= 0;    // Reset output
    end
    else begin
        case (state)
            S_IDLE: begin
                if (bit_in)    // Transition to state S_0 on detecting 0
                    state <= S_0;
                else
                    state <= S_IDLE;
            end
            S_0: begin
                if (bit_in)    // Stay in S_0 if another 0 is detected
                    state <= S_0;
                else
                    state <= S_01; // Move to S_01 on detecting 1 after 0
            end
            S_01: begin
                if (bit_in)    // Stay in S_01 if 1 is detected
                    state <= S_01;
                else
                    state <= S_011; // Move to S_011 on detecting 0 after 01
            end
            S_011: begin
                if (bit_in) begin  // Output '1' on detecting 0110
                    state <= S_0;
                    bit_out <= 1;
                end
                else
                    state <= S_IDLE; // Reset to idle state on any other input
            end
            default: state <= S_IDLE; // Default to idle state
        endcase
    end
end

endmodule

