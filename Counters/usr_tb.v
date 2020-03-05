`include "usr.v"

module top;

reg [3:0]q; 
reg [1:0]sum; 
reg clk,reset;
wire [3:0]out;

usr usr_tb(q,sum,clk,reset,out);

initial begin
	q = 4'b1011; sum = 2'b11; clk = 0; reset = 1'b1;
end

always begin
	#5 clk = !clk;
	reset = 1'b0;
end
always begin
	#10	sum = 2'b11;
	#10	sum = 2'b01;
	#10	sum = 2'b10;
	#10	sum = 2'b00;
end

initial begin
	$monitor($time, " q=%b, sum=%d, out=%b", q,sum,out);
	$dumpfile("usr.vcd");
	$dumpvars();
end

initial
#100
$finish;
endmodule	
