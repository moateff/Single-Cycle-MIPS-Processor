`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 10:13:47 PM
// Design Name: 
// Module Name: Sign_Extend_tb
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


module Sign_Extend_tb(
    );
    reg [15:0] in;
    wire [31:0] out;
    
    Sign_Extend uut (.immediate_in(in),
                     .immediate_out(out)
    );
    
    initial
    begin
        #10 in = 5;
        #10 in = -5;
    end
    
    initial
        #30 $finish;
endmodule
