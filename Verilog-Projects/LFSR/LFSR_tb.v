`timescale 1ns / 1ps

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
