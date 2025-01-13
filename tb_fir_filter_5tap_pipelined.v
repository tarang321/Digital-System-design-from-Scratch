`timescale 1ns / 1ps

module tb_fir_filter_5tap_pipelined;

    // Inputs
    reg clk;                    // Clock signal
    reg reset;                  // Reset signal
    reg signed [15:0] x_in;     // Input sample

    // Outputs
    wire signed [31:0] y_out;   // Filter output

    // Instantiate the fir_filter_5tap_pipelined module
    fir_filter_5tap_pipelined uut (
        .clk(clk),
        .reset(reset),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock Generation: Generate clock with a period of 10ns (100MHz)
    always begin
        #5 clk = ~clk;  // Clock period of 10ns
    end

    // Test vector generation
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        x_in = 16'd0;

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Apply test vectors (input samples)
        #10 x_in = 16'd5;   // Input sample: 5
        #10 x_in = 16'd10;  // Input sample: 10
        #10 x_in = 16'd15;  // Input sample: 15
        #10 x_in = 16'd20;  // Input sample: 20
        #10 x_in = 16'd25;  // Input sample: 25
        #10 x_in = 16'd30;  // Input sample: 30
        #10 x_in = 16'd35;  // Input sample: 35
        #10 x_in = 16'd40;  // Input sample: 40
        #10 x_in = 16'd45;  // Input sample: 45

        // Finish simulation
        #10 $finish;
    end

    // Monitor the signals to check the result
    initial begin
        $monitor("Time: %0t, x_in: %d, y_out: %d", $time, x_in, y_out);
    end

    // Initialize the simulation and create a waveform for viewing
    initial begin
        $dumpfile("tb_fir_filter_5tap_pipelined.vcd");
        $dumpvars(0, tb_fir_filter_5tap_pipelined);
    end

endmodule
