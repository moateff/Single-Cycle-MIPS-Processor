`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:32:33 AM
// Design Name: 
// Module Name: DATA_MEM_tb
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


module DATA_MEM_tb(
    );
    reg [31:0] addr;
    wire [31:0] r_data;
    reg write_en;
    reg [31:0] w_data;
    reg clk;
    reg reset;

    DATA_MEM uut (.addr(addr),
             .r_data(r_data),
             .write_en(write_en),
             .w_data(w_data),
             .clk(clk),
             .reset(reset)
    );
    
    // Initializing the registers
     initial 
     begin
         reset = 1;
         #10 reset = 0;
     end
    
     // Setting up clock
     initial 
     begin   
        clk = 0;
        forever 
           #10 clk = ~clk;
     end
          
     // Writing and Reading values to different memory locations
     initial 
     begin
         write_en = 0;
         #10
         write_en = 1; w_data = 20; addr = 0;
         #20
         write_en = 1; w_data = 30; addr = 1;
         #20
         write_en = 1; w_data = 40; addr = 2;
         #20 
         write_en = 0; addr = 0;
         #20 
         write_en = 0; addr = 2;
         #20 
         write_en = 0; addr = 1;
     end
 
     initial 
     begin
         #120 $finish;
     end
endmodule
