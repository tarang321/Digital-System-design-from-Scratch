`timescale 1ns / 1ps

module tb_Mux_2x1();
    reg a;
    reg b;
    reg s;
    wire Y;
    X1_mux m0(a,b,s,Y);
initial begin
#10 a=1; b=0; s=0;
#10 a=1; b=0; s=1;
#10 a=1; b=1; s=0;
#10 a=1; b=1; s=1;
#10 a=0; b=0; s=0;
#10 a=0; b=0; s=1;
#10 a=0; b=1; s=0;
#10 $finish;
end
    
endmodule
