`timescale 1ns / 1ps


module cla_tb();
reg [3:0]a;
reg[3:0]b;
reg c;
wire  [3:0]s;
wire carry;
Cla_4b addr(a, b, c, s, carry);
initial 

begin
a=4'b1000; b=4'b0011; c=1'b0;
#10 a=4'b0011; b=4'b1010; c=1'b1;
#10 a=4'b1011; b=4'b1010; c=1'b0;
#10 a=4'b1101; b=4'b1110; c=1'b1;
#10 a=4'b0011; b=4'b1010; c=1'b0;
#10 a=4'b0011; b=4'b1010; c=1'b0;
#10 a=4'b0011; b=4'b1010; c=1'b1;
#10 $finish;
end
endmodule
