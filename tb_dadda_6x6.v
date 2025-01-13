`timescale 1ns / 1ps


module tb_dadda_multiplier;
    reg [5:0] A;      
    reg [5:0] B;      
    wire [11:0] P;    

       dadda_multiplier_6x6 uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        // Test cases
        A = 6'b000101;
        B = 6'b000011; 
        #30;           
        

        A = 6'b000110; 
        B = 6'b000101; 
        #30;           
       
        A = 6'b000001; 
        B = 6'b000111; 
        #30;           
       
        $finish; // End the simulation
    end
endmodule
