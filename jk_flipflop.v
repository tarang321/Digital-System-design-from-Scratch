`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 19:53:02
// Design Name: 
// Module Name: jk_flipflop
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


module jk_flipflop(
    input j,
    input k,
    input clk,
    output reg q
    );
    initial 
    begin
    q=0;
    end
    always@(posedge clk)
    begin
    if( j == 0 && k == 0)
    begin
    q<=q;
    end
   else if( j == 0 && k == 1)
    begin
    q<=0;
    end
   else if( j == 1 && k == 0)
    begin
    q<=1;
    end
    else if( j == 1 && k == 0)
    begin
    q<=~q;
    end
    end
endmodule
