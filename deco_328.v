`timescale 1ns / 1ps

module deco_328(
    input e,
    input a,
    input b,
    input c,
    output y0,
    output y1,
    output y2,
    output y3,
    output y4,
    output y5,
    output y6,
    output y7
    );
    wire p,q;
    deco_2_4 d0 (e,c,0,p,q);
    deco_2_4 d1 (p,a,b,yo,y1,y2,y3);
    deco_2_4 d2 (q,a,b,y4,y5,y6,y7);
    
endmodule
