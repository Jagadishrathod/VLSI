`include "mux.v"
`include "dff.v"
module shift(b,select,clk,reset,q);
input [3:0]b;
input [1:0] select;
input clk,reset;
output [3:0]q;
wire [3:0]w;


mux m0(q[0],1'b0,q[1],b[0],select,w[0]);
mux m1(q[1],q[0],q[2],b[1],select,w[1]);
mux m2(q[2],q[1],q[3],b[2],select,w[2]);
mux m3(q[3],q[2],1'b0,b[3],select,w[3]);


dff d0(w[0],clk,reset,q[0]);
dff d1(w[1],clk,reset,q[1]);
dff d2(w[2],clk,reset,q[2]);
dff d3(w[3],clk,reset,q[3]);

endmodule
