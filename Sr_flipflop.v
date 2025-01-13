`timescale 1ns / 1ps


module Sr_flipflop(
    input s,
    input r,
    input clk,
    output reg q,
    output reg q_bar
    );
    always @(posedge clk)
    begin
    if (s==1&r==0)
    begin
    q<=1;
    q_bar=0;
    end
   else if (s==0&r==1)
    begin
    q<=0;
    q_bar=1;
    end
     else if (s==0&r==1)
    begin
    q<=q;
    q_bar=q_bar;
    end
    end
endmodule
