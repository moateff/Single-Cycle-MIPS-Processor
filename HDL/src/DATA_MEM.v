`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:18:13 AM
// Design Name: 
// Module Name: DATA_MEM
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


module DATA_MEM(
    input [31:0] addr,           // 32-bit input for memory address
    output[31:0] r_data,         // 32-bit output for reading data from memory
    input [31:0] w_data,         // 32-bit input for writing data into memory
    input        wr_en,       // Write enable signal (if high, data is written to memory)
    input        clk,            // Clock signal
    input        reset           // Asynchrounus Reset signal (for initializing memory)
);
    
    reg [31:0] data_mem [127:0];  // Declare memory array with 64 words, each 32 bits wide
    integer i;                   // Iterator for the reset loop
    
    always @(negedge clk, posedge reset)  // Triggered on rising edge of clk or reset
    begin 
        if(reset)  // If reset is high, initialize the memory
            for (i = 0; i < 128; i = i + 1)  // Loop through all memory locations
                data_mem[i] = 32'b0;        // Set each memory location to 0
        else if(wr_en)                   // If write enable is high
                data_mem[addr] = w_data;    // Write data to memory at address 'addr'
    end
    
    assign r_data = data_mem[addr];  // Read data from memory at address 'addr' (continuous assignment)
    
endmodule
