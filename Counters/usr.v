`include "mux.v"
`include "dff.v"

module usr(q,sum,clk,reset,out);

input [3:0]q; 
input [1:0]sum;
input clk,reset;
output [3:0]out;
wire [3:0]w;

mux m0(out[0],1'b0,out[1],q[0],sum,w[0]);
mux m1(out[1],out[0],out[2],q[1],sum,w[1]);
mux m2(out[2],out[1],out[3],q[2],sum,w[2]);
mux m3(out[3],out[2],1'b0,q[3],sum,w[3]);

dff d0(w[0],clk,reset,out[0]);
dff d1(w[1],clk,reset,out[1]);
dff d2(w[2],clk,reset,out[2]);
dff d3(w[3],clk,reset,out[3]);

endmodule
