`include"CLA_16bit.v"
module top;
reg [15:0] a,b;
reg cin;
wire [15:0] sum;
wire cout;
 
CLA_16bit uut(a,b,cin,sum,cout);
 
initial begin
     a=16'b0000000000000000; b=16'b0000000000000000; cin=1'b0;
#10 a= 16'b0000000000011111; b=16'b000000000001100; cin=1'b0;
#10 a= 16'b0000000000011111; b=16'b000000000001100; cin=1'b0;
#10 a= 16'b1100011000011111; b=16'b000000110001100; cin=1'b1;
#10 a= 16'b1111111111111111; b=16'b000000000000000; cin=1'b1;
end
 
initial
$monitor($time," A= %b, B= %b,cin= %b, sum = %b,cout = %b", a,b,cin,sum,cout);
endmodule
