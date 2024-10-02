`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 08:06:51 PM
// Design Name: 
// Module Name: MIPS_PROCESSOR
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


module MIPS_PROCESSOR(
    input         reset,
    input         clk,
    input  [31:0] instruction_F,
    output [31:0] PC_F,
    input  [31:0] read_data_M,
    output [31:0] alu_out_M,
    output [31:0] write_data_M,
    output        mem_write
    );
    
    wire [5:0] opcode_D; 
    wire [5:0] funct_D;
    wire       reg_write_E, reg_write_M, reg_write_W;
    wire       reg_dest_E;
    wire       alu_src_E;
    wire       PC_src_D;
    wire       mem_to_reg_E, mem_to_reg_M, mem_to_reg_W;
    wire [2:0] alu_control_E;
    wire       flush_E;
    wire       equal_D;
      
    // Instantiate the CONTROL_UNIT module
    CONTROL_UNIT control_unit (
        .opcode(instruction[31:26]),
        .funct(instruction[5:0]),
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
        
    // Instantiate the DATA_PATH module
    DATA_PATH datapath (
        .reset(reset),
        .clk(clk),
        .instruction(instruction[25:0]),
        .read_data(read_data),
        .alu_control(alu_control),
        .PC_src(PC_src),
        .mem_to_reg(mem_to_reg),
        .alu_src(alu_src),
        .reg_dest(reg_dest),
        .reg_write(reg_write),
        .jump(jump),
        .zero_flag(zero_flag),
        .PC(PC),
        .alu_out(alu_out),
        .write_data(write_data)
    );
endmodule
