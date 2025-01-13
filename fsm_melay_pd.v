`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2024 06:12:43
// Design Name: 
// Module Name: fsm_melay_pd
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


module fsm_melay_pd(
    input wire din,
    input wire clk,
    input wire rst,
    output reg z
    );
    parameter sin=2'b00,s1=2'b01,s10=2'b10,s101=2'b11;
    reg [1:0] state, next_state;
    always @(posedge clk, posedge rst)
    begin
    if(rst==1)
    state<=sin;
    else
    state<=next_state;
    end
    always@(state,din)
     begin
     case(state)
     sin:
     begin
     if(din==1)
     next_state=s1;
     else
     next_state=sin;
     end
     s1:
     begin
     if(din==1)
     next_state=s1;
     else
     next_state=s10;
     end
     s10:
     begin 
     if(din==1)
     next_state=s101;
     else
     next_state=sin;
     end
     s101:
     begin
     if(din==1)
     next_state=s1;
     else
     next_state=s10;
    end
     
     default:
     next_state = sin;
     endcase
     end
     
     //output declaration
     always @(state,din)
     begin
     case(state)
     sin:z=0;
     s1:z=0; 
     s10:z=0;
     s101:
     begin
     if(din==1)
     z=1;
     else z=0;
     end
     
     default:
     z=0;
     endcase
     end
endmodule
