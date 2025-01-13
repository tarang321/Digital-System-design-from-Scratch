`timescale 1ns / 1ps

module tb_conditional_sum_adder_16bit;

    // Testbench signals
    reg [15:0] A;       // 16-bit input A
    reg [15:0] B;       // 16-bit input B
    reg Cin;            // Carry input
    wire [15:0] Sum;    // 16-bit Sum output
    wire Cout;          // Carry output

    // Instantiate the 16-bit CSA
    conditional_sum_adder_16bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Task for stimulus
    task apply_test;
        input [15:0] tA, tB;
        input tCin;
        reg [16:0] expected; // For Sum and Carry (Sum + Cout)
        begin
            A = tA;
            B = tB;
            Cin = tCin;

            // Wait for one time unit to simulate
            #10;

            // Calculate expected result
            expected = tA + tB + tCin;

            // Check the outputs
            if ((Sum == expected[15:0]) && (Cout == expected[16]))
                $display("PASS: A=%h, B=%h, Cin=%b => Sum=%h, Cout=%b", tA, tB, tCin, Sum, Cout);
            else
                $display("FAIL: A=%h, B=%h, Cin=%b => Sum=%h (Exp=%h), Cout=%b (Exp=%b)", 
                          tA, tB, tCin, Sum, expected[15:0], Cout, expected[16]);
        end
    endtask

    // Test stimulus
    initial begin
        // Test cases
        apply_test(16'h0000, 16'h0000, 1'b0); // Test with all zeros
        apply_test(16'hFFFF, 16'h0001, 1'b0); // Test max + min values
        apply_test(16'hAAAA, 16'h5555, 1'b0); // Test alternating bits
        apply_test(16'h1234, 16'h5678, 1'b0); // Random values
        apply_test(16'h1234, 16'h5678, 1'b1); // Random values with carry-in
        apply_test(16'hFFFF, 16'hFFFF, 1'b1); // Maximum possible values

        // Add additional test cases as needed
        $stop; // End simulation
    end

endmodule
