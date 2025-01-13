`timescale 1ns / 1ps

module dff_rst_clr_tb;

    reg d;
    reg clear;
    reg clk;
    reg en;
    wire q;
    
    dff_rst_clr uut (
        .d(d),
        .clear(clear),
        .clk(clk),
        .en(en),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        clear = 1;
        en = 0;
        d = 0;
        #10;
        
        clear = 0;
        en = 1;
        d = 1;
        #10;
        
        d = 0;
        #10;
        
        clear = 1;
        #10;
        
        clear = 0;
        en = 1;
        d = 1;
        #10;

        $stop;
    end
    
endmodule
