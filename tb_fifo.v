`timescale 1ns / 1ps

module fifo_tb;

// Inputs
reg [7:0] din;
reg push;
reg pop;
reg clk;
reg enable;

// Outputs
wire [7:0] dout;
wire full;
wire empty;
wire half_full;

// Instantiate the Unit Under Test (UUT)
fifo uut (
    .din(din), 
    .push(push), 
    .pop(pop), 
    .clk(clk), 
    .enable(enable), 
    .dout(dout), 
    .full(full), 
    .empty(empty), 
    .half_full(half_full)
);

// Clock generation
always #5 clk = ~clk;  // Clock with a period of 10ns

initial begin
    // Initialize inputs
    din = 8'b0;
    push = 0;
    pop = 0;
    clk = 0;
    enable = 0;

    // Reset simulation for a few clock cycles
    #10 enable = 1;

    // Push data into the FIFO
    #10 push = 1; din = 8'd0;  // Push A5
    #10 push = 1; din = 8'd1;  // Push 3C
    #10 push = 1; din = 8'd2;  
      #10 push = 1; din = 8'd5; // Push 7F
    #10 push = 0;               // Stop pushing

    // Pop data from the FIFO
    #20 pop = 1;                // Pop first value
    #10 pop = 1;                // Pop second value
    #10 pop = 0;                // Stop popping

    // Wait for a while
    #20;

    // Finish the simulation
    $finish;
end

endmodule
