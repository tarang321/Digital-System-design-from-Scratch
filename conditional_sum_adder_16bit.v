module conditional_sum_adder_16bit (
    input [15:0] A,     // 16-bit input A
    input [15:0] B,     // 16-bit input B
    input Cin,          // Carry input
    output [15:0] Sum,  // 16-bit Sum output
    output Cout         // Final carry out
);

    // Internal wires for Sum and Carry calculations
    wire [15:0] Sum0, Sum1;     // Sums for Cin=0 and Cin=1
    wire [15:0] Carry0, Carry1; // Carries for Cin=0 and Cin=1
    wire [15:0] FinalCarry;     // Final carries after MUX selection

    // Level 1: Instantiate conditional cells for Sum and Carry calculation
    conditional_cell cond_cell_0 (
        .A(A[0]), .B(B[0]), .Cin(Cin), .Sum0(Sum0[0]), .Carry0(Carry0[0]), .Sum1(Sum1[0]), .Carry1(Carry1[0])
    );
    conditional_cell cond_cell_1 (
        .A(A[1]), .B(B[1]), .Cin(Cin), .Sum0(Sum0[1]), .Carry0(Carry0[1]), .Sum1(Sum1[1]), .Carry1(Carry1[1])
    );
    conditional_cell cond_cell_2 (
        .A(A[2]), .B(B[2]), .Cin(Cin), .Sum0(Sum0[2]), .Carry0(Carry0[2]), .Sum1(Sum1[2]), .Carry1(Carry1[2])
    );
    conditional_cell cond_cell_3 (
        .A(A[3]), .B(B[3]), .Cin(Cin), .Sum0(Sum0[3]), .Carry0(Carry0[3]), .Sum1(Sum1[3]), .Carry1(Carry1[3])
    );
    conditional_cell cond_cell_4 (
        .A(A[4]), .B(B[4]), .Cin(Cin), .Sum0(Sum0[4]), .Carry0(Carry0[4]), .Sum1(Sum1[4]), .Carry1(Carry1[4])
    );
    conditional_cell cond_cell_5 (
        .A(A[5]), .B(B[5]), .Cin(Cin), .Sum0(Sum0[5]), .Carry0(Carry0[5]), .Sum1(Sum1[5]), .Carry1(Carry1[5])
    );
    conditional_cell cond_cell_6 (
        .A(A[6]), .B(B[6]), .Cin(Cin), .Sum0(Sum0[6]), .Carry0(Carry0[6]), .Sum1(Sum1[6]), .Carry1(Carry1[6])
    );
    conditional_cell cond_cell_7 (
        .A(A[7]), .B(B[7]), .Cin(Cin), .Sum0(Sum0[7]), .Carry0(Carry0[7]), .Sum1(Sum1[7]), .Carry1(Carry1[7])
    );
    conditional_cell cond_cell_8 (
        .A(A[8]), .B(B[8]), .Cin(Cin), .Sum0(Sum0[8]), .Carry0(Carry0[8]), .Sum1(Sum1[8]), .Carry1(Carry1[8])
    );
    conditional_cell cond_cell_9 (
        .A(A[9]), .B(B[9]), .Cin(Cin), .Sum0(Sum0[9]), .Carry0(Carry0[9]), .Sum1(Sum1[9]), .Carry1(Carry1[9])
    );
    conditional_cell cond_cell_10 (
        .A(A[10]), .B(B[10]), .Cin(Cin), .Sum0(Sum0[10]), .Carry0(Carry0[10]), .Sum1(Sum1[10]), .Carry1(Carry1[10])
    );
    conditional_cell cond_cell_11 (
        .A(A[11]), .B(B[11]), .Cin(Cin), .Sum0(Sum0[11]), .Carry0(Carry0[11]), .Sum1(Sum1[11]), .Carry1(Carry1[11])
    );
    conditional_cell cond_cell_12 (
        .A(A[12]), .B(B[12]), .Cin(Cin), .Sum0(Sum0[12]), .Carry0(Carry0[12]), .Sum1(Sum1[12]), .Carry1(Carry1[12])
    );
    conditional_cell cond_cell_13 (
        .A(A[13]), .B(B[13]), .Cin(Cin), .Sum0(Sum0[13]), .Carry0(Carry0[13]), .Sum1(Sum1[13]), .Carry1(Carry1[13])
    );
    conditional_cell cond_cell_14 (
        .A(A[14]), .B(B[14]), .Cin(Cin), .Sum0(Sum0[14]), .Carry0(Carry0[14]), .Sum1(Sum1[14]), .Carry1(Carry1[14])
    );
    conditional_cell cond_cell_15 (
        .A(A[15]), .B(B[15]), .Cin(Cin), .Sum0(Sum0[15]), .Carry0(Carry0[15]), .Sum1(Sum1[15]), .Carry1(Carry1[15])
    );

    // Level 2: MUXes to select the correct Sum and Carry based on Cin
    mux2to1 MUX_SUM_0 (.A(Sum0[0]), .B(Sum1[0]), .Sel(Cin), .Y(Sum[0]));
    mux2to1 MUX_SUM_1 (.A(Sum0[1]), .B(Sum1[1]), .Sel(Cin), .Y(Sum[1]));
    mux2to1 MUX_SUM_2 (.A(Sum0[2]), .B(Sum1[2]), .Sel(Cin), .Y(Sum[2]));
    mux2to1 MUX_SUM_3 (.A(Sum0[3]), .B(Sum1[3]), .Sel(Cin), .Y(Sum[3]));
    mux2to1 MUX_SUM_4 (.A(Sum0[4]), .B(Sum1[4]), .Sel(Cin), .Y(Sum[4]));
    mux2to1 MUX_SUM_5 (.A(Sum0[5]), .B(Sum1[5]), .Sel(Cin), .Y(Sum[5]));
    mux2to1 MUX_SUM_6 (.A(Sum0[6]), .B(Sum1[6]), .Sel(Cin), .Y(Sum[6]));
    mux2to1 MUX_SUM_7 (.A(Sum0[7]), .B(Sum1[7]), .Sel(Cin), .Y(Sum[7]));
    mux2to1 MUX_SUM_8 (.A(Sum0[8]), .B(Sum1[8]), .Sel(Cin), .Y(Sum[8]));
    mux2to1 MUX_SUM_9 (.A(Sum0[9]), .B(Sum1[9]), .Sel(Cin), .Y(Sum[9]));
    mux2to1 MUX_SUM_10 (.A(Sum0[10]), .B(Sum1[10]), .Sel(Cin), .Y(Sum[10]));
    mux2to1 MUX_SUM_11 (.A(Sum0[11]), .B(Sum1[11]), .Sel(Cin), .Y(Sum[11]));
    mux2to1 MUX_SUM_12 (.A(Sum0[12]), .B(Sum1[12]), .Sel(Cin), .Y(Sum[12]));
    mux2to1 MUX_SUM_13 (.A(Sum0[13]), .B(Sum1[13]), .Sel(Cin), .Y(Sum[13]));
    mux2to1 MUX_SUM_14 (.A(Sum0[14]), .B(Sum1[14]), .Sel(Cin), .Y(Sum[14]));
    mux2to1 MUX_SUM_15 (.A(Sum0[15]), .B(Sum1[15]), .Sel(Cin), .Y(Sum[15]));

    // Level 3: MUXes for final carry propagation
    mux2to1 MUX_CARRY_0 (.A(Carry0[0]), .B(Carry1[0]), .Sel(Cin), .Y(FinalCarry[0]));
    mux2to1 MUX_CARRY_1 (.A(Carry0[1]), .B(Carry1[1]), .Sel(Cin), .Y(FinalCarry[1]));
    mux2to1 MUX_CARRY_2 (.A(Carry0[2]), .B(Carry1[2]), .Sel(Cin), .Y(FinalCarry[2]));
    mux2to1 MUX_CARRY_3 (.A(Carry0[3]), .B(Carry1[3]), .Sel(Cin), .Y(FinalCarry[3]));
    mux2to1 MUX_CARRY_4 (.A(Carry0[4]), .B(Carry1[4]), .Sel(Cin), .Y(FinalCarry[4]));
    mux2to1 MUX_CARRY_5 (.A(Carry0[5]), .B(Carry1[5]), .Sel(Cin), .Y(FinalCarry[5]));
    mux2to1 MUX_CARRY_6 (.A(Carry0[6]), .B(Carry1[6]), .Sel(Cin), .Y(FinalCarry[6]));
    mux2to1 MUX_CARRY_7 (.A(Carry0[7]), .B(Carry1[7]), .Sel(Cin), .Y(FinalCarry[7]));
    mux2to1 MUX_CARRY_8 (.A(Carry0[8]), .B(Carry1[8]), .Sel(Cin), .Y(FinalCarry[8]));
    mux2to1 MUX_CARRY_9 (.A(Carry0[9]), .B(Carry1[9]), .Sel(Cin), .Y(FinalCarry[9]));
    mux2to1 MUX_CARRY_10 (.A(Carry0[10]), .B(Carry1[10]), .Sel(Cin), .Y(FinalCarry[10]));
    mux2to1 MUX_CARRY_11 (.A(Carry0[11]), .B(Carry1[11]), .Sel(Cin), .Y(FinalCarry[11]));
    mux2to1 MUX_CARRY_12 (.A(Carry0[12]), .B(Carry1[12]), .Sel(Cin), .Y(FinalCarry[12]));
    mux2to1 MUX_CARRY_13 (.A(Carry0[13]), .B(Carry1[13]), .Sel(Cin), .Y(FinalCarry[13]));
    mux2to1 MUX_CARRY_14 (.A(Carry0[14]), .B(Carry1[14]), .Sel(Cin), .Y(FinalCarry[14]));
    mux2to1 MUX_CARRY_15 (.A(Carry0[15]), .B(Carry1[15]), .Sel(Cin), .Y(FinalCarry[15]));

    // Assign the final carry out
    assign Cout = FinalCarry[15];

endmodule

// Submodule: Conditional cell for Sum and Carry generation
module conditional_cell (
    input A, B, Cin,
    output Sum0, Carry0,
    output Sum1, Carry1
);
    assign Sum0 = A ^ B;               // Sum for Cin = 0
    assign Carry0 = A & B;             // Carry for Cin = 0
    assign Sum1 = A ^ B ^ Cin;         // Sum for Cin = 1
    assign Carry1 = (A & B) | (Cin & (A ^ B)); // Carry for Cin = 1
endmodule

// Submodule: 2-to-1 multiplexer
module mux2to1 (
    input A, B, Sel,
    output Y
);
    assign Y = Sel ? B : A;
endmodule