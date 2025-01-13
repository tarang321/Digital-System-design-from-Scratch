`timescale 1ns / 1ps

module Reg_pipo_tb;

    reg [3:0] d;
    reg [1:0] ctrl;
    reg clr;
    reg xl;
    reg xr;
    wire [3:0] q;

    Reg_pipo uut (
        .d(d),
        .ctrl(ctrl),
        .clr(clr),
        .xl(xl),
        .xr(xr),
        .q(q)
    );

    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        clr = 1; xl = 0; xr = 0; d = 4'b0000; ctrl = 2'b00;
        #10 clr = 0;
        
        #10 d = 4'b1010; ctrl = 2'b00;
        #10 ctrl = 2'b01;
        #10 ctrl = 2'b10;
        #10 ctrl = 2'b00;
        #10 d = 4'b1111; ctrl = 2'b00;
        #10 clr = 1;
        #10 clr = 0; xl = 1;
        #10 ctrl = 2'b00;
        #10 xr = 1;
        #10 $stop;
    end

endmodule
