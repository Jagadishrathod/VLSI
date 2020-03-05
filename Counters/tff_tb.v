`include "tff.v"

module tff_tb;
reg t, clk, reset;
wire q;

initial
	begin
$dumpfile("tff_tb.vcd");
$dumpvars(0,tff_tb);
end

tff t1(t, clk, reset, q);


initial
begin
reset=1;
clk =0;
t=0;
end

always 
#5  clk =  ! clk; 

always #5  reset = 0;

always #10 t=~t;
/*
initial
begin
#5 reset =1'b0;
d=0;
#5 d = 1'b1;

end
*/

always@(*)
	begin
 		$display("t=%b, clk=%b, reset=%b,q=%b\n", t, clk, reset, q);
	end 

initial

	#100 $finish;
endmodule
