`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 21:19:03
// Design Name: 
// Module Name: DFF_clr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DFF_clr(
    input d,
    input clear,
    input clk,
    output reg q
    );
    always @(posedge clk)
    begin
    if(clear == 1)
    q=1'b0;
    else 
    q = d;
    end
endmodule
