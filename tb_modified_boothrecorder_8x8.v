`timescale 1ns / 1ps

module tb_modified_boothrecorder_8x8;

    // Inputs
    reg signed [7:0] multiplier;
    reg signed [7:0] multiplicand;

    // Output
    wire signed [15:0] product;

    // Instantiate the modified_boothrecorder_8x8 module
    modified_boothrecorder_8x8 uut (
        .multiplier(multiplier),
        .multiplicand(multiplicand),
        .product(product)
    );

    // Test vector generation
    initial begin
        // Initialize Inputs
        multiplier = 8'b00000000;  // Start with multiplier = 0
        multiplicand = 8'b00000000; // Start with multiplicand = 0

        // Apply test vectors
        #10 multiplier = 8'b00000011; multiplicand = 8'b00000101; // Test case: 3 * 5 = 15
        #10 multiplier = 8'b11111111; multiplicand = 8'b00000001; // Test case: -1 * 1 = -1
        #10 multiplier = 8'b10101010; multiplicand = 8'b00000011; // Test case: -86 * 3 = -258
        #10 multiplier = 8'b01010101; multiplicand = 8'b00001111; // Test case: 85 * 15 = 1275
        #10 multiplier = 8'b11100000; multiplicand = 8'b11111111; // Test case: -32 * -1 = 32
        #10 multiplier = 8'b00000000; multiplicand = 8'b11111111; // Test case: 0 * -1 = 0
        #10 multiplier = 8'b11111100; multiplicand = 8'b00000010; // Test case: -4 * 2 = -8
        #10 multiplier = 8'b11000000; multiplicand = 8'b00000101; // Test case: -64 * 5 = -320

        // Finish simulation after 80 time units
        #80 $finish;
    end

    endmodule
