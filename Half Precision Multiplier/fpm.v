`include "wallace16bit.v"
module floatingpoint_Multiplier(a,b,sign,sum,exp_sum,prod,exponent,exp_unbiased);
input [15:0]a,b;
output sign;
output [4:0] exponent,exp_unbiased;
output [9:0] prod;
output [5:0] exp_sum;
output [15:0]sum;

reg sign_a,sign_b;
reg [4:0] exp_a,exp_b;
reg [4:0] exp_bias_a,exp_bias_b;
reg [5:0] exp_sum;
reg [9:0] manti_a,manti_b;
reg [35:0] prod_res;
reg [9:0] prod;
reg [4:0] exponent,exp_unbiased;
reg sign;
reg [15:0] sum;

always @(a or b)
	begin
	sign_a = a[15];
	sign_b = b[15];
	exp_a = a[14:10];
	exp_b = b[14:10];
	manti_a = a[9:0];
	manti_b = b[9:0];
	//add bias
	exp_bias_a = exp_a + 5'b00010;
	exp_bias_b = exp_b + 5'b00010;
	//add exponents
	exp_sum = exp_bias_a + exp_bias_b;
	//remove one bias
	exponent = exp_sum - 5'b00010;
	exp_unbiased = exponent - 5'b00010;

	//multipy
	prod_res = manti_a * manti_b;
	prod = prod_res[0:35];

while(prod[14] == 0)
begin

prod = prod << 1;
exp_unbiased = exp_unbiased - 1;
end

sign = sign_a ^ sign_b;
if (prod ==0) begin 
    sum =16'b0;
		end	
else sum ={sign, exp_unbiased, prod};
	end		
endmodule

