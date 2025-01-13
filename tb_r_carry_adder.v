`timescale 1ns / 1ps

module tb_r_carry_adder;

    reg [3:0] a;
    reg [3:0] b;
    reg c;
    wire [3:0] sum;
    wire cout;

    r_carry_adder uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test Case 1
        a = 4'b0000; b = 4'b0000; c = 1'b0;
        #10;
        
        // Test Case 2
        a = 4'b0101; b = 4'b0011; c = 1'b0;
        #10;
        
        // Test Case 3
        a = 4'b1111; b = 4'b1111; c = 1'b0;
        #10;
        
        // Test Case 4
        a = 4'b1010; b = 4'b0101; c = 1'b1;
        #10;
        
        // Test Case 5
        a = 4'b1100; b = 4'b1010; c = 1'b1;
        #10;

        $stop; // End simulation
    end

endmodule
