`timescale 1ns / 1ps


module tb_comparator_1b( );
reg a,b;
wire g,s,e;
comparator_1b c(a,b,g,s,e);
initial begin
a=0;b=0;
#10 a=1;b=0;
#10 a=0;b=0;
#10 a=0;b=1;
#10 a=1;b=0;
#10 $finish;
end
endmodule

