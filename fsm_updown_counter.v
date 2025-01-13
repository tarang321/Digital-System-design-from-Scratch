`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2024 05:29:09
// Design Name: 
// Module Name: fsm_updown_counter
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


module fsm_updown_counter(
input wire clk,
    input  wire din,
    input wire reset,
    output reg [1:0] z
    );
    reg [1:0] state;
    parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
    
    always @(posedge clk)
    begin
    if(reset ==1)
        state<=s0;
        else
        state<=state;
    end
 
    always @(posedge clk)
    begin
    
    case(state)
   
    s0:begin
    if(din==1)
    state<=s1;
    else
    state<=s3;
    end
   
    s1:begin
    if(din==1)
    state<=s2;
    else
    state<=s0;
    end
    
    s2:begin
    if(din==1)
    state<=s3;
    else
    state<=s1;
    end
   
    s3:begin
    if(din==1)
    state<=s0;
    else
    state<=s2;
    end
  endcase    
   end
   always@(posedge clk)
   begin
    z = state;
   end
endmodule