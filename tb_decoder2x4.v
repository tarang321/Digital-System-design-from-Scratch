`timescale 1ns / 1ps

module tb_decoder2x4(

    );
    reg e,d0,d1;
    wire y0,y1,y2,y3;
    deco_2_4 d(e,d0,d1,y0,y1,y2,y3);
    initial begin
    e=0;d0=1;d1=0;
    #10 e=0;d0=1;d1=0;
     #10 e=1;d0=1;d1=0; 
     #10 e=0;d0=0;d1=1;
      #10 e=1;d0=0;d1=1;
       #10 e=0;d0=1;d1=1;
        #10 e=1;d0=1;d1=1;
        #10 $finish;
     
    end
    
    
    
endmodule
