`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:36:46 10/21/2019
// Design Name:   serial_multiplier
// Module Name:   /mnt/windows/sem2-1/assgn5/serial_multiplier/serial_multiplier_tb.v
// Project Name:  serial_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: serial_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module serial_multiplier_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg clk;

	// Outputs
	wire [7:0] s;
	
	wire [3:0] i;

	// Instantiate the Unit Under Test (UUT)
	serial_multiplier uut (
		.a(a), 
		.b(b), 
		.clk(clk), 
		.s(s),
		.i(i)
		
	);

	initial begin
		a = 0;
		b = 0;
		clk = 0;
      //#75;
	end
	 integer k,j;
    initial begin
	 #75
        for(k=1;k <=15;k = k+1)
            for(j=1;j <=15;j = j+1) 
            begin
                a <= k; 
                b <= j;
                #80;
            end     
    end  
	
	
	always begin
	#5 clk=~clk;
	end
      
endmodule

