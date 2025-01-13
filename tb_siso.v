`timescale 1ns / 1ps

module SISO_flipflop_tb;

    reg din;
    reg clk;
    reg rst;
    wire dout;

    SISO_flipflop uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10 rst = 0;
        din = 0;
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 1;
        #10 rst = 1; // Reset to clear the flip-flops
        #10 rst = 0; din = 0;
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 $stop;
    end

endmodule
