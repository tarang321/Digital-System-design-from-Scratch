`timescale 1ns / 1ps


module tb_ha_datafloooo( );
reg a,b;
wire s,c;
half_adder_dataflo d0(a,b,s,c);
initial begin
#10 a=1; b=0;
#10 a=1; b=1;
#10 a=0; b=0;
#10 a=0; b=1;
#10 $finish;

end
endmodule
