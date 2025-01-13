`timescale 1ns / 1ps

module tb_vending_machine;

    // Inputs
    reg clk;
    reg reset;
    reg coin_nickel;
    reg coin_dime;
    reg coin_quarter;

    // Outputs
    wire item_dispensed;
    wire change_returned;

    // Instantiate the vending_machine module
    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .coin_nickel(coin_nickel),
        .coin_dime(coin_dime),
        .coin_quarter(coin_quarter),
        .item_dispensed(item_dispensed),
        .change_returned(change_returned)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5ns
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        coin_nickel = 0;
        coin_dime = 0;
        coin_quarter = 0;

        // Apply reset
        $display("Test: Resetting vending machine...");
        reset = 1; // Assert reset
        #10 reset = 0; // De-assert reset

        // Test all cases
        $display("Test: Insert 5 Rs (nickel)...");
        coin_nickel = 1;
        #10 coin_nickel = 0;

        $display("Test: Insert 10 Rs (dime)...");
        coin_dime = 1;
        #10 coin_dime = 0;

        $display("Test: Insert 25 Rs (quarter)...");
        coin_quarter = 1;
        #10 coin_quarter = 0;

        $display("Test: Insert coins to reach 50 Rs...");
        coin_nickel = 1; // 5 Rs
        #10 coin_nickel = 0;
        coin_dime = 1; // 10 Rs
        #10 coin_dime = 0;
        coin_quarter = 1; // 25 Rs
        #10 coin_quarter = 0;

        $display("Test: Insert extra coins to check change return...");
        coin_quarter = 1; // 25 Rs
        #10 coin_quarter = 0;
        coin_dime = 1; // 10 Rs
        #10 coin_dime = 0;
        coin_nickel = 1; // 5 Rs
        #10 coin_nickel = 0;

        // End simulation
        #20 $finish;
    end
endmodule
