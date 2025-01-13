`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 18:02:51
// Design Name: 
// Module Name: clock_div
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


module clock_div(
input clk,
    input reset,
    output integer count
    );
     always @(posedge (clk) or posedge (reset))
    begin
    count<=count+1;
    if(count==500000000)
    begin
   assign clk = ~clk;
    end
    
    end
   endmodule