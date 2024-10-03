`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:10:55 AM
// Design Name: 
// Module Name: Shifter_tb
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


module Shifter_tb(
    );
    parameter shamt = 2, direction  = 1;
    reg [31:0] data_in;
    wire [32:0] data_out;

    Shifter#(.shamt(shamt), .direction(direction)) uut (
            .data_in(data_in),
            .data_out(data_out)
    );
    
    initial
    begin
        #10 data_in = 40;
        #10 data_in = 10;
    end
    
    initial
        #30 $finish;
endmodule
