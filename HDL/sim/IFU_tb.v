`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 03:34:24 PM
// Design Name: 
// Module Name: IFU_tb
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


module IFU_tb(
);
    // Testbench signals
    reg clk;                    // Clock signal
    reg reset;                  // Reset signal
    reg [31:0] PC;                 // Program Counter
    wire [31:0] Instruction_Code; // Fetched instruction

    // Instantiate the IFU module
    IFU uut (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .Instruction_Code(Instruction_Code)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
        PC = 32'b0;
        
        // Apply reset
        #10;
        reset = 0;
        
        // Wait and check Instruction_Code
        $display("Instruction at PC=0x%0h: %0h", 32'h0, Instruction_Code);

        // Test 2: Fetch instruction at PC = 0x4 (PC incremented)
        PC = 32'b100;

        // Wait and check Instruction_Code
        $display("Instruction at PC=0x%0h: %0h", 32'h4, Instruction_Code);

        // Test 3: Branch to PC = 0x8
        #10;
        PC = 32'h8; 
        
        // Wait and check Instruction_Code
        $display("Instruction at PC=0x%0h: %0h", 32'h8, Instruction_Code);

        // Test 4: Branch to PC = 0xC
        #10;
        PC = 32'hC; // Branch target
        
        // Wait and check Instruction_Code
        $display("Instruction at PC=0x%0h: %0h", 32'hC, Instruction_Code);

        // End simulation
        $finish;
    end
endmodule
