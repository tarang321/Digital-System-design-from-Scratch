`timescale 1ns / 1ps


module rca_6b(
  input [5:0] a,
    input [5:0] b,
    input c,
    output [5:0] sum,
    output cout
    );
    wire c1, c2,c3,c4,c5;
        full_addr d0( a[0],b[0],c,c1,sum[0]);
        full_addr d1( a[1],b[1],c1,c2,sum[1]);
        full_addr d2( a[2],b[2],c2,c3,sum[2]);
        full_addr d3( a[3],b[3],c3,c4,sum[3]);
        full_addr d4( a[4],b[4],c4,c5,sum[4]);
        full_addr d5( a[5],b[5],c5,cout,sum[5]);
endmodule
