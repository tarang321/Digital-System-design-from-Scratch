`timescale 1ns / 1ps


module full_adder (
    input A,      // First input bit
    input B,      // Second input bit
    input Cin,    // Carry-in bit
    output Sum,   // Sum output
    output Cout   // Carry-out bit
);

    // Full adder logic
    assign Sum = A ^ B ^ Cin;    // Sum = A ? B ? Cin
    assign Cout = (A & B) | (B & Cin) | (A & Cin);  // Cout = A.B + B.Cin + A.Cin

endmodule
