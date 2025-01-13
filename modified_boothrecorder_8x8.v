`timescale 1ns / 1ps

module modified_boothrecorder_8x8(
input signed [7:0] multiplier,   // Multiplier (Y)
    input signed [7:0] multiplicand, // Multiplicand (X)
    output signed [15:0] product     // Product (P)
);

    // Extend multiplicand to 16 bits
    wire signed [15:0] multiplicand_extended = { {8{multiplicand[7]}}, multiplicand }; // Sign-extend to 16 bits
    
    // Partial products
    wire signed [15:0] pp0, pp1, pp2, pp3;

    // Booth encoding for each partial product
    assign pp0 = (multiplier[1:0] == 2'b01) ?  multiplicand_extended :
                 (multiplier[1:0] == 2'b10) ? -multiplicand_extended :
                 16'd0;

    assign pp1 = (multiplier[3:1] == 3'b001 || multiplier[3:1] == 3'b010) ?  (multiplicand_extended << 2) :
                 (multiplier[3:1] == 3'b101 || multiplier[3:1] == 3'b110) ? -(multiplicand_extended << 2) :
                 16'd0;

    assign pp2 = (multiplier[5:3] == 3'b001 || multiplier[5:3] == 3'b010) ?  (multiplicand_extended << 4) :
                 (multiplier[5:3] == 3'b101 || multiplier[5:3] == 3'b110) ? -(multiplicand_extended << 4) :
                 16'd0;

    assign pp3 = (multiplier[7:5] == 3'b001 || multiplier[7:5] == 3'b010) ?  (multiplicand_extended << 6) :
                 (multiplier[7:5] == 3'b101 || multiplier[7:5] == 3'b110) ? -(multiplicand_extended << 6) :
                 16'd0;

    // Summing partial products to get the final product
    assign product = pp0 + pp1 + pp2 + pp3;

endmodule