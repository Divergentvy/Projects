`timescale 1ns / 1ps

module Ddice(
    input clk, rst, rb,
    input [3:0] sum,
    output reg roll, win, lose,
    output reg [2:0] next_state,
    output reg [3:0] prev_sum
);

    reg [2:0] state;

    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;
    parameter s5 = 3'b101;

    initial begin
        win = 0;
        lose = 0;
        roll = 0;
        next_state = s0;
        state = s0;
        prev_sum = 0;
    end

    always @* begin
        win = 0;
        lose = 0;
        roll = 0;
        next_state = state;
        
        case(state)
            s0: begin
                win = 0;
                lose = 0;
                roll = 0;
                if (rb == 1)
                    next_state = s1;
                else
                    next_state = s0;
            end
            s1: begin
                if (rb == 1) begin
                    roll = 1;
                    if (sum == 3 || sum == 6 || sum == 9) begin
                        next_state = s2;
                    end else if (sum == 2 || sum == 8 || sum == 11) begin
                        next_state = s3;
                    end else begin
                        next_state = s4;
                    end
                end
            end
            s2: begin
                win = 1;
                if (rst == 1)
                    next_state = s0;
            end
            s3: begin
                lose = 1;
                if (rst == 1)
                    next_state = s0;
            end
            s4: begin
                if (rb == 1) begin
                    prev_sum = sum;
                    next_state = s5;
                end
            end
            s5: begin
                if (rb == 1) begin
                    roll = 1;
                    if (sum == 3 || sum == 6 || sum == 9) begin
                        lose = 1;
                        next_state = s3;
                    end else if (prev_sum == sum) begin
                        win = 1;
                        next_state = s2;
                    end else begin
                        prev_sum = sum;
                        next_state = s4;
                    end
                end
            end
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

endmodule
