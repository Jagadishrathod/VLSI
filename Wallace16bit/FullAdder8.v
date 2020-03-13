`include "FullAdder4_2.v"

module FullAdder8 (A,B,Cin,Sum,Carry);

	input [7:0] A,B;
	input Cin;

	output [7:0] Sum;
	output Carry;
	wire w0;
	FullAdder4_2 uut_1 (A[3:0],B[3:0],Cin,Sum[3:0],w0);
	FullAdder4_2 uut_2 (A[7:4],B[7:4],w0,Sum[7:4],Carry);
	

endmodule
