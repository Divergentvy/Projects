module lfsr (out, clk, rst);

  output reg [7:0] out;
  input clk, rst;

  wire feedback;

  assign feedback = (out[3] ^ out[2] ^ out[5]);

  always @(posedge clk or posedge rst)
  begin
    if (rst)
     out <= 8'b00000001; // random seed
    else
      out <= {out[6:0], feedback};
  end
endmodule
