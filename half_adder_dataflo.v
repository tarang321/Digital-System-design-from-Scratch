`timescale 1ns / 1ps

module half_adder_dataflo(
    input a,
    input b,
    output sum,
    output carry
    );
    assign sum = a ^ b ;
    assign carry = a & b ;
endmodule
