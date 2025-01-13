`timescale 1ns / 1ps

module T_flipflop(
    input clk,
    input t,
    output reg q
    );
    initial
    begin
    q=0;
    end
    always@(posedge clk)
    begin
    if (t==0)
    begin
    q = q;
    end
    else
    begin
    q = ~q;
    end
    
    end
endmodule
