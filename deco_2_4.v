`timescale 1ns / 1ps


module deco_2_4(
    input e,
    input d0,
    input d1,
    output y0,
    output y1,
    output y2,
    output y3
    );
    assign y0=e&(~d0)&(~d1);
    assign y1=e&(~d0)&(d1);
    assign y2=e&(d0)&(~d1);
    assign y3=e&(d0)&(d1);
endmodule
