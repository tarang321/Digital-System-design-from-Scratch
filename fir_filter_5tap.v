`timescale 1ns / 1ps

module fir_filter_5tap (
    input clk,                    // Clock signal
    input reset,                  // Reset signal
    input signed [15:0] x_in,     // Input sample
    output reg signed [31:0] y_out // Filter output
);

    // Define filter coefficients
    parameter signed [15:0] h0 = 16'd10;
    parameter signed [15:0] h1 = 16'd20;
    parameter signed [15:0] h2 = 16'd30;
    parameter signed [15:0] h3 = 16'd20;
    parameter signed [15:0] h4 = 16'd10;

    // Registers for each tap (delay line for inputs)
    reg signed [15:0] x_reg0, x_reg1, x_reg2, x_reg3, x_reg4;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all registers to zero
            x_reg0 <= 16'd0;
            x_reg1 <= 16'd0;
            x_reg2 <= 16'd0;
            x_reg3 <= 16'd0;
            x_reg4 <= 16'd0;
            y_out <= 32'd0;
        end else begin
            // Shift input samples manually
            x_reg4 <= x_reg3;
            x_reg3 <= x_reg2;
            x_reg2 <= x_reg1;
            x_reg1 <= x_reg0;
            x_reg0 <= x_in;

            // Perform the FIR filter operation without a loop
            y_out <= h0 * x_reg0 + h1 * x_reg1 + h2 * x_reg2 + h3 * x_reg3 + h4 * x_reg4;
        end
    end
endmodule
