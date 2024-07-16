`timescale 1ns/1ns

module tb_PWM_generator();

    // Testbench signals
    reg clk;
    reg reset;
    reg [7:0] PWM_ontime;
    wire PWM_out;

    // Instantiate the PWM_generator module
    PWM_generator uut (
        .clk(clk),
        .reset(reset),
        .PWM_ontime(PWM_ontime),
        .PWM_out(PWM_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        PWM_ontime = 8'd0;

        // Apply reset
        reset = 1;
        #20;
        reset = 0;

       
        reset = 1;
        #20;
        reset = 0;
        PWM_ontime = 8'd200;
        #100;

        // End of simulation
        $stop;
    end

    // Monitor the signals
    initial begin
        $monitor("Time: %0d, clk: %b, reset: %b, PWM_ontime: %d, PWM_out: %b", 
                 $time, clk, reset, PWM_ontime, PWM_out);
    end

endmodule
