`timescale 1ns / 1ps

module TB_SBM_233bit;

    // Inputs
    reg [232:0] a;
    reg [232:0] b;

    // Output
    wire [464:0] y;

    // Instantiate the Device Under Test (DUT)
    SBM_233bit dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Display the simulation results
        $monitor("Time = %0t | a = %h | b = %h | y = %h", $time, a, b, y);

        // Test case 1: Maximum inputs
        a = 233'h1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        b = 233'h1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        #10;

        // Test case 2: Alternating pattern inputs
        a = 233'h1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        b = 233'h1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEFFFFFF;
        #10;

        // Test case 3: Random values
         a = 233'h1FFFFFFFFFFFFFFFFFFFFFFFFEEFFFFFFFFFFFFFFFFFFFFFFFF;
        b = 233'h1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        #10;

        // Test case 4: One input is zero
        a = 233'h0;
        b = 233'h1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        #10;

        // Test case 5: Both inputs are zero
        a = 233'h0;
        b = 233'h0;
        #10;

        // Test case 6: Small values
        a = 233'h1;
        b = 233'h2;
        #10;

        // Test case 7: Large difference between inputs
        a = 233'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        b = 233'h1;
        #10;

        // End simulation
        $finish;
    end
endmodule
