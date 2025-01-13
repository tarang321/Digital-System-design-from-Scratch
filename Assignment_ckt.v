`timescale 1ns / 1ps

module Assignment_ckt(
input clk,
input rst,
input [7:0] a,
input[7:0] b,
input[7:0] c,
input[7:0] d,
output reg[7:0]y
    );
    reg [1:0]count;
    always@(posedge clk)
    begin
    if (rst==1)
    begin
    count=0;
    end
    else
    count= count+1;
    if(count== 4)
    begin
    count<=0;
    end
    end
    always@(posedge clk)
    begin
    case (count)
            2'b00: y <= a;   // When sel is 00, output A
            2'b01: y <= b;   // When sel is 01, output B
            2'b10: y <= c;   // When sel is 10, output C
            2'b11: y <= d;   // When sel is 11, output D
            default: y = 1'b0; // Default case to avoid latches
        endcase
    end
endmodule
