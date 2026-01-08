module tb_jk_ff;

reg clk;
reg rst;
reg J;
reg K;
wire Q1;
wire Q2;

// Instantiate both designs
jk_ff uut1 (
    .clk(clk),
    .rst(rst),
    .J(J),
    .K(K),
    .Q(Q1)
);

jk_using_dff uut2 (
    .clk(clk),
    .rst(rst),
    .J(J),
    .K(K),
    .Q(Q2)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    // Initialize
    clk = 0;
    rst = 1;
    J   = 0;
    K   = 0;

    #10 rst = 0;

    // Hold
    #10 J = 0; K = 0;
    // Reset
    #10 J = 0; K = 1;
    // Set
    #10 J = 1; K = 0;
    // Toggle
    #10 J = 1; K = 1;
    // Toggle again
    #10 J = 1; K = 1;
    // Hold
    #10 J = 0; K = 0;

    #20 $finish;
end

initial begin
    $monitor("Time=%0t J=%b K=%b Q_JK=%b Q_DFF=%b",
              $time, J, K, Q1, Q2);
end

endmodule
