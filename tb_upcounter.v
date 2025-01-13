`timescale 1ns / 1ps


module tb_upcounter();
reg clk,reset;
wire [3:0]count;

up_counter c(clk,reset,count);
initial begin

clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
#10 reset=0;


#200 $finish;
end
endmodule

