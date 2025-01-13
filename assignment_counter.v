`timescale 1ns / 1ps

module assignment_counter(
    input clk_2MHz,
    output reg pulse_10ms,
    output reg pulse_reset
);

    reg [14:0] counter1 = 0;  // 15-bit counter for 20,000 cycles
    reg [6:0] counter2 = 0;   // 7-bit counter for 100 pulses

    always @(posedge clk_2MHz) begin
               if (counter1 == 19999) begin
            counter1 <= 0;
            pulse_10ms <= 1;
        end else begin
            counter1 <= counter1 + 1;
            pulse_10ms <= 0;
        end
    end

    always @(posedge pulse_10ms) begin
        if (counter2 == 99) begin
            counter2 <= 0;
            pulse_reset <= 1;
        end else begin
            counter2 <= counter2 + 1;
            pulse_reset <= 0;
        end
    end
endmodule
