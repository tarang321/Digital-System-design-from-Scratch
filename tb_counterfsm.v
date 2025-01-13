`timescale 1ns / 1ps

module tb_counterfsm;

    // Inputs
    reg clk;
    reg din;
    reg reset;

    // Outputs
    wire [1:0] z;

    // Instantiate the counterfsm module
    counterfsm uut (
        .clk(clk),
        .din(din),
        .reset(reset),
        .z(z)
    );

    // Clock generation: Generate a clock with a period of 10ns
    always begin
        #5 clk = ~clk; // Toggle clock every 5ns
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        din = 0;
        reset = 0;

        // Apply reset
        reset = 1; // Assert reset
        #10 reset = 0; // De-assert reset

        // Apply input patterns to test the FSM
        #10 din = 1;  // State transition: s0 -> wait_a
        #10 din = 1;  // State transition: wait_a -> wait_b
        #10 din = 1;  // State transition: wait_b -> wait_c
        #10 din = 1;  // State transition: wait_c -> s0
        #10 din = 0;  // Remain in s0
        #10 din = 1;  // State transition: s0 -> wait_a
        #10 din = 1;  // State transition: wait_a -> wait_b
        #10 din = 0;  // Remain in wait_b (din = 0, no transition)
        #10 din = 1;  // State transition: wait_b -> wait_c
        #10 din = 1;  // State transition: wait_c -> s0

        // End simulation
        #10 $finish;
    end

    // Monitor output signals
    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | din: %b | z: %b", $time, clk, reset, din, z);
    end

    // Dump waveform for viewing
    initial begin
        $dumpfile("tb_counterfsm.vcd");
        $dumpvars(0, tb_counterfsm);
    end

endmodule
