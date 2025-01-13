`timescale 1ns / 1ps


module SISO_flipflop(
    input din,
    input clk,
    input rst,
        output dout
    );
    wire [2:0]s;
    
    DFF_clr d1(din,rst,clk,s[0]);
    DFF_clr d2(s[0],rst,clk,s[1]);
    DFF_clr d3(s[1],rst,clk,s[2]);
    DFF_clr d4(s[2],rst,clk,dout);
    
endmodule
