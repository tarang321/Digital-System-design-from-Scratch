`timescale 1ns / 1ps

module tb_Cla_16b;

    // Inputs
    reg [15:0] a;
    reg [15:0] b;
    reg c; // Carry-in

    // Outputs
    wire [15:0] s; // Sum
    wire carry; // Final carry-out

    // Instantiate the Cla_16b module
    Cla_16b uut (
        .a(a),
        .b(b),
        .c(c),
        .s(s),
        .carry(carry)
    );

    // Test vector generation
    initial begin
        // Initialize Inputs
        a = 16'b0; 
        b = 16'b0; 
        c = 0;

        // Apply test vectors
        #10 a = 16'b0000000000000001; b = 16'b0000000000000001; c = 0; // 1 + 1
        #10 a = 16'b1111111111111111; b = 16'b0000000000000001; c = 0; // 65535 + 1
        #10 a = 16'b1010101010101010; b = 16'b0101010101010101; c = 0; // Random test case
        #10 a = 16'b1111111111111111; b = 16'b1111111111111111; c = 0; // 65535 + 65535
        #10 a = 16'b0000000000001111; b = 16'b0000000000001111; c = 1; // 15 + 15 with carry-in
        #10 a = 16'b1010101010101010; b = 16'b1010101010101010; c = 1; // Random test case with carry-in
        #10 a = 16'b1111111111111111; b = 16'b0000000000000000; c = 1; // 65535 + 0 with carry-in
        #10 a = 16'b0000000000000000; b = 16'b0000000000000000; c = 1; // 0 + 0 with carry-in

        // Finish simulation after 80 time units
        #80 $finish;
    end

    

endmodule
