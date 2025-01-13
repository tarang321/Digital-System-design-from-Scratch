`timescale 1ns / 1ps

module tb_pattern_detector_fsm;

    // Inputs
    reg din;        // Input data
    reg clk;        // Clock signal
    reg rst;        // Reset signal

    // Outputs
    wire z;         // Output signal

    // Instantiate the pattern_detector_fsm module
    pattern_detector_fsm uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .z(z)
    );

    // Clock Generation: Generate clock with a period of 10ns (100MHz)
    always begin
        #5 clk = ~clk;  // Clock period of 10ns
    end

    // Test vector generation
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        din = 0;

        // Apply reset
        rst = 1;
        #10 rst = 0;

        // Apply test vectors (input pattern for sequence 1011)
        #10 din = 1;  // Din = 1, state goes to wait_a
        #10 din = 0;  // Din = 0, state goes to wait_a0
        #10 din = 1;  // Din = 1, state goes to wait_a01
        #10 din = 1;  // Din = 1, state goes to wait_a011
        #10 din = 0;  // Din = 0, state goes back to wait_a0, z should be 1 (Pattern detected)
        #10 din = 1;  // Din = 1, state goes to wait_a
        #10 din = 0;  // Din = 0, state goes to wait_a0
        #10 din = 1;  // Din = 1, state goes to wait_a01
        #10 din = 1;  // Din = 1, state goes to wait_a011, z should be 1 (Pattern detected)

        // Finish simulation
        #10 $finish;
    end

   

endmodule
