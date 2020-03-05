`include "upDown.v"

module top;

reg t,c,clk,reset;
wire [2:0]q;

upDown upDown_tb(t,c,clk,reset,q);

initial begin
	t = 1'b1; c = 1'b0; clk = 0; reset = 1'b1;
end

always #5 reset = 1'b0;
always #5 clk = !clk;

initial begin
	$monitor($time, " t=%d, c=%d, clk=%d, q=%d, q[0]=%d, q[1]=%d, q[2]=%d",t,c,clk,q,q[0],q[1],q[2]);
	$dumpfile("upDown.vcd");
	$dumpvars;
end

initial #100 $finish;

endmodule
