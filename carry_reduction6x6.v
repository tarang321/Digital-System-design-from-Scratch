`timescale 1ns / 1ps

module carry_reduction6x6(
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

    // ****************************** reducer1 **************************
    wire [8:0] sum1, carry1;
    half_adder_dataflo ha1(P0[1], P1[0], sum1[1], carry1[0]);
    full_addr fa1(P0[2], P1[1], P2[0], sum1[2], carry1[1]);
    full_addr fa2(P0[3], P1[2], P2[1], sum1[3], carry1[2]);
    full_addr fa3(P0[4], P1[3], P2[2], sum1[4], carry1[3]);
    full_addr fa4(P0[5], P1[4], P2[3], sum1[5], carry1[4]);
    half_adder_dataflo ha2(P1[5], P2[4], sum1[6], carry1[5]);

    wire [8:0] sumline1 = {P2[5], sum1[5:1], P0[0]};
    wire [8:0] carryline1 = {carry1[5:0]};

    // ****************************** reducer2 **************************
    wire [8:0] sum2, carry2;
    half_adder_dataflo ha3(sum1[1], carryline1[0], sum2[1], carry2[0]);
    full_addr fa5(sum1[2], carryline1[1], P3[0], sum2[2], carry2[1]);
    full_addr fa6(sum1[3], carryline1[2], P3[1], sum2[3], carry2[2]);
    full_addr fa7(sum1[4], carryline1[3], P3[2], sum2[4], carry2[3]);
    full_addr fa8(sum1[5], carryline1[4], P3[3], sum2[5], carry2[4]);
    half_adder_dataflo ha4(P2[5], P3[4], sum2[6], carry2[5]);

    wire [10:0] sumline2 = {P3[5], sum2[5:1], sumline1[1], P0[0]};
    wire [8:0] carryline2 = {carry2[5:0]};

    // ****************************** Final Adder **************************
    // Adding sumline2 and carryline2 to get the final product output
    wire [11:0] final_sum;
    wire [11:0] final_carry;

    // This stage will use a series of half and full adders
    half_adder_dataflo fa_final0(sumline2[0], carryline2[0], final_sum[0], final_carry[0]);
    full_addr fa_final1(sumline2[1], carryline2[1], final_carry[0], final_sum[1], final_carry[1]);
    full_addr fa_final2(sumline2[2], carryline2[2], final_carry[1], final_sum[2], final_carry[2]);
    full_addr fa_final3(sumline2[3], carryline2[3], final_carry[2], final_sum[3], final_carry[3]);
    full_addr fa_final4(sumline2[4], carryline2[4], final_carry[3], final_sum[4], final_carry[4]);
    full_addr fa_final5(sumline2[5], carryline2[5], final_carry[4], final_sum[5], final_carry[5]);
    full_addr fa_final6(sumline2[6], carryline2[6], final_carry[5], final_sum[6], final_carry[6]);
    full_addr fa_final7(sumline2[7], carryline2[7], final_carry[6], final_sum[7], final_carry[7]);
    full_addr fa_final8(sumline2[8], carryline2[8], final_carry[7], final_sum[8], final_carry[8]);
    full_addr fa_final9(sumline2[9], 1'b0, final_carry[8], final_sum[9], final_carry[9]);
    full_addr fa_final10(sumline2[10], 1'b0, final_carry[9], final_sum[10], final_carry[10]);
    assign p = {final_carry[10], final_sum[10:0]};

endmodule
