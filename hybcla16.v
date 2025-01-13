`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 04:29:49
// Design Name: 
// Module Name: hybcla16
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


module hybcla16(
input [11:0] a,
    input [11:0] b,
    input c,
    output [11:0] s,
    output carry
    );
    wire [3:0]cr;
 Cla_4b c0(a[3:0],b[3:0],c,s[3:0],cr[0]);   
 Cla_4b c1(a[7:4],b[7:4],c,s[7:4],cr[1]); 
 Cla_4b c2(a[11:8],b[11:8],c,s[11:8],cr[2]); 
 
endmodule



