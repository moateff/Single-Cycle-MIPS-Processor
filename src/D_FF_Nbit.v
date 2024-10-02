`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 04:34:43 PM
// Design Name: 
// Module Name: D_FF_Nbit
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


module D_FF_Nbit #(parameter N = 4)(
    input            clk, 
    input            reset, 
    input            enable, 
    input            clear,
    input  [N - 1:0] D,
    output [N - 1:0] Q
    );
    
    reg [N - 1:0] Q_next, Q_reg;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            Q_reg <= 'b0;
        else if(clear)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;
    end
    
    always@(D)
        Q_next = D;
    
    assign Q = Q_reg;
    
endmodule
