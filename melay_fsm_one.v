`timescale 1ns / 1ps

module melay_fsm_one(//moore machine
    input wire clk,
    input  wire din,
    input wire reset,
    output reg [1:0] z
    );
    reg [1:0] state;
   // reg [1:0]next_state;
    parameter ideal=2'd0,wait_a=2'd1,wait_b=2'd2,wait_c=2'd3;
    
     always @(posedge clk)
    begin
    if(reset ==1)
        state<=ideal;
        else
        state<=state;
    end
 
    always @(posedge clk)
    begin
    
    case(state)
   
    ideal:begin
    if(din==1)
    state<=wait_a;
    else
    state<=ideal;
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
    state<=ideal;
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
