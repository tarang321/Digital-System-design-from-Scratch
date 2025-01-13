`timescale 1ns / 1ps

module counterfsm(
    input wire clk,
    input  wire din,
    input wire reset,
    output reg [1:0] z
    );
    reg [1:0] state;
    parameter s0=2'b00,wait_a=2'b01,wait_b=2'b10,wait_c=2'b11;
    
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
    state<=wait_a;
    else
    state<=s0;
    end
   
    wait_a:begin
    if(din==1)
    state<=wait_b;
    else
    state<=state;
    end
    
    wait_b:begin
    if(din==1)
    state<=wait_c;
    else
    state<=state;
    end
   
    wait_c:begin
    if(din==1)
    state<=s0;
    else
    state<=state;
    end
  endcase    
   end
   always@(posedge clk)
   begin
    z = state;
   end
endmodule
