`timescale 1ns / 1ps
module X1_mux(
    input a,
    input b,
    input S,//select line
    output Y
    );
    reg y;

       assign Y = (a&(~S))|(b&S);

endmodule
