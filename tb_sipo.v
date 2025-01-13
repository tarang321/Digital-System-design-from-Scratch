`timescale 1ns / 1ps

module SIPO_4bit_tb;

    reg din;
    reg clk;
    reg load;
    wire [3:0] q;

    SIPO_4bit uut (
        .din(din),
        .clk(clk),
        .load(load),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        din = 0; load = 0;
        #10 load = 1; din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 1;
        #10 load = 0;
        #10 load = 1; din = 0;
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 $stop;
    end

endmodule
