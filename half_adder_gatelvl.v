`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2024 01:37:06
// Design Name: 
// Module Name: half_adder_gatelvl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module half_adder_gatelvl(
    input a,
    input b,
    output sum,
    output carry
    );
    and ( carry, a, b );
    xor ( sum, a, b );
    
endmodule
