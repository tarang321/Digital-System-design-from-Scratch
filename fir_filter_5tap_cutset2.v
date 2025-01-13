`timescale 1ns / 1ps

module fir_filter_5tap_cutset2 (
    input clk,                     // Clock signal
    input reset,                   // Reset signal
    input signed [15:0] x_in,      // Input sample
    output reg signed [31:0] y_out // Filter output
);

    // Define filter coefficients
    parameter signed [15:0] h0 = 16'd10;
    parameter signed [15:0] h1 = 16'd20;
    parameter signed [15:0] h2 = 16'd30;
    parameter signed [15:0] h3 = 16'd20;
    parameter signed [15:0] h4 = 16'd10;

    // Registers for delay line (input samples)
    reg signed [15:0] x_reg0, x_reg1, x_reg2, x_reg3, x_reg4;

    // Intermediate multiplication results
    wire signed [31:0] mul0, mul1, mul2, mul3, mul4;

    // Pipeline register to store the sum of first stage (cutset 2 between coefficients)
    reg signed [31:0] sum_stage1;

    // Multiply each input sample with its corresponding coefficient
    assign mul0 = x_reg0 * h0;
    assign mul1 = x_reg1 * h1;
    assign mul2 = x_reg2 * h2;
    assign mul3 = x_reg3 * h3;
    assign mul4 = x_reg4 * h4;

    // Update delay line with new input sample
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x_reg0 <= 16'd0;
            x_reg1 <= 16'd0;
            x_reg2 <= 16'd0;
            x_reg3 <= 16'd0;
            x_reg4 <= 16'd0;
        end else begin
            x_reg4 <= x_reg3;
            x_reg3 <= x_reg2;
            x_reg2 <= x_reg1;
            x_reg1 <= x_reg0;
            x_reg0 <= x_in;
        end
    end

    // First stage: Accumulate partial products for the first three coefficients (h0, h1, h2)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sum_stage1 <= 32'd0;
        end else begin
            sum_stage1 <= mul0 + mul1 + mul2;
        end
    end

    // Second stage: Accumulate the remaining products with the result of the first stage
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            y_out <= 32'd0;
        end else begin
            y_out <= sum_stage1 + mul3 + mul4;
        end
    end
endmodule
