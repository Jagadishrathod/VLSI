`include "CLA_4bit.v"
module CLA_16bit(a,b, cin, sum,cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;
wire w1,w2,w3;
CLA_4bit cla1 (a[3:0],b[3:0],cin,sum[3:0],w1);
CLA_4bit cla2 (a[7:4],b[7:4],w1,sum[7:4],w2);
CLA_4bit cla3 (a[11:8],b[11:8],w2,sum[11:8],w3);
CLA_4bit cla4(a[15:12],b[15:12],w3,sum[15:12],cout); 
endmodule

