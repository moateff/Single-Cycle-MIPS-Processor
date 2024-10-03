`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 08:38:04 PM
// Design Name: 
// Module Name: MIPS_ARCHITECTURE
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


module MIPS_ARCHITECTURE(
    input clk,                //  System's clock
    input reset               //  Asynchrounus Active high reset
);
    wire [31:0] instruction;  //  Intsruction fetched from the Instruction Memory.
    wire [31:0] read_data;    //  The data read from the data memory.
    wire [31:0] write_data;   //  The data to be written in the data memory.
    wire [31:0] PC;           //  The Program Counter out from the data path unit.
    wire [31:0] alu_out;      //  ALU result.
    wire        mem_write;    //  Control signal from the Control Unit to the Data memory.
    
    // Instantiate the MIPS_PROCESSOR module
    MIPS_PROCESSOR mips_processor(
        .reset(reset),
        .clk(clk),
        .instruction(instruction),
        .read_data(read_data),
        .PC(PC),
        .alu_out(alu_out),
        .write_data(write_data),
        .mem_write(mem_write)
    );
    
    // Instantiate the IFU module
    INST_MEM instruction_memory(
        .reset(reset),
        .PC(PC),
        .instruction(instruction)
    );
    
    // Instantiate the DATA_MEM module
    DATA_MEM data_memory(
        .addr(alu_out),
        .r_data(read_data),
        .write_en(mem_write),
        .w_data(write_data),
        .clk(clk),
        .reset(reset)
    );
endmodule
