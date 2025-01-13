`timescale 1ns / 1ps

module T_flipflop_tb;

    reg clk;
    reg t;
    wire q;
    
    T_flipflop uut (
        .clk(clk),
        .t(t),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        t = 0;
        #10;
        
        t = 1;
        #10;
        
        t = 0;
        #10;
        
        t = 1;
        #10;
        
        $stop;
    end
    
endmodule
