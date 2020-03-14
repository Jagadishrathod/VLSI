`include "multi.v"
module mul_tb;
reg [15:0]a,b;
wire sign;
wire [4:0] exponent,exp_unbiased;
wire [9:0] prod;
wire [5:0] exp_sum;
wire [15:0]sum;

floatingpoint_Multiplier fpm(a,b,sign,sum,exp_sum,prod,exponent,exp_unbiased);

initial
begin
	a=16'b0_10000_1000000000;
	b=16'b1_10000_1000000000; 
#10 $finish();
end
initial begin
//instantiate the module into the test bench
$monitor ("sign = %b, exp_biased = %b, exp_unbiased = %b,prod = %b", sign, exp_sum, exp_unbiased, prod);
	end
endmodule
