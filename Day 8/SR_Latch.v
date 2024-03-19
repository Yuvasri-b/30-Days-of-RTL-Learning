module sr_latch (
    input S, 
    input R, 
    output reg Q, 
    output reg Q_bar 
);

always @ (S, R)
begin
    if (S && !R)     
    begin
        Q = 1'b1;
        Q_bar = 1'b0;
    end
    else if (!S && R) 
    begin
        Q = 1'b0;
        Q_bar = 1'b1;
    end
    else if (S && R) 
    begin
        Q = 1'bx;    
        Q_bar = 1'bx; 
    end
   
end

endmodule


`timescale 1ns / 1ps

module testbench_sr_latch;

  reg S;
  reg R;

  wire Q;
  wire Q_bar;

  sr_latch dut ( .S(S), .R(R), .Q(Q), .Q_bar(Q_bar) );

  initial begin
    S = 0;
    R = 0;

    S = 0;R = 0; #10;
    S = 1;R = 0; #10;
    S = 0;R = 1; #10;
    S = 0;R = 0; #10;
    

    $finish; 
  end

endmodule