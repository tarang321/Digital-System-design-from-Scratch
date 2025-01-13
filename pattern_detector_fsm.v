`timescale 1ns / 1ps


module pattern_detector_fsm(
    input wire din,
    input wire clk,
    input wire rst,
    output reg z
    );
    parameter Sin=3'b000,wait_a=3'b001,wait_a0=3'b010,wait_a01=3'b011,wait_a011=3'b111;
    reg[2:0] state, next_state;
    always @(posedge clk, posedge rst)
    begin
    if(rst==1)
    state<=Sin;
    else
    state <= next_state;
    end
    
    
    always @(din,state)
    begin
    case(state)
    
    
    Sin://state 0
    begin
    if(din==1)
    next_state=wait_a;
    else
    next_state= Sin;
    z=0;
    end
    
    
    wait_a://state`1
    begin
    if(din==0)
    next_state=wait_a0;
    else
    next_state= wait_a;
    z=0;
    end
    
    
    wait_a0://state 2
    begin
    if(din==1)
    next_state=wait_a01;
    else
    next_state= Sin;
    z=0;
    end
    
    
    wait_a01://state 3
    begin
    if(din==1)
    next_state=wait_a011;
    else
    next_state= wait_a0;
    z=0;
    end
    
    
    wait_a011://state4
    begin
    if(din==0)
    next_state=wait_a0;
    else
    next_state= wait_a;
    z=1;
    end
     default:
     next_state = Sin;
    endcase
    end
endmodule
