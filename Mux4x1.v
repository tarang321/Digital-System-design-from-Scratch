`timescale 1ns / 1ps

module Mux4x1(
    input i0,
    input i1,
    input i2,
    input i3,
    input ideal,//select line
    input wait_a,//select line
    output y
    );
    wire p,q;
    X1_mux d0(i0,i1,ideal,p);
    X1_mux d1(i2,i3,ideal,q);
    X1_mux d2(p,q,wait_a,y);
endmodule
