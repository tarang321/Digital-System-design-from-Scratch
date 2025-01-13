`timescale 1ns / 1ps

module tb_full_addrrr();
reg a,b,c;
wire co,s;
full_addr d0(a,b,c,co,s);
initial begin
#10 a=0;b=0;c=0;
#10 a=0;b=0;c=1;
#10 a=0;b=1;c=0;
#10 a=0;b=1;c=1;
#10 a=1;b=0;c=0;
#10 a=1;b=0;c=1;
#10 a=1;b=1;c=0;
#10 a=1;b=1;c=1;
#10 a=0;b=0;c=0;
#10 $finish;
end
endmodule
