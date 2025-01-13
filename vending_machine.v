`timescale 1ns / 1ps
//

module vending_machine(
input clk,                   // Clock signal
    input reset,                 // Reset signal
    input coin_nickel,           // Nickel inserted (5 Rs)
    input coin_dime,             // Dime inserted (10 Rs)
    input coin_quarter,          // Quarter inserted (25 Rs)
    output reg item_dispensed,   // Item dispensed (1 when item is dispensed)
    output reg change_returned   // Change returned (1 when change is returned)
);

    // State parameters for the FSM (10 total stages, from 0 Rs to 50 Rs)
    parameter S0  = 4'b0000; // 0 Rs
    parameter S1  = 4'b0001; // 5 Rs
    parameter S2  = 4'b0010; // 10 Rs
    parameter S3  = 4'b0011; // 15 Rs
    parameter S4  = 4'b0100; // 20 Rs
    parameter S5  = 4'b0101; // 25 Rs (Item dispensed)
    parameter S6  = 4'b0110; // 30 Rs (5 Rs change)
    parameter S7  = 4'b0111; // 35 Rs (10 Rs change)
    parameter S8  = 4'b1000; // 40 Rs (15 Rs change)
    parameter S9  = 4'b1001; // 45 Rs (20 Rs change)
    parameter S10 = 4'b1010; // 50 Rs (25 Rs change)

    // Internal signals
    reg [3:0] current_state, next_state;       // Current and next state

    // State transition block: Sequential logic for state updates
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Mealy State transition and output logic
    always @(*) begin
        // Default values for the outputs and next state
        next_state = current_state;
        item_dispensed = 0;
        change_returned = 0;

        case(current_state)
            S0: begin
                if (coin_nickel)
                    next_state = S1;
                else if (coin_dime)
                    next_state = S2;
                else if (coin_quarter)
                    next_state = S3;
                item_dispensed = 0;
                change_returned = 0;
            end

            S1: begin
                if (coin_nickel)
                    next_state = S2;
                else if (coin_dime)
                    next_state = S3;
                else if (coin_quarter)
                    next_state = S4;
                item_dispensed = 0;
                change_returned = 0;
            end

            S2: begin
                if (coin_nickel)
                    next_state = S3;
                else if (coin_dime)
                    next_state = S4;
                else if (coin_quarter)
                    next_state = S5;
                item_dispensed = 0;
                change_returned = 0;
            end

            S3: begin
                if (coin_nickel)
                    next_state = S4;
                else if (coin_dime)
                    next_state = S5;
                else if (coin_quarter)
                    next_state = S6;
                item_dispensed = 0;
                change_returned = 0;
            end

            S4: begin
                if (coin_nickel)
                    next_state = S5;
                else if (coin_dime)
                    next_state = S6;
                else if (coin_quarter)
                    next_state = S7;
                item_dispensed = 0;
                change_returned = 0;
            end

            S5: begin
                item_dispensed = 1;  // Dispense chocolate
                if (coin_nickel)
                    next_state = S6;
                else if (coin_dime)
                    next_state = S7;
                else if (coin_quarter)
                    next_state = S8;
                change_returned = 0;
            end

            S6: begin
                item_dispensed = 1;  // Dispense chocolate
                change_returned = 1; // 5 Rs change returned
                next_state = S0;     // Return to idle state after change
            end

            S7: begin
                item_dispensed = 1;  // Dispense chocolate
                change_returned = 1; // 10 Rs change returned
                next_state = S0;     // Return to idle state after change
            end

            S8: begin
                item_dispensed = 1;  // Dispense chocolate
                change_returned = 1; // 15 Rs change returned
                next_state = S0;     // Return to idle state after change
            end

            S9: begin
                item_dispensed = 1;  // Dispense chocolate
                change_returned = 1; // 20 Rs change returned
                next_state = S0;     // Return to idle state after change
            end

            S10: begin
                item_dispensed = 1;  // Dispense chocolate
                change_returned = 1; // 25 Rs change returned
                next_state = S0;     // Return to idle state after change
            end

            default: begin
                next_state = S0;
                item_dispensed = 0;
                change_returned = 0;
            end
        endcase
    end

endmodule