`timescale 1ns / 1ps


module tb_deco3_8();
 reg e,a,b,c;
    wire y0,y1,y2,y3,y4, y5,y6, y7;
    deco_328 d(e,a,b,c,y0,y1,y2,y3,y4, y5,y6, y7);
     initial begin
    e=0;a=1;b=0;c=0;
     #10e=0;a=1;b=0;c=1;
    #10 e=0;a=1;b=0;c=1;
    #10 e=0;a=1;b=0;c=0;
     #10 e=1;a=1;b=0;c=1; 
     #10 e=1;a=1;b=0;c=0;
     #10 e=0;a=0;b=1;c=1;
     #10 e=0;a=0;b=1;c=0;
      #10 e=1;a=0;b=1;c=1;
      #10 e=1;a=0;b=1;c=0;
       #10 e=0;a=1;b=1;c=1;
        #10 e=0;a=1;b=1;c=0;
        #10 e=1;a=1;b=1;c=1;
        #10 e=1;a=1;b=1;c=0;
        #10 $finish;
     end
endmodule
