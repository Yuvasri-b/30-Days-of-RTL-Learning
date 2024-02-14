module half_adder_structural (
    input a,
    input b,
    output sum,
    output carry
);

    xor gate_xor(sum, a, b);
    and gate_and(carry, a, b);

endmodule
module tb_half_adder_structural;

    reg a, b;
    wire sum, carry;

    half_adder_structural HA1 (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        // Test case 1
        a = 1'b0; b = 1'b0;
        #100 
	// Test case 2
        a = 1'b0; b = 1'b1;
        #100
        // Test case 3
        a = 1'b1; b = 1'b0;
        #100
        // Test case 4
        a = 1'b1; b = 1'b1;
    end

endmodule

