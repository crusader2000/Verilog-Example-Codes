`timescale 1ns / 1ps


module booth_multiplier_tb;

	// Inputs
	reg [3:0] X;
	reg [3:0] Y;

	// Outputs
	wire [7:0] Z;

	// Instantiate the Unit Under Test (UUT)
	booth_multiplier uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);
initial #100 $finish;

	initial begin
X=0;
Y=0;
	end
    integer i,j;
    initial begin
        for(i=1;i <=15;i = i+1)
            for(j=1;j <=15;j = j+1) 
            begin
                X <= i; 
                Y <= j;
                #1;
            end     
    end  
endmodule

