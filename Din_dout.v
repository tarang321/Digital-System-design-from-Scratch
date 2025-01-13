`timescale 1ns / 1ps


module Din_dout(
    input a,
    input b,
    input c,
    input d,
    input s1,
    input s2,
    output o1,
    output o2,
    output o3,
    output o4
    );
    wire line;
    Mux4x1 m1(a,b,c,d,s1,s2,line);
    demux_4x1 d1(line,s2,s1,o1,o2,o3,o4);
endmodule
