`timescale 1ns / 1ps


module full_addr(
    input wire a, b, cin,
    output wire cout, sum);
    assign cout = (cin&(a^b))| (a&b) ;
    assign sum = a^b^cin;
endmodule
