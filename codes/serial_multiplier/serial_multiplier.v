module serial_multiplier(
	input [3:0] a,
	input [3:0] b,
	input clk,
	output reg [7:0] s,
	output reg [3:0] i
);
//integer i=0;
reg c1,c2,c3,c4;
reg s1,s2,s3,s4;
reg temp1,temp2,temp3,temp4;
initial begin
	s=0;
	i=0;
end
always @(posedge clk) begin
	if (i==7) begin
		s=0;
		i=0;
	end
	else begin
		if(i==0) begin
		s1=a[0]&b[0];
		c1=0;
		s2=a[1]&b[0];
		c2=0;
		s3=a[2]&b[0];
		c3=0;
		s4=a[3]&b[0];
		c4=0;		
		end
		else if(i<4) begin
		temp1=s1;
		s1=(a[0]&b[i])^temp1;
		c1=(a[0]&b[i])&temp1;
		temp2=s2;
		s2=(a[1]&b[i])^temp2^c1;
		c2=((a[1]&b[i])^temp2)&c1 | (a[1]&b[i])&temp2;
		temp3=s3;
		s3=(a[2]&b[i])^temp3^c2;
		c3=((a[2]&b[i])^temp3)&c2 | (a[2]&b[i])&temp3;
		temp4=s4;
		s4=(a[3]&b[i])^temp4^c3;
		c4=((a[3]&b[i])^temp4)&c3 | (a[3]&b[i])&temp4;
		end
		s[i]=s1;
		s1=s2;
		s2=s3;
		s3=s4;
		s4=c4;
		i=i+1;
	end
end
endmodule
