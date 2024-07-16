`timescale 1ns / 1ps

module Ddice_tb;

    
    reg clk;
    reg rst;
    reg rb;
    reg [3:0] sum;

   
    wire roll;
    wire win;
    wire lose;
    wire [2:0] next_state;
    wire [3:0] prev_sum;

    
    Ddice uut (
        .clk(clk), 
        .rst(rst), 
        .rb(rb), 
        .sum(sum), 
        .roll(roll), 
        .win(win), 
        .lose(lose), 
        .next_state(next_state), 
        .prev_sum(prev_sum)
    );

    initial begin
     
        clk = 0;
        rst = 1;
        rb = 0;
        sum = 0;

        #10;
        rst = 0;

        // First win
        #10 rb = 1; sum = 3; 
        #20 rb = 0; 
        #20 rst = 1; 
        #10 rst = 0;

        // First lose
        #10 rb = 1; sum = 2; 
        #20 rb = 0; 
        #20 rst = 1; 
        #10 rst = 0;

        // Same sum win
        #10 rb = 1; sum = 7; 
        #20 rb = 1; sum = 7; 
        #20 rb = 0; 
        #20 rst = 1; 
        #10 rst = 0;

        // Different sum lose
        #20 rb = 1; sum = 5; 
        #20 rb = 1; sum = 6; 
        #20 rb = 0; 
        #20 rst = 1; 
        #10 rst = 0;

        #20 $finish;
    end

    
    always #5 clk = ~clk;

endmodule
