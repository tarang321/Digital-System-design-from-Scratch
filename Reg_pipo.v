`timescale 1ns / 1ps
module Reg_pipo(
    input [3:0] d,
    input [1:0] ctrl,
    input clr,
    input xl,
    input xr,
    output [3:0] q
    );
    wire [3:0] s;
    Mux4x1 m1(q[0],xl,q[1],d[0],ctrl[1],ctrl[0],s[0]);
    Mux4x1 m2(q[1],q[0],q[2],d[1],ctrl[1],ctrl[0],s[1]);
    Mux4x1 m3(q[2],q[1],q[3],d[2],ctrl[1],ctrl[0],s[2]);
    Mux4x1 m4(q[3],q[2],xr,d[3],ctrl[1],ctrl[0],s[3]);
    
    DFF_clr d1(s[0],clr,clk,q[0]);
    DFF_clr d2(s[1],clr,clk,q[1]);
    DFF_clr d3(s[2],clr,clk,q[2]);
    DFF_clr d4(s[3],clr,clk,q[3]);
endmodule
