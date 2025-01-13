`timescale 1ns / 1ps

module demux_4x1(
    input x,
    input wait_a,//select line
    input ideal,//select line
    output y0,
    output y1,
    output y2,
    output y3
    );
    assign y0 = (x&(~ideal)&(~wait_a));
    assign y1 = (x&(~ideal)&(wait_a));
    assign y2 = (x&(ideal)&(~wait_a));
    assign y3 = (x&(ideal)&(wait_a));
endmodule
