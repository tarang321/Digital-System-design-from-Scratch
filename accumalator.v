`timescale 1ns / 1ps

module Accumulator (
    input clk,
    input reset,
    input signed [15:0] data_in,
    output reg overflow,
    output reg underflow,
    output reg [15:0] min_val,
    output reg [15:0] max_val,
    output reg [31:0] acc,
    output reg [31:0] cycle_count
);

reg [31:0] next_acc;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        acc <= 32'b0;
        overflow <= 0;
        underflow <= 0;
        min_val <= 16'h7FFF;
        max_val <= 16'h8000;
        cycle_count <= 32'b0;
    end else begin
        if (!overflow && !underflow) begin
            acc <= next_acc;
            cycle_count <= cycle_count + 1;

            if (data_in < min_val)
                min_val <= data_in;
            if (data_in > max_val)
                max_val <= data_in;

            if (next_acc > 32'h7FFFFFFF) begin
                overflow <= 1;
            end else if (next_acc < 32'h80000000) begin
                underflow <= 1;
            end
        end
    end
end

always @(*) begin
    next_acc = acc + data_in;
end

endmodule

