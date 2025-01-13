`timescale 1ns / 1ps


module dadda_multiplier_6x6 (
    input [5:0] A,         
    input [5:0] B,          
    output reg [11:0] P   
);
    
     wire [5:0] P0 = A[0] ? B : 6'b0; // A[0] * B
    wire [5:0] P1 = A[1] ? (B << 1) : 6'b0; // A[1] * B shifted left by 1
    wire [5:0] P2 = A[2] ? (B << 2) : 6'b0; // A[2] * B shifted left by 2
    wire [5:0] P3 = A[3] ? (B << 3) : 6'b0; // A[3] * B shifted left by 3
    wire [5:0] P4 = A[4] ? (B << 4) : 6'b0; // A[4] * B shifted left by 4
    wire [5:0] P5 = A[5] ? (B << 5) : 6'b0; // A[5] * B shifted left by 5

    // Intermediate sums
    wire [11:0] sum0 = {6'b0, P0}; // Align P0
    wire [11:0] sum1 = {5'b0, P1}; // Align P1
    wire [11:0] sum2 = {4'b0, P2}; // Align P2
    wire [11:0] sum3 = {3'b0, P3}; // Align P3
    wire [11:0] sum4 = {2'b0, P4}; // Align P4
    wire [11:0] sum5 = {1'b0, P5}; // Align P5

    // Final Addition using shifting and summing
    always @(*) begin
        // Initialize product to zero
        P = 12'b0;

        // Add all partial products
        P = sum0 + sum1 + sum2 + sum3 + sum4 + sum5;
    end

endmodule
