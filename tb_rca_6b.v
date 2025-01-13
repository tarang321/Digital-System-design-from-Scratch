`timescale 1ns / 1ps

module tb_rca_6b;

    // Inputs
    reg [5:0] a;
    reg [5:0] b;
    reg c; // Carry-in

    // Outputs
    wire [5:0] sum; // Sum
    wire cout; // Final carry-out

    // Instantiate the rca_6b module
    rca_6b uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .cout(cout)
    );

    // Test vector generation
    initial begin
        // Initialize Inputs
        a = 6'b0; 
        b = 6'b0; 
        c = 0;

        // Apply test vectors
        #10 a = 6'b000001; b = 6'b000001; c = 0; // 1 + 1
        #10 a = 6'b111111; b = 6'b000001; c = 0; // 63 + 1
        #10 a = 6'b101010; b = 6'b010101; c = 0; // Random test case
        #10 a = 6'b111111; b = 6'b111111; c = 0; // 63 + 63
        #10 a = 6'b000111; b = 6'b000111; c = 1; // 7 + 7 with carry-in
        #10 a = 6'b101010; b = 6'b101010; c = 1; // Random test case with carry-in
        #10 a = 6'b111111; b = 6'b000000; c = 1; // 63 + 0 with carry-in
        #10 a = 6'b000000; b = 6'b000000; c = 1; // 0 + 0 with carry-in

        // Finish simulation after 80 time units
        #80 $finish;
    end

endmodule
