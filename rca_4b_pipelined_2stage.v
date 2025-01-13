`timescale 1ns / 1ps

module rca_4b_pipelined_2stage(
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

    // Pipeline registers for 2-stage pipelining
    reg c_stage1;
    reg [1:0] s_stage;

    // First stage: Generate sum and carry for the lower two bits (a[0] and a[1])
    full_addr fa0 (a[0], b[0], c, c1, s0);
    full_addr fa1 (a[1], b[1], c1, c2, s1);

    always @(posedge clk) begin
        sum[0] <= s0;
        sum[1] <= s1;
        s_stage <= {s1, s0}; // Store lower sum bits in pipeline register
        c_stage1 <= c2;       // Store carry from the first stage
    end

    // Second stage: Generate sum and carry for the upper two bits (a[2] and a[3])
    full_addr fa2 (a[2], b[2], c_stage1, c3, s2);
    full_addr fa3 (a[3], b[3], c3, cout, s3);

    always @(posedge clk) begin
        sum[2] <= s2;
        sum[3] <= s3;
        sum[1:0] <= s_stage; // Pass through lower bits from the previous stage
    end

endmodule
