module demux_1_to_4 (
    input wire i,
    input wire [1:0] sel,
    output reg y0,y1,y2,y3
);

always @ (i or sel) begin
    case(sel)
        2'b00: begin
            y0 = i;
            y1 = 1'b0;
            y2 = 1'b0;
            y3 = 1'b0;
        end
        2'b01: begin
            y0 = 1'b0;
            y1 = i;
            y2 = 1'b0;
            y3 = 1'b0;
        end
        2'b10: begin
            y0 = 1'b0;
            y1 = 1'b0;
            y2 = i;
            y3 = 1'b0;
        end
        2'b11: begin
            y0 = 1'b0;
            y1 = 1'b0;
            y2 = 1'b0;
            y3 = i;
        end
        default: begin
            y0 = 1'b0;
            y1 = 1'b0;
            y2 = 1'b0;
            y3 = 1'b0;
        end
    endcase
end

endmodule
