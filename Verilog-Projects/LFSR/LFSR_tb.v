`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2024 17:35:16
// Design Name: 
// Module Name: lfsr_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Test bench for 4-bit LFSR module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module lfsr_tb;
   
    reg clk;
    reg rst;
    wire [7:0] out;  
    lfsr uut (
        .out(out), 
        .clk(clk), 
        .rst(rst)
    );

    initial begin
        
        clk = 0;
        rst = 0;
        rst = 1;
        #10;
        rst = 0;
        #200;
        $finish;
    end

    always #5 clk = ~clk;
      
endmodule
