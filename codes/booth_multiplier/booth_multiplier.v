module booth_multiplier (X, Y, Z);
       input signed [3:0] X, Y;
       output signed [7:0] Z;
       reg signed [7:0] Z;
       reg [1:0] temp;
       integer i;
       reg E1;
       reg [3:0] Y1;
       always @ (X, Y)
       begin
       Z = 0;
       E1 = 0;
		 
       for (i = 0; i < 4; i = i + 1)
       begin
       temp = {X[i], E1};
       Y1 = - Y;
     
       case (temp)
       2'd2 : Z [7 : 4] = Z [7 : 4] + Y;
       2'd1 : Z [7 : 4] = Z [7 : 4] + Y1;
       default : begin end
       endcase
       E1 = X[i];
       Z = Z >> 1;
       Z[7] = Z[6];
     
           end
			  Z=-Z;
			end
endmodule
