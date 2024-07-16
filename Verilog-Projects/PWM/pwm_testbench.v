`timescale 1ns/1ns

module tb_PWM_generator();

  
    reg clk;
    reg reset;
    reg [7:0] PWM_ontime;
    wire PWM_out;

 
    PWM_generator uut (
        .clk(clk),
        .reset(reset),
        .PWM_ontime(PWM_ontime),
        .PWM_out(PWM_out)
    );

   
    always begin
        #5 clk = ~clk; 
    end

  
    initial begin
      
        clk = 0;
        reset = 0;
        PWM_ontime = 8'd0;
        reset = 1;
        #20;
        reset = 0;
        reset = 1;
        #20;
        reset = 0;
        PWM_ontime = 8'd200;
        #100;
        $stop;
    end
endmodule
