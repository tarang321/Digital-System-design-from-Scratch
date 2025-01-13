`timescale 1ns / 1ps

module up_down_counter(
    input clk,
    input reset,
    input dir,
    output reg[3:0] count
    );
    always @(posedge (clk) or posedge (reset))
    begin
    if(reset==1)
         count<=0;
    else
       if(dir ==0)
          if(count==15)
          count<=0;
          else
          count <=count+1;
          
       else
       if(count==0)
       count<=15;
       else 
       count<=count-1;
       
  end
endmodule
