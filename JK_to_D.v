module jk_using_dff (
    input  wire clk,
    input  wire rst,
    input  wire J,
    input  wire K,
    output reg  Q
);

wire D;
assign D = (J & ~Q) | (~K & Q);

always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
