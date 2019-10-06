`timescale 1ns / 1ps

module half_adder_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire S;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	half_adder uut (
		.a(a), 
		.b(b), 
		.S(S), 
		.c_out(c_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
   end
	
	
	always #1 a=~a;
	always #2 b=~b;
	
      
endmodule
