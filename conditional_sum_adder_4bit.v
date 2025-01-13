`timescale 1ns / 1ps

module conditional_sum_adder_4bit(
    input [3:0] A,   // First 4-bit operand
    input [3:0] B,   // Second 4-bit operand
    input Cin,       // Carry-in
    output reg [3:0] Sum,  // 4-bit sum
    output reg Cout       // Carry-out
);

    // Temporary variables for storing results
    wire [3:0] sum0, sum1;
   wire carry0, carry1, carry_out0, carry_out1;

    // Sum and carry assuming carry-in = 0
    full_adder FA0_0 (A[0], B[0], 1'b0, sum0[0], carry0);
    full_adder FA1_0 (A[1], B[1], carry0, sum0[1], carry1);
    full_adder FA2_0 (A[2], B[2], carry1, sum0[2], carry_out0);
    full_adder FA3_0 (A[3], B[3], carry_out0, sum0[3], carry_out0);

    // Sum and carry assuming carry-in = 1
    full_adder FA0_1 (A[0], B[0], 1'b1, sum1[0], carry0);
    full_adder FA1_1 (A[1], B[1], carry0, sum1[1], carry1);
    full_adder FA2_1 (A[2], B[2], carry1, sum1[2], carry_out1);
    full_adder FA3_1 (A[3], B[3], carry_out1, sum1[3], carry_out1);

    // Case statement for selecting sum and carry based on Cin
    always @(*) begin
        case (Cin)
            1'b0: begin
                Sum = sum0;
                Cout = carry_out0;
            end
            1'b1: begin
                Sum = sum1;
                Cout = carry_out1;
            end
        endcase
    end

endmodule

