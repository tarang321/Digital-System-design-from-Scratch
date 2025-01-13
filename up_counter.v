`timescale 1s / 1ms


module up_counter(
input clk,
    input reset,
    output reg[3:0] count

    );
   
    always @(posedge (clk) or posedge (reset))
    begin

    if(reset==1)
         count<=0;
    else
          if(count==15)
          count<=0;
          else
          count <=count+1;                   
  end
endmodule

