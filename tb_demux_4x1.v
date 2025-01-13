`timescale 1ns / 1ps

module tb_demux_4x1();
reg x,wait_a,ideal;
   wire y0,y1,y2,y3;
   demux_4x1 dm(x,wait_a,ideal,y0,y1,y2,y3);
   initial begin
   x=1;wait_a=0;ideal=1;
   #10 x=0;wait_a=0;ideal=1;
     #10 x=1;wait_a=1;ideal=1;
       #10 x=0;wait_a=1;ideal=0;
         #10 x=1;wait_a=0;ideal=1;
           #10 x=1;wait_a=0;ideal=1;
   #10 $finish;
   end
endmodule
