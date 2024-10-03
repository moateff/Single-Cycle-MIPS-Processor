`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 06:29:01 PM
// Design Name: 
// Module Name: DATA_PATH_tb
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


module DATA_PATH_tb(
    );
    // Testbench signals
    reg reset;
    reg clk;
    reg [25:0] instruction;
    reg [31:0] read_data;
    reg [2:0] alu_control;
    reg PC_src;
    reg mem_to_reg;
    reg alu_src;
    reg reg_dest;
    reg reg_write;
    reg jump;
    
    // Output signals
    wire zero_flag;
    wire [31:0] PC;
    wire [31:0] alu_out;
    wire [31:0] write_data;

    // Instantiate the DATA_PATH module
    DATA_PATH uut (
        .reset(reset),
        .clk(clk),
        .instruction(instruction),
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

    // Clock generation
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        instruction = 0;
        read_data = 0;
        alu_control = 3'b000;
        PC_src = 0;
        mem_to_reg = 0;
        alu_src = 0;
        reg_dest = 0;
        reg_write = 0;
        jump = 0;

        // Apply reset
        #15;
        reset = 0;

        // Test Case 1: Simple instruction with PC increment
        instruction = 26'b01000_01001_10000_00000_100000; // Example R-type instruction
        alu_control = 3'b010; // Example ALU control signal
        reg_dest = 1;
        reg_write = 1;

        // Check outputs
        #10;
        $display("Test Case 1:");
        $display("PC: %h", PC);
        $display("ALU Out: %h", alu_out);
        $display("Write Data: %h", write_data);
        $display("Zero Flag: %b", zero_flag);
        
        reg_dest = 0;
        reg_write = 0;
        
        // Test Case 2: Branch instruction
        instruction = 26'b10000_10001_0000000000000010; // Example branch instruction
        alu_control = 3'b110; // Example ALU control signal for branch
        PC_src = 1;
        reg_write = 1;

        // Check outputs
        #10;
        $display("Test Case 2:");
        $display("PC: %h", PC);
        $display("ALU Out: %h", alu_out);
        $display("Write Data: %h", write_data);
        $display("Zero Flag: %b", zero_flag);
        
        PC_src = 0;
        reg_write = 0;
                
        // Test Case 3: Jump instruction
        instruction = 26'b000010_00000000000000000000000001; // Example jump instruction
        jump = 1;

        // Check outputs
        #10;
        $display("Test Case 3:");
        $display("PC: %h", PC);
        $display("ALU Out: %h", alu_out);
        $display("Write Data: %h", write_data);
        $display("Zero Flag: %b", zero_flag);
        
        jump = 0;
        
        // Test Case 4: LW instruction
        instruction = 26'b01000_10000_0000000000000000; // Example jump instruction
        alu_src = 1;
        mem_to_reg = 1;
        reg_write = 1;
        read_data = 32'hDEADBEEF;
        reg_dest = 0;
        
        // Check outputs
        #10;
        $display("Test Case 3:");
        $display("PC: %h", PC);
        $display("ALU Out: %h", alu_out);
        $display("Write Data: %h", write_data);
        $display("Zero Flag: %b", zero_flag);
        
        // End simulation
        $stop;
    end

endmodule
