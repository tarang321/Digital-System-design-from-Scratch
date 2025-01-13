`timescale 1ns / 1ps

module Din_dout_tb;

    reg a;
    reg b;
    reg c;
    reg d;
    reg s1;
    reg s2;
    wire o1;
    wire o2;
    wire o3;
    wire o4;

    Din_dout uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s1(s1),
        .s2(s2),
        .o1(o1),
        .o2(o2),
        .o3(o3),
        .o4(o4)
    );

    initial begin
        a = 0; b = 0; c = 0; d = 0; s1 = 0; s2 = 0;
        #10 a = 1; s1 = 0; s2 = 0;
        #10 b = 1; s1 = 0; s2 = 1;
        #10 c = 1; s1 = 1; s2 = 0;
        #10 d = 1; s1 = 1; s2 = 1;
        #10 a = 0; b = 0; c = 0; d = 0;
        #10 $stop;
    end

endmodule
