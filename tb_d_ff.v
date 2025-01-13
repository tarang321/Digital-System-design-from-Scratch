`timescale 1ns / 1ps

module d_flipflop_tb;

    reg D;
    reg clk;
    wire Q;
    
    d_flipflop uut (
        .D(D),
        .clk(clk),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        D = 0;
        #10;
        
        D = 1;
        #10;
        
        D = 0;
        #10;
        
        D = 1;
        #10;
        
        $stop;
    end
    
endmodule
