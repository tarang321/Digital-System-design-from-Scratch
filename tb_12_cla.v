`timescale 1ns / 1ps

module tb_conditional_sum_adder_12bit;

    // Inputs
    reg [11:0] A;    // First 12-bit operand
    reg [11:0] B;    // Second 12-bit operand
    reg Cin;         // Carry-in

    // Outputs
    wire [11:0] Sum; // 12-bit sum
    wire Cout;       // Carry-out

    // Instantiate the Conditional Sum Adder module
    conditional_sum_adder_12bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Testbench logic
    initial begin
        // Initialize inputs
        A = 12'b0; B = 12'b0; Cin = 0;

        // Apply test cases
        #10 A = 12'h123; B = 12'h456; Cin = 0;  // Test 1
        #10 A = 12'h123; B = 12'h456; Cin = 1;  // Test 2
        #10 A = 12'hFFF; B = 12'h001; Cin = 0;  // Test 3
        #10 A = 12'hFFF; B = 12'h001; Cin = 1;  // Test 4
        #10 A = 12'hAAA; B = 12'h555; Cin = 0;  // Test 5
        #10 A = 12'hAAA; B = 12'h555; Cin = 1;  // Test 6
        #10 A = 12'h000; B = 12'h000; Cin = 0;  // Test 7
        #10 A = 12'h000; B = 12'h000; Cin = 1;  // Test 8
        #10 A = 12'h800; B = 12'h800; Cin = 0;  // Test 9
        #10 A = 12'h800; B = 12'h800; Cin = 1;  // Test 10

        // End simulation
        #10 $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time = %0dns, A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b",
                 $time, A, B, Cin, Sum, Cout);
    end

endmodule
