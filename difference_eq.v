`timescale 1ns / 1ps

module difference_eq (
    input clk,
    input rst,
    input signed [15:0] x_n,    
    output reg signed [15:0] y_n 
);

    
    reg signed [15:0] x_n1, x_n2;      
    reg signed [15:0] y_n1, y_n2, y_n3;   

   
    wire signed [15:0] temp1, temp2, temp3, temp4, temp5, temp6;

   
    assign temp1 = x_n - x_n1;
    assign temp2 = x_n2 + temp1;
    assign temp3 = y_n1 >>> 1;
    assign temp4 = y_n2 >>> 2;
    assign temp5 = y_n3 + temp3 + temp4;
    assign temp6 = temp2 + temp5;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers to 0
            x_n1 <= 16'd0;
            x_n2 <= 16'd0;
            y_n1 <= 16'd0;
            y_n2 <= 16'd0;
            y_n3 <= 16'd0;
            y_n  <= 16'd0;
        end else begin
            // Update delayed input values
            x_n1 <= x_n;
            x_n2 <= x_n1;

            // Update delayed output values
            y_n3 <= y_n2;
            y_n2 <= y_n1;
            y_n1 <= y_n;

            // Compute output y[n]
            y_n <= temp6;
        end
    end

endmodule