module D_Latch (
    input D, 
    input EN, 
    output reg Q
);

always @ (posedge EN)
begin
    if (EN) 
        Q = D;
end

endmodule
