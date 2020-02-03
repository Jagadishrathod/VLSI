module Barrel_Shifter_16(Y, A, Sel,S);
   output [15:0] Y;  // The shifted result.
   input [15:0]  A;  // The value to be shifted.
   input [3:0] 	 S;  // The amount to shift.

    input Sel;      //0 for left shift
    wire [15:0] Y_right, Y_left;

   multiplexer_16_4 #(1) mux0(Y_right[0],A[0],A[1],A[2],A[3],A[4],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],S[3],S[2],S[1],S[0]);//16
   multiplexer_16_4 #(1) mux1(Y_right[1],A[1],A[2],A[3],A[4],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,S[3],S[2],S[1],S[0]);//15
   multiplexer_16_4 #(1) mux2(Y_right[2],A[2],A[3],A[4],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,S[3],S[2],S[1],S[0]);//14
   multiplexer_16_4 #(1) mux3(Y_right[3],A[3],A[4],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//13
   multiplexer_16_4 #(1) mux4(Y_right[4],A[4],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//12
   multiplexer_16_4 #(1) mux5(Y_right[5],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//11
   multiplexer_16_4 #(1) mux6(Y_right[6],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//10
   multiplexer_16_4 #(1) mux7(Y_right[7],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//9
   multiplexer_16_4 #(1) mux8(Y_right[8],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//8
   multiplexer_16_4 #(1) mux9(Y_right[9],A[9],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//7
   multiplexer_16_4 #(1) mux10(Y_right[10],A[10],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//6
   multiplexer_16_4 #(1) mux11(Y_right[11],A[11],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//5
   multiplexer_16_4 #(1) mux12(Y_right[12],A[12],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//4
   multiplexer_16_4 #(1) mux13(Y_right[13],A[13],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//3
   multiplexer_16_4 #(1) mux14(Y_right[14],A[14],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//2
   multiplexer_16_4 #(1) mux15(Y_right[15],A[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//1

    //left side
    
   multiplexer_16_4 #(1) mux16(Y_left[0],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//1
   multiplexer_16_4 #(1) mux17(Y_left[1],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//2
   multiplexer_16_4 #(1) mux18(Y_left[2],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//3
   multiplexer_16_4 #(1) mux19(Y_left[3],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//4
   multiplexer_16_4 #(1) mux20(Y_left[4],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//5
   multiplexer_16_4 #(1) mux21(Y_left[5],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//6
   multiplexer_16_4 #(1) mux22(Y_left[6],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//7
   multiplexer_16_4 #(1) mux23(Y_left[7],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//8
   multiplexer_16_4 #(1) mux24(Y_left[8],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//9
   multiplexer_16_4 #(1) mux25(Y_left[9],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//10
   multiplexer_16_4 #(1) mux26(Y_left[10],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//118
   multiplexer_16_4 #(1) mux27(Y_left[11],A[11],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//12
   multiplexer_16_4 #(1) mux28(Y_left[12],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,1'b0,S[3],S[2],S[1],S[0]);//13
   multiplexer_16_4 #(1) mux29(Y_left[13],A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,1'b0,S[3],S[2],S[1],S[0]);//14
   multiplexer_16_4 #(1) mux30(Y_left[14],A[14],A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],1'b0,S[3],S[2],S[1],S[0]);//15
   multiplexer_16_4 #(1) mux31(Y_left[15],A[15],A[14],A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0],S[3],S[2],S[1],S[0]);//16

  assign Y = (Sel==1'b0) ? Y_left  : Y_right;

endmodule 

module multiplexer_16_4(X, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, S3, S2, S1, S0);
   parameter WIDTH=16;     // How many bits wide are the lines
   output [WIDTH-1:0] X;   // The output line
   input [WIDTH-1:0]  A15;  // Input line with id 4'b1111
   input [WIDTH-1:0]  A14;  // Input line with id 4'b1110
   input [WIDTH-1:0]  A13;  // Input line with id 4'b1101
   input [WIDTH-1:0]  A12;  // Input line with id 4'b1100
   input [WIDTH-1:0]  A11;  // Input line with id 4'b1011
   input [WIDTH-1:0]  A10;  // Input line with id 4'b1010
   input [WIDTH-1:0]  A9;   // Input line with id 4'b1001
   input [WIDTH-1:0]  A8;   // Input line with id 4'b1000
   input [WIDTH-1:0]  A7;   // Input line with id 4'b0111
   input [WIDTH-1:0]  A6;   // Input line with id 4'b0110
   input [WIDTH-1:0]  A5;   // Input line with id 4'b0101
   input [WIDTH-1:0]  A4;   // Input line with id 4'b0100
   input [WIDTH-1:0]  A3;   // Input line with id 4'b0011
   input [WIDTH-1:0]  A2;   // Input line with id 4'b0010
   input [WIDTH-1:0]  A1;   // Input line with id 4'b0001
   input [WIDTH-1:0]  A0;   // Input line with id 4'b0000
   input S3;   // Most significant selection bit
   input S2;   
   input S1;   
   input S0;   // Least significant selection bit
   
   assign X = (S3 == 0 
	       ? (S2 == 0 
		  ? (S1 == 0 
		     ? (S0 == 0 
			? A0       // {S3,S2,S1,S0} = 4'b0000
			: A1)      // {S3,S2,S1,S0} = 4'b0001
		     : (S0 == 0 
			? A2       // {S3,S2,S1,S0} = 4'b0010
			: A3))     // {S3,S2,S1,S0} = 4'b0011
		  : (S1 == 0 
		     ? (S0 == 0 
			? A4       // {S3,S2,S1,S0} = 4'b0100
			: A5)      // {S3,S2,S1,S0} = 4'b0101
		     : (S0 == 0 
			? A6       // {S3,S2,S1,S0} = 4'b0110
			: A7)))    // {S3,S2,S1,S0} = 4'b0111
	       : (S2 == 0 
		  ? (S1 == 0 
		     ? (S0 == 0 
			? A8       // {S3,S2,S1,S0} = 4'b1000
			: A9)      // {S3,S2,S1,S0} = 4'b1001
		     : (S0 == 0 
			? A10      // {S3,S2,S1,S0} = 4'b1010
			: A11))    // {S3,S2,S1,S0} = 4'b1011
		  : (S1 == 0 
		     ? (S0 == 0 
			? A12      // {S3,S2,S1,S0} = 4'b1100
			: A13)     // {S3,S2,S1,S0} = 4'b1101
		     : (S0 == 0 
			? A14      // {S3,S2,S1,S0} = 4'b1110
			: A15)))); // {S3,S2,S1,S0} = 4'b1111
endmodule // multiplexer_16_4
