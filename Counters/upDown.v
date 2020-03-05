`include "tff.v"

module upDown(t,c,clk,reset,q);

input t,c,clk,reset;
output [2:0]q;
wire and0,and1,or0,and2,and3,or1,c1;

assign c1 = ~c;

tff t0(t,clk,reset,q[0]);
	assign and0 = c1 & q[0];
	assign and1 = c & ~q[0];
	assign or0 = and0 | and1;
tff t1(or0,clk,reset,q[1]);
	assign and2 = and0 & q[1];
	assign and3 = and1 & ~q[1];
	assign or1 = and2 | and3;
tff t2(or1,clk,reset,q[2]);

endmodule
