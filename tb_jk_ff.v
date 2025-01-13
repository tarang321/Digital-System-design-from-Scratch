`timescale 1ns / 1ps

module Jk_flipflop_case_statm_tb;

    reg j;
    reg k;
    reg clk;
    wire q;
    
    Jk_flipflop_case_statm uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        j = 0;
        k = 0;
        #10;
        
        j = 1;
        k = 0;
        #10;
        
        j = 0;
        k = 1;
        #10;
        
        j = 1;
        k = 1;
        #10;
        
        j = 0;
        k = 0;
        #10;
        
        $stop;
    end
    
endmodule
