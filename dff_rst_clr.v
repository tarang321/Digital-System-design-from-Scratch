`timescale 1ns / 1ps

module dff_rst_clr(
    input d,
    input clear,
    input clk,
    input en,
    output reg q
    );
    always @(posedge clk)
    begin
    if(clear == 1)
    q=1'b0;
    else if (en==1)
    q=d;
    end
endmodule
