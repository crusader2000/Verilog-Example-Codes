`timescale 1ns / 1ps

module half_adder(a,b,S,c_out);

  input a,b;
  output S,c_out;

xor f1(S,a,b);
and f2(c_out,a,b);

endmodule
