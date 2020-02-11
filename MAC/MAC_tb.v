`include "MAC.v"

module top;

	reg [15:0] A,B;
	reg clk,reset;

	wire [35:0] out;

	MAC m(A,B,out,clk,reset);

	initial
	begin
		reset=1;
		clk = 0;
		
	end

	always 
	#5  clk =  !clk; 

	initial begin
		A = 16'd0; B = 16'd0;
		#10 reset=0;
		#10 A = 16'd12; B=16'd20; 
		#10 A = 16'd11; B=16'd5;
		#10 A = 16'd0; B=16'd0;
		#50 $finish;
	end

	initial
		$monitor($time,"   output A= %d B= %d out= %d",A,B,out);
endmodule
