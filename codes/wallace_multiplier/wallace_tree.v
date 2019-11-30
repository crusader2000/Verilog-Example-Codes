`timescale 1ns / 1ps
module full_adder(
	input a_i,
	input b_i,
	input c_i_1,
	output s_i,
	output c_i
	);
wire mid=a_i^b_i;
assign s_i=mid^c_i_1;
assign c_i=( mid & c_i_1 )|(a_i & b_i);
endmodule

module half_adder(
	input a_i,
	input b_i,
	output s_i,
	output c_i
	);
assign s_i=a_i^b_i;
assign c_i=a_i & b_i;
endmodule

module bit_4_carry_lookahead(
	input [3:0] a,
	input [3:0] b,
	input c_0,
	output [3:0] s,
	output c_4
	);

wire [3:0] g;
wire [3:0] p;
wire c_1;
wire c_2;
wire c_3;

assign g[0]= a[0] & b[0];
assign g[1]= a[1] & b[1];
assign g[2]= a[2] & b[2];
assign g[3]= a[3] & b[3];

assign p[0]= a[0] ^ b[0];
assign p[1]= a[1] ^ b[1];
assign p[2]= a[2] ^ b[2];
assign p[3]= a[3] ^ b[3];


assign s[0]= p[0] ^ c_0;
assign c_1= (c_0 & p[0]) | g[0];

assign s[1]= p[1] ^ c_1;
assign c_2= (c_1 & p[1]) | g[1];

assign s[2]= p[2] ^ c_2;
assign c_3= (c_2 & p[2]) | g[2];

assign s[3]= p[3] ^ c_3;
assign c_4= (c_3 & p[3]) | g[3];	
endmodule

module wallace_tree(
	input [3:0] x,
	input [3:0] y,
	output [7:0] s,
	output c_8
	);
wire [7:0] a;
wire [7:0] b;
wire c_0;
wire c_4;

assign c_0=0;
assign a[0] = x[0] & y[0];
assign b[0] = 0;

assign a[1] = x[1] & y[0];
assign b[1] = x[0] & y[1];

half_adder qx8(x[2]& y[0], x[1] & y[1],a[2],b[3]);
assign b[2] = x[0] & y[2];

wire temp1,temp2;
full_adder qx1(x[3]&y[0],x[2]&y[1],x[1] &y[2],temp1,temp2);
half_adder qx2(temp1,x[0]&y[3],a[3],b[4]);
//b[3] already allocated above

wire temp3,temp4;
full_adder qx3(x[3]&y[1],x[2]&y[2],x[1]&y[3],temp3,temp4);
half_adder qx4(temp3,temp2,a[4],b[5]);
//b[5] already allocated above

wire temp5,temp6;
half_adder qx5(x[3]&y[2],x[2]&y[3],temp5,temp6);
half_adder qx6(temp5,temp4,a[5],b[6]);
//b[6] already allocated above

half_adder qx7(x[3]&y[3],temp6,a[6],b[7]);
//b[6] already allocated above

assign a[7]=0;

bit_4_carry_lookahead ux1(a[3:0],b[3:0],c_0,s[3:0],c_4);
bit_4_carry_lookahead ux2(a[7:4],b[7:4],c_4,s[7:4],c_8);

endmodule