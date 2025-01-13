`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2024 05:58:29
// Design Name: 
// Module Name: Gray_binary
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


module Gray_binary(
    output [2:0] b0,
    input [2:0] g1
    );
    assign b0[2]=g1[2];
    assign b0[1]=g1[2]^g1[1];
    assign b0[0]=g1[2]^g1[1]^g1[0];
       
endmodule
