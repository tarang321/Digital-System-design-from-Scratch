`timescale 1ns / 1ps

module tb_wallace_tree_6x6;

    // Inputs
    reg [5:0] A;
    reg [5:0] B;

    // Outputs
    wire [11:0] p;

    // Instantiate the wallace_tree_6x6 module
    wallace_tree_6x6 uut (
        .A(A),
        .B(B),
        .p(p)
    );

    // Test vector generation
    initial begin
        // Initialize Inputs
        A = 6'b000000; // Start with A = 0
        B = 6'b000000; // Start with B = 0

        // Apply test vectors
        #10 A = 6'b000101; B = 6'b000110; // Test case: 5 * 6
        #10 A = 6'b101010; B = 6'b110011; // Test case: 42 * 51
        #10 A = 6'b111111; B = 6'b000001; // Test case: 63 * 1
        #10 A = 6'b000011; B = 6'b101010; // Test case: 3 * 42
        #10 A = 6'b111111; B = 6'b111111; // Test case: 63 * 63
        #10 A = 6'b010101; B = 6'b101010; // Test case: 21 * 42
        #10 A = 6'b100000; B = 6'b100000; // Test case: 32 * 32
        #10 A = 6'b000001; B = 6'b000001; // Test case: 1 * 1

        // Finish simulation after 80 time units
        #80 $finish;
    end


endmodule
