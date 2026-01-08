module jk_ff (
    input  wire clk,
    input  wire rst,   // Active-high asynchronous reset
    input  wire J,
    input  wire K,
    output reg  Q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 1'b0;
    else begin
        case ({J, K})
            2'b00: Q <= Q;     // Hold
            2'b01: Q <= 1'b0;  // Reset
            2'b10: Q <= 1'b1;  // Set
            2'b11: Q <= ~Q;    // Toggle
        endcase
    end
end

endmodule
