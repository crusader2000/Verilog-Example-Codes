`timescale 1ns / 1ps
module bit_1_full_adder_tb;
	reg a_i;
	reg b_i;
	reg c_i_1;
	wire s_i;
	wire c_i;
	parameter stop_time =2000;

	bit_1_full_adder uut (
		.a_i(a_i), 
		.b_i(b_i), 
		.c_i_1(c_i_1), 
		.s_i(s_i), 
		.c_i(c_i)
	);

	initial #stop_time $finish;
	initial begin
		a_i = 0;
		b_i = 0;
		c_i_1 = 0;
	end
	
	always begin
	#5 a_i=~a_i;
	end
	
	always begin
	#10 b_i=~b_i;
	end
	
	always begin
	#15 c_i_1=~c_i_1;
	end
	
      
endmodule

