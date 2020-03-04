`include "registerfile.v"

module top;
reg [4:0] ReadRegister1,ReadRegister2,WriteRegister;
reg [15:0] WriteData;
reg [2:0]Sel;
wire [15:0] ReadData1,ReadData2;

RegisterFile uut_1(ReadRegister1, ReadRegister2, WriteRegister, WriteData,Sel, ReadData1, ReadData2);

initial begin

WriteRegister = 5'b0;
WriteData = 16'habcd;
Sel = 3'b001;
#10
ReadRegister1 = 5'b0;
WriteData = 16'h1234;
Sel = 3'b010;
#20
ReadRegister1 = 5'b0;
ReadRegister2 = 5'b0;
WriteData = 16'h0123;
Sel = 3'b011;
#30
WriteData = 16'h0110;
WriteRegister = 5'b0;
ReadRegister1 = 5'b0;
ReadRegister2 = 5'b0;
Sel = 3'b100;

end

initial
	begin
	$monitor($time, "\tWriteData = %h, WriteRegister=%b, ReadRegister1=%b,ReadData1=%h,ReadRegister2=%b,ReadData2=%h,Sel=%b",WriteData, WriteRegister, ReadRegister1,ReadData1,ReadRegister2,ReadData2,Sel);
#100 $finish;
end 

endmodule
