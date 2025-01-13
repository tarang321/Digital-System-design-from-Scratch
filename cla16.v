`timescale 1ns / 1ps

module Cla_16b(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire c,      // Carry-in for the first block
    output wire [15:0] s, // 16-bit sum
    output wire carry    // Final carry-out
    );

    // Intermediate carries for each 4-bit CLA block
    wire [3:0] cr;

    // Instantiate four 4-bit CLA blocks
    Cla_4b c0(a[3:0], b[3:0], c, s[3:0], cr[0]);    // CLA for a[3:0], b[3:0]
    Cla_4b c1(a[7:4], b[7:4], cr[0], s[7:4], cr[1]); // CLA for a[7:4], b[7:4]
    Cla_4b c2(a[11:8], b[11:8], cr[1], s[11:8], cr[2]); // CLA for a[11:8], b[11:8]
    Cla_4b c3(a[15:12], b[15:12], cr[2], s[15:12], cr[3]); // CLA for a[15:12], b[15:12]

    // Calculate final carry-out using carry-out from the last CLA block
    assign carry = cr[3];
    
endmodule

module Cla_4b(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire c,          // Carry-in
    output reg [3:0] s,    // Sum
    output reg carry       // Carry-out
    );
    reg [3:0] p, g;       // Propagate and Generate signals
    reg [3:0] ci;         // Carry signals for each bit
    integer i;

    always @(*) begin
        // Compute propagate and generate signals
        for(i = 0; i < 4; i = i + 1) begin
            p[i] = a[i] ^ b[i]; // Propagate
            g[i] = a[i] & b[i]; // Generate
        end

        // Compute carries for each bit
        ci[0] = c;
        ci[1] = g[0] | (p[0] & ci[0]);
        ci[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci[0]);
        ci[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci[0]);
        
        // Final carry-out
        carry = g[3] | (p[3] & ci[3]);

        // Compute sum bits
        for(i = 0; i < 4; i = i + 1) begin
            s[i] = ci[i] ^ p[i]; // Sum bit is carry XOR propagate
        end
    end
endmodule
