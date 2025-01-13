`timescale 1ns / 1ps

module Sr_flipflop_tb;
    
    reg s;
    reg r;
    reg clk;
    wire q;
    wire q_bar;
    
    Sr_flipflop uut (
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        s = 0; r = 0;
        #10 s = 1; r = 0;
        #10 s = 0; r = 1;
        #10 s = 1; r = 1;
        #10 s = 0; r = 0;
        #10 s = 1; r = 0;
        #10 s = 0; r = 1;
        #10 s = 1; r = 1;
        #10 s = 0; r = 0;
        #10 $stop;
    end
    
endmodule
