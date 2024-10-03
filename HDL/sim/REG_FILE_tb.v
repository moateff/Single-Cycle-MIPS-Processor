`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 07:07:48 PM
// Design Name: 
// Module Name: REG_FILE_tb
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


module REG_FILE_tb(
    );
    reg [4:0] r_addr1, r_addr2;
    wire [31:0] r_data1, r_data2;
    reg [4:0] w_addr;
    reg write_en;
    reg [31:0] w_data;
    reg clk;
    reg reset;
        
    REG_FILE uut (.r_addr1(r_addr1),
            .r_addr2(r_addr2),
            .r_data1(r_data1),
            .r_data2(r_data2),
            .w_addr(w_addr),
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
          
     // Writing values to different registers
     initial 
     begin
         write = 0;
         #10
         write = 1; w_data = 20; w_addr = 0;
         #10
         write = 1; w_data = 30; w_addr = 1;
         #10
         write = 1; w_data = 40; w_addr = 1;
         #10 
         write = 0;
     end
 
     // Reading values of different registers
     initial 
     begin
         #10 r_addr1 = 0; r_addr2 = 5;
         #10 r_addr1 = 0; r_addr2 = 1;
         #10 r_addr1 = 0; r_addr2 = 1;
         #10 r_addr1 = 1; r_addr2 = 2;
     end
 
     initial 
     begin
         #50 $finish;
     end
endmodule
