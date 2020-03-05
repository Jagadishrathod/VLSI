module mux(a,b,c,d,select,out);

input a,b,c,d;
input [1:0]select;
output out;
reg out;

always@(a or b or c or d or select) begin
	case(select)
		2'b11: out <= d;
		2'b10: out <= c;
		2'b01: out <= b;
		2'b00: out <= a;
		
		
	endcase
end

endmodule
