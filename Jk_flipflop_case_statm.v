`timescale 1ns / 1ps


module Jk_flipflop_case_statm(
    input j,
    input k,
    input clk,
    output reg q
    );
    initial
    begin
    q=0;
    end
    always@(posedge clk)
    begin
    case({j,k})
  
    2'b00: q = q;
    2'b01: q = 0;
    2'b10: q = 1;
    2'b11: q = ~q;
    endcase
    end
   
endmodule
