`timescale 1ns / 1ps
module r_carry_adder(
    input [3:0] a,
    input [3:0] b,
    input c,
    output [3:0] sum,
    output cout
    );
    wire c1, c2,c3;
        full_addr d0( a[0],b[0],c,c1,sum[0]);
        full_addr d1( a[1],b[1],c1,c2,sum[1]);
        full_addr d2( a[2],b[2],c2,c3,sum[2]);
        full_addr d3( a[3],b[3],c3,cout,sum[3]);
endmodule
