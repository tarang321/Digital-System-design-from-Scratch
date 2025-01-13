`timescale 1ns / 1ps


module conditional_sum_adder_12bit(
    input [11:0] A,   // First 12-bit operand
    input [11:0] B,   // Second 12-bit operand
    input Cin,        // Carry-in
    output [11:0] Sum, // 12-bit sum (changed from reg to wire)
    output Cout       // Carry-out (changed from reg to wire)
);

    wire carry_out0, carry_out1;  // Intermediate carry signals

    // First 4-bit block (bits 3:0)
    wire [3:0] sum0;  // Temporary sum for block 0

    conditional_sum_adder_4bit CSA0 (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .Sum(sum0),
        .Cout(carry_out0)
    );

    // Second 4-bit block (bits 7:4)
    wire [3:0] sum1_0, sum1_1;    // Temporary sums for block 1
    wire carry_out1_0, carry_out1_1;  // Carry-out signals for block 1

    conditional_sum_adder_4bit CSA1_0 (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(1'b0),
        .Sum(sum1_0),
        .Cout(carry_out1_0)
    );

    conditional_sum_adder_4bit CSA1_1 (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(1'b1),
        .Sum(sum1_1),
        .Cout(carry_out1_1)
    );

    // Third 4-bit block (bits 11:8)
    wire [3:0] sum2_0, sum2_1;    // Temporary sums for block 2
    wire carry_out2_0, carry_out2_1;  // Carry-out signals for block 2

    conditional_sum_adder_4bit CSA2_0 (
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(1'b0),
        .Sum(sum2_0),
        .Cout(carry_out2_0)
    );

    conditional_sum_adder_4bit CSA2_1 (
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(1'b1),
        .Sum(sum2_1),
        .Cout(carry_out2_1)
    );

    // Assign the final sum and carry-out based on the intermediate carries
    assign Sum[3:0] = sum0;

    // Second 4-bit block sum and carry selection
    assign {Sum[7:4], carry_out1} = (carry_out0 == 1'b0) ? {sum1_0, carry_out1_0} : {sum1_1, carry_out1_1};

    // Third 4-bit block sum and final carry-out selection
    assign {Sum[11:8], Cout} = (carry_out1 == 1'b0) ? {sum2_0, carry_out2_0} : {sum2_1, carry_out2_1};

endmodule


