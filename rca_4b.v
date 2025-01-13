`timescale 1ns / 1ps

module rca_4b_pipelined(
    input [3:0] a,   // 4-bit input a
    input [3:0] b,   // 4-bit input b
    input c,         // Initial carry input
    input clk,       // Clock input
    output reg [3:0] sum, // 4-bit sum output
    inout  cout  // Final carry output
);

    // Internal wires for carry and sum
    wire c1, c2, c3;
    wire s0, s1, s2, s3;

    // Pipeline registers
    reg c_stage1, c_stage2, c_stage3;
    reg s0_stage, s1_stage, s2_stage;

    // First stage: Generate sum and carry for the first bit4
     full_addr fa0(a[0], b[0], c, c1, s0);
    always @(posedge clk) begin
       
        s0_stage <= s0;
        c_stage1 <= c1;
    end

    // Second stage: Generate sum and carry for the second bit
    full_addr fa1 (a[1], b[1], c_stage1, c2, s1);
    always @(posedge clk) begin
        
        sum[0] <= s0_stage;
        s1_stage <= s1;
        c_stage2 <= c2;
    end

    // Third stage: Generate sum and carry for the third bit
     full_addr fa2 (a[2], b[2], c_stage2, c3, s2);
    always @(posedge clk) begin
       
        sum[1] <= s1_stage;
        s2_stage <= s2;
        c_stage3 <= c3;
    end

    // Fourth stage: Generate sum and final carry for the fourth bit
    
    always @(posedge clk) begin
        
        sum[2] <= s2_stage;
        sum[3] <= s3;
    end
full_addr fa3 (a[3], b[3], c_stage3, cout, s3);
endmodule
