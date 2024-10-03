`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 03:04:13 PM
// Design Name: 
// Module Name: CONTROL_UNIT-tb
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


module CONTROL_UNIT_tb(
    );
    reg [5:0] opcode;
    reg [5:0] funct;
    reg zero_flag;
    wire reg_write;
    wire reg_dest;
    wire alu_src;
    wire PC_src;
    wire mem_write;
    wire mem_to_reg;
    wire jump;
    wire [2:0] alu_control;
    
    // Instantiate the CONTROL_UNIT module
    CONTROL_UNIT uut (
        .opcode(opcode),
        .funct(funct),
        .zero_flag(zero_flag),
        .reg_write(reg_write),
        .reg_dest(reg_dest),
        .alu_src(alu_src),
        .PC_src(PC_src),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .jump(jump),
        .alu_control(alu_control)
    );
    
    // Test the CONTROL_UNIT with some initial values
    initial 
    begin
        // Test R-type instruction (ADD, SUB, etc.)
        opcode = 6'b000000; // R-type opcode
        funct = 6'b100000;  // ADD instruction (funct)
        zero_flag = 0;
        
        #10;  // Wait for 10 time units
        
        opcode = 6'b000000; // R-type opcode
        funct = 6'b101010;  // Set on Less Than instruction (funct)
        zero_flag = 0;
        
        #10;  // Wait for 10 time units
        
        // Test I-type instruction (e.g., LW)
        opcode = 6'b100011; // LW instruction opcode
        funct = 6'b000000;  // Not relevant for I-type
        zero_flag = 0;
        
        #10;  // Wait for 10 time units

        // Test J-type instruction (Jump)
        opcode = 6'b000010; // J instruction opcode
        funct = 6'b000000;  // Not relevant for J-type
        zero_flag = 0;
        
        #10;  // Wait for 10 time units
        
        // Test branch instruction (BEQ)
        opcode = 6'b000100; // BEQ instruction opcode
        funct = 6'b000000;  // Not relevant for BEQ
        zero_flag = 1;      // Zero flag set for branch
        
        #10;  // Wait for 10 time units
    end
    
    initial
        #50 $finish;
endmodule
