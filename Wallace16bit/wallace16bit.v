`include "wallace.v"
`include "FullAdder8.v"

module wallace16 (A,B,out);

	input [15:0] A,B;
	output [31:0] out;
	wire [15:0] w1,w2,w3,w4;
	
	Wallace uut1 (A[7:0],B[7:0],w1); 
	Wallace uut2 (A[15:8],B[7:0],w2);
	Wallace uut3 (A[7:0],B[15:8],w3);
	Wallace uut4 (A[15:8],B[15:8],w4);

	assign out[7:0] = w1[7:0];
	
	wire c1,c2,c3,c4;
	wire [7:0] temp1,temp2;
	
	FullAdder8 F1 (w1[15:8],w2[7:0],1'b0,temp1,c1);
	FullAdder8 F2 (temp1,w3[7:0],1'b0,out[15:8],c2);

	FullAdder8 F3 (w2[15:8],w3[15:8],c1,temp2,c3);
	FullAdder8 F4 (temp2,w4[7:0],c2,out[23:16],c4);

	wire [7:0] ca1;
	assign ca1[0] = c3;
	assign ca1[7:1] = 7'd0;
	
	FullAdder8 F5 (w4[15:8],ca1,c4,out[31:24],c5);
endmodule
