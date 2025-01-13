`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 16:36:10
// Design Name: 
// Module Name: fifo
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


module fifo(
input [7:0]din,
input push,
input pop,
input clk,
input  enable,
output [7:0]dout,
output full,
output empty,
output half_full
   );
   wire [1:0]y;
   wire temp0,temp1,temp2,temp3;
   Class_counter c0(push,pop,enable,clk,y);
   SIPO_4bit ideal(din,clk,y,temp0);
   SIPO_4bit ideal1(temp0,clk,y,temp1);
   SIPO_4bit ideal2(temp1,clk,y,temp2);
   SIPO_4bit ideal3(temp2,clk,y,temp3);
   Mux4x1 m0(temp0,temp1,temp2,temp3,y[1],y[0],dout);

  comparator_1b count(push,pop,full,empty,half_full);



endmodule



