`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 06:35:00
// Design Name: 
// Module Name: Class_counter
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


module Class_counter(
    input inc,
    input dec,
   input rst,
   input clk,
    output reg [3:0] count
       );
  wire en;
  reg [3:0]mux;
  always@(*)
  begin
    case(inc)
    1'b0:mux=count-1;
    1'b1:mux=count+1;
   endcase
   end  
   assign en= inc^dec;
   always @(posedge clk)
   begin
   if(rst)
   count<=0;
   else if(en)
   count<=mux;
   end
  
endmodule
