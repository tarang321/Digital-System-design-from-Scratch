`timescale 1ns / 1ps

module tb_updown_counter();
reg clk,reset,dir;
wire [3:0]count;

up_down_counter c(clk,reset,dir,count);
initial begin

clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
#10 reset=0;
 dir=0;
#100 dir=1;



#200 $finish;
end
endmodule
