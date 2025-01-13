`timescale 1ns / 1ps

module tb_rca_4b_pipelined_4stage;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg c;  // Initial carry input
    reg clk; // Clock input

    // Outputs
    wire [3:0] sum;
    wire cout;  // Final carry output

    // Instantiate the rca_4b_pipelined_4stage module
    rca_4b_pipelined_4stage uut (
        .a(a),
        .b(b),
        .c(c),
        .clk(clk),
        .sum(sum),
        .cout(cout)
    );

    // Clock Generation
    always begin
        #5 clk = ~clk; // Clock period of 10ns
    end

    // Test vector generation
    initial begin
        // Initialize Inputs
        clk = 0;
        a = 4'b0000;  // Start with a = 0
        b = 4'b0000;  // Start with b = 0
        c = 0;        // Start with carry = 0

        // Apply test vectors
        #10 a = 4'b1011; b = 4'b1101; c = 1'b0;  // Test case: 11 + 13
        #10 a = 4'b1111; b = 4'b0001; c = 1'b0;  // Test case: 15 + 1
        #10 a = 4'b0101; b = 4'b0101; c = 1'b1;  // Test case: 5 + 5 with carry-in
        #10 a = 4'b0000; b = 4'b0001; c = 1'b1;  // Test case: 0 + 1 with carry-in
        #10 a = 4'b1111; b = 4'b1111; c = 1'b0;  // Test case: 15 + 15
        #10 a = 4'b0110; b = 4'b1001; c = 1'b0;  // Test case: 6 + 9
        #10 a = 4'b1100; b = 4'b0011; c = 1'b1;  // Test case: 12 + 3 with carry-in

        // Finish simulation
        #10 $finish;
    end

    

endmodule
