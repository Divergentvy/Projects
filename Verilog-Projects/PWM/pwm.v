`timescale 1ns/1ns
 
module PWM_generator (
    input wire clk,
    input wire reset,
    input wire [7:0] PWM_ontime,
    output reg PWM_out
);

wire [7:0] counter_out;

always @(posedge clk) begin
    if (reset)
        PWM_out <= 0;
    else if (PWM_ontime > counter_out)
        PWM_out <= 1;
    else
        PWM_out <= 0;
end

counter counter_inst (
    .clk(clk),
    .reset(reset),
    .counter_out(counter_out)
);

endmodule

module counter (
    output reg [7:0] counter_out,
    input wire clk,
    input wire reset
);

always @(posedge clk) begin
    if (reset)
        counter_out <= 8'b0;
    else
        counter_out <= counter_out + 1;
end

endmodule
