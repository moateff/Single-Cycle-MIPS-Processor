`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:40:24 PM
// Design Name: 
// Module Name: INST_MEM_tb
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


module INST_MEM_tb(
    );
    reg [31:0] PC;
    reg reset;
    wire [31:0] Instruction_Code;
    
    INST_MEM uut (.PC(PC),
             .reset(reset),
             .Instruction_Code(Instruction_Code)
    );
    
    initial
    begin
        reset = 1;
        PC = 0;
        #10
        reset = 0;
        PC = 4;
        #10
        PC = 8;
    end
    
    initial
        #30 $finish;
endmodule
