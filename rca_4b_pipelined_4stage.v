`timescale 1ns / 1ps

module rca_4b_pipelined_4stage(
    input [3:0] a,   // 4-bit input a
    input [3:0] b,   // 4-bit input b
    input c,         // Initial carry input
    input clk,       // Clock input
    output reg [3:0] sum, // 4-bit sum output
    inout cout  // Final carry output
);

    // Internal wires for carry and sum
    wire c1, c2, c3;
    wire s0, s1, s2, s3;

    // Pipeline registers for intermediate values at each stage
    reg c_stage1, c_stage2, c_stage3;
    reg s0_stage, s1_stage, s2_stage;

    // Stage 1: Generate sum and carry for the least significant bit (a[0] and b[0])
    full_addr fa0 (a[0], b[0], c, c1, s0);
    always @(posedge clk) begin
        s0_stage <= s0;
        c_stage1 <= c1;
    end

    // Stage 2: Generate sum and carry for the second bit (a[1] and b[1])
    full_addr fa1 (a[1], b[1], c_stage1, c2, s1);
    always @(posedge clk) begin
        sum[0] <= s0_stage; // Pass through the result from Stage 1
        s1_stage <= s1;
        c_stage2 <= c2;
    end

    // Stage 3: Generate sum and carry for the third bit (a[2] and b[2])
    full_addr fa2 (a[2], b[2], c_stage2, c3, s2);
    always @(posedge clk) begin
        sum[1] <= s1_stage; // Pass through the result from Stage 2
        s2_stage <= s2;
        c_stage3 <= c3;
    end

    // Stage 4: Generate sum and carry for the most significant bit (a[3] and b[3])
    full_addr fa3 (a[3], b[3], c_stage3, cout, s3);
    always @(posedge clk) begin
        sum[2] <= s2_stage; // Pass through the result from Stage 3
        sum[3] <= s3;       // Final sum bit
    end

endmodule
