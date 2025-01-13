`timescale 1ns / 1ps

module tb_accumalator();

reg clk, reset;
reg signed [15:0] data_in;
wire overflow, underflow;
wire [15:0] min_val, max_val;
wire [31:0] acc, cycle_count;

Accumulator uut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .overflow(overflow),
    .underflow(underflow),
    .min_val(min_val),
    .max_val(max_val),
    .acc(acc),
    .cycle_count(cycle_count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    data_in = 0;
    #10;
    reset = 0;

    data_in = 16'sd30000; #10;
    data_in = 16'sd2000;  #10;
    data_in = -16'sd15000; #10;
    data_in = -16'sd32000; #10;
    data_in = 16'sd40000;  #10;

    #50;
    $finish;
end

endmodule

