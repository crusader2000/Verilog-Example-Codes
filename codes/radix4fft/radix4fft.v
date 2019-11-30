module radix4fft(
	input [3:0] x_0,x_1,x_2,x_3,
	output [3:0] X_real_0,X_real_1,X_real_2,X_real_3,
	output [3:0] X_imag_0,X_imag_1,X_imag_2,X_imag_3	
);

assign X_real_0=x_0-x_2;
assign X_imag_0=x_1-x_3;

assign X_real_1=x_0+x_1+x_2+x_3;
assign X_imag_1=0;

assign X_real_2=x_0-x_2;
assign X_imag_2=x_3-x_1;

assign X_real_3=x_0-x_1+x_2-x_3;
assign X_imag_3=0;

endmodule