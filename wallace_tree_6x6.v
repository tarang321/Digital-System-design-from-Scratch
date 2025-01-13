`timescale 1ns / 1ps

module wallace_tree_6x6(
    input [5:0] A,         
    input [5:0] B, 
    output [11:0] p
);

    // Partial products
    wire [5:0] P0 = A[0] ? B : 6'b0;        // A[0] * B
    wire [5:0] P1 = A[1] ? (B << 1) : 6'b0; // A[1] * B shifted left by 1
    wire [5:0] P2 = A[2] ? (B << 2) : 6'b0; // A[2] * B shifted left by 2
    wire [5:0] P3 = A[3] ? (B << 3) : 6'b0; // A[3] * B shifted left by 3
    wire [5:0] P4 = A[4] ? (B << 4) : 6'b0; // A[4] * B shifted left by 4
    wire [5:0] P5 = A[5] ? (B << 5) : 6'b0; // A[5] * B shifted left by 5

    // ************************** Wallace Tree Reduction **************************
    // Stage 1
    wire [8:0] sum1, carry1;
    half_adder_dataflo ha1(P0[1], P1[0], sum1[1], carry1[0]);
    full_addr fa1(P0[2], P1[1], P2[0], sum1[2], carry1[1]);
    full_addr fa2(P0[3], P1[2], P2[1], sum1[3], carry1[2]);
    full_addr fa3(P0[4], P1[3], P2[2], sum1[4], carry1[3]);
    full_addr fa4(P0[5], P1[4], P2[3], sum1[5], carry1[4]);
    half_adder_dataflo ha2(P1[5], P2[4], sum1[6], carry1[5]);
    assign sum1[0] = P0[0];
    assign sum1[7] = P2[5];

    // Stage 2
    wire [10:0] sum2, carry2;
    half_adder_dataflo ha3(sum1[1], carry1[0], sum2[1], carry2[0]);
    full_addr fa5(sum1[2], carry1[1], P3[0], sum2[2], carry2[1]);
    full_addr fa6(sum1[3], carry1[2], P3[1], sum2[3], carry2[2]);
    full_addr fa7(sum1[4], carry1[3], P3[2], sum2[4], carry2[3]);
    full_addr fa8(sum1[5], carry1[4], P3[3], sum2[5], carry2[4]);
    full_addr fa9(sum1[6], carry1[5], P3[4], sum2[6], carry2[5]);
    half_adder_dataflo ha4(P3[5], sum1[7], sum2[7], carry2[6]);
    assign sum2[0] = sum1[0];

    // Stage 3
    wire [10:0] sum3, carry3;
    half_adder_dataflo ha5(sum2[1], carry2[0], sum3[1], carry3[0]);
    full_addr fa10(sum2[2], carry2[1], carry1[0], sum3[2], carry3[1]);
    full_addr fa11(sum2[3], carry2[2], carry1[1], sum3[3], carry3[2]);
    full_addr fa12(sum2[4], carry2[3], carry1[2], sum3[4], carry3[3]);
    full_addr fa13(sum2[5], carry2[4], carry1[3], sum3[5], carry3[4]);
    full_addr fa14(sum2[6], carry2[5], carry1[4], sum3[6], carry3[5]);
    full_addr fa15(sum2[7], carry2[6], carry1[5], sum3[7], carry3[6]);
    assign sum3[0] = sum2[0];

    // Final Adder: Sum up the last two rows
    wire [11:0] final_sum, final_carry;
    half_adder_dataflo ha_final0(sum3[1], carry3[0], final_sum[1], final_carry[0]);
    full_addr fa_final1(sum3[2], carry3[1], final_carry[0], final_sum[2], final_carry[1]);
    full_addr fa_final2(sum3[3], carry3[2], final_carry[1], final_sum[3], final_carry[2]);
    full_addr fa_final3(sum3[4], carry3[3], final_carry[2], final_sum[4], final_carry[3]);
    full_addr fa_final4(sum3[5], carry3[4], final_carry[3], final_sum[5], final_carry[4]);
    full_addr fa_final5(sum3[6], carry3[5], final_carry[4], final_sum[6], final_carry[5]);
    full_addr fa_final6(sum3[7], carry3[6], final_carry[5], final_sum[7], final_carry[6]);
    assign final_sum[0] = sum3[0];
    assign p = {final_carry[6], final_sum[10:0]};

endmodule

