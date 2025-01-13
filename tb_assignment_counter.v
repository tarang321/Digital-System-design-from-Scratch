`timescale 1ns / 1ps


module tb_assignment_counter();
`timescale 1ns/1ps
    reg clk_2MHz;
      wire pulse_10ms;
    wire pulse_reset;
   assignment_counter uut (
        .clk_2MHz(clk_2MHz),
        .pulse_10ms(pulse_10ms),
        .pulse_reset(pulse_reset)
    );
    initial begin
        clk_2MHz = 0;
        forever #250 clk_2MHz = ~clk_2MHz;  // Toggle clock every 250ns to create 2 MHz
    end
    initial begin
        #110000000;  // Simulate for 110 ms (to cover more than 100 pulses)
        $finish;  // Stop 
    end
endmodule


