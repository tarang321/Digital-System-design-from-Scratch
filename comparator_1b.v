`timescale 1ns / 1ps

module comparator_1b(
    input a,
    input b,
    output g,
    output s,
    output e
    );
    assign g= (a&~b);
    assign s= (~a&b);
    assign e= (a~^b);
endmodule
