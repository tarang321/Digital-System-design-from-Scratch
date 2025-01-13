`timescale 1ns / 1ps

module SIPO_4bit(
    input din,
    input clk,
    input load,
    output [3:0] q
    );
    reg [3:0] temp;
    always@(posedge clk)
    begin
    if (load == 0)
    temp=temp;
    else
    temp = {temp[2:0],din};
    end
    assign q=temp;
endmodule
 