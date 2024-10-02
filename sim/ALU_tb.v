`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 06:16:06 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
    );
    reg [31:0] in_a, in_b;
    reg [2:0] alu_control;
    wire [31:0] alu_result;
    wire zero_flag;
    
    ALU uut (
        .in_a(in_a), 
        .in_b(in_b),
        .alu_control(alu_control),
        .alu_result(alu_result),
        .zero_flag(zero_flag)
    );
    
    // Monitoring changing values
    initial
    $monitor($time, "\nInput_1 = %b, \nInput_2 = %b,\nALU_control = %b,\nALU_result = %b, Zero_flag = %b\n", in_a, in_b, alu_control, alu_result, zero_flag);
    
    initial
    begin
        #20 in_a = 23; in_b = 40;  
        alu_control = 3'b000;
        #20 
        alu_control = 3'b001;
        #20 
        alu_control = 3'b010;
        #20 
        alu_control = 3'b100;
        #20 
        alu_control = 3'b101;
        #20 in_a = 42; in_b = 23;  
        alu_control = 3'b010;
        #20 
        alu_control = 3'b110;
        #20 
        alu_control = 3'b111;
    end

    // Finish after 150 clock cycles
    initial
        #180 $finish;
endmodule
