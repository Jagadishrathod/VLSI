`include "shift.v"

module top;

reg [3:0]b;
reg [1:0]select;
reg clk,reset;
wire [3:0]q;
//reg [3:0]q,q1;
initial
begin
	$monitor($time , "b=%b ,select=%b,clk=%d,q=%b",b,select,clk,q);

	$dumpfile("shift.vcd");
	$dumpvars;
end

shift s0(b,select,clk,reset,q);

initial
begin 
reset=1'b1;
clk =1'b0;
select=2'b11;
b=4'b1011;
end
always 
begin
#10  clk =  ! clk; 
reset=1'b0;
end
always
begin
#20 select=2'b11;
#20 select=2'b01;
#20 select=2'b10;
#20 select=2'b00;
end

initial
#100 
$finish;


endmodule
