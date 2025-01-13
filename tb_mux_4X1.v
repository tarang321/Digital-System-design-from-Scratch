`timescale 1ns / 1ps

module tb_mux_4X1( );
    reg i0,i1,i2,i3,s,wait_a;
    wire y;
    Mux4x1 m0(i0,i1,i2,i3,s,wait_a,y);
    initial begin
    #10 i0=1; i1=0; i2=0; i3=1; s=0;wait_a=0;
    #10 i0=1; i1=0; i2=0; i3=1; s=0;wait_a=1;
    #10 i0=1; i1=0; i2=0; i3=1; s=1;wait_a=0;
    #10 i0=1; i1=1; i2=1; i3=0; s=1;wait_a=0;
    #10 i0=1; i1=0; i2=0; i3=1; s=1;wait_a=1;
    #10 i0=1; i1=0; i2=0; i3=1; s=1;wait_a=0;
    #10 i0=0; i1=0; i2=0; i3=1; s=0;wait_a=1;
    #10 i0=0; i1=0; i2=0; i3=1; s=1;wait_a=0;
    #10 i0=1; i1=0; i2=1; i3=1; s=0;wait_a=1;
    #10 $finish;
    
    end
endmodule
