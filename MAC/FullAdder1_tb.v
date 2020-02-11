module top;
reg A,B,Cin;
wire sum,C;
FullAdder t1(A,B,Cin,sum,C);
initial begin
A=0;
B=0;
Cin=0;
#5;
A=0;
B=0;
Cin=1;
#5;
A=0;
B=1;
Cin=0;
#5;
A=0;
B=1;
Cin=1;
#5;
A=1;
B=0;
Cin=0;
#5;
A=1;
B=0;
Cin=1;
#5;
A=1;
B=1;
Cin=0;
#5;
A=1;
B=1;
Cin=1;
#5;
end
initial begin
$display("A=%d,B=%d,Cin=%d,sum=%d,C=%d,",A,B,Cin,sum,C);
end
endmodule
