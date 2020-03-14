`include"fulladder.v"
module RCA_4bit(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire c1,c2,c3;
fulladder fa0(a[0],b[0],cin,sum[0],w1);
fulladder fa1(a[0],b[0],w1,sum[1],w2);
fulladder fa2(a[0],b[0],w2,sum[2],w3);
fulladder fa3(a[0],b[0],w3,sum[3],cout);
endmodule
