`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:57:10 10/08/2019
// Design Name:   wallace_tree
// Module Name:   /home/ansh/Desktop/classes/sem2-1/vlsi design/assgn4/wallace_tree/wallace_tree_tb.v
// Project Name:  wallace_tree
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wallace_tree
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wallace_tree_tb;

	// Inputs
	reg [3:0] x;
	reg [3:0] y;

	// Outputs
	wire [7:0] s;
	wire c_8;

	// Instantiate the Unit Under Test (UUT)
	wallace_tree uut (
		.x(x), 
		.y(y), 
		.s(s), 
		.c_8(c_8)
	);

initial #100 $finish;
	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;
		
	end
	integer i,j;
    initial begin
        for(i=1;i <=15;i = i+1)
            for(j=1;j <=15;j = j+1) 
            begin
                x <= i; 
                y <= j;
                #1;
            end     
    end
endmodule

