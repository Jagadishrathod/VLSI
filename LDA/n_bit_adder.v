`include "halfadder.v"
`include "fulladder.v"
module N_bit_adder(a,b,out);
parameter N=32;
input [N-1:0] a,b;
   output [N-1:0] out;
   wire  carry_out;
  wire [N-1:0] carry;
   genvar i;
   generate 
   for(i=0;i<N;i=i+1)
     begin: generate_N_bit_Adder
   if(i==0) 
  halfadder f(a[0],b[0],out[0],carry[0]);
   else
  fulladder f(a[i],b[i],carry[i-1],out[i],carry[i]);
     end
  assign carry_out = carry[N-1];
   endgenerate
endmodule 
