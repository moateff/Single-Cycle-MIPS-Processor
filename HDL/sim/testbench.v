`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 08:55:04 PM
// Design Name: 
// Module Name: testbench
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


module testbench(
    );
    // Declare signals for input and output connections
    reg clk;
    reg reset;

    // Instantiate the MIPS_ARCHITECTURE module
    MIPS_ARCHITECTURE uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with period of 10 time units
    end

    // Test procedure
    initial begin
        // Initialize inputs
        reset = 1;  // Assert reset

        // Release reset and perform test operations
        #10 reset = 0;  // De-assert reset

        // Additional test cases can be added here

        #500 $finish;  // End simulation after 100 time units
    end
endmodule

