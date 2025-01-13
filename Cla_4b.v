`timescale 1ns / 1ps

module Cla_4b(
    input wire[3:0] a,
    input wire [3:0] b,
    input  c,
    output reg[3:0] s,
    output reg carry
    
    );
    reg [3:0] p,g;
   reg [3:0]ci;
    integer i;
     always @(*)
        begin
             for(i=0; i<=3; i=i+1)//Value of propogated bits
             begin
             p[i]=a[i]^b[i];
             g[i]=a[i]&b[i];
             end
        ci[0] = c;
        ci[1] = g[0] | (p[0] & ci[0]);
        ci[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci[0]);
        ci[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci[0]);
        carry = g[3] | (p[3] & ci[3]);
          carry = ci[3];
            for(i=0; i<=3; i=i+1)//Value of sum bits
             begin
             s[i]=ci[i]^p[i];
             end
  
    end
endmodule
