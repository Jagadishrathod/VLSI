module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData,Sel, ReadData1, ReadData2);

	input [4:0] ReadRegister1,ReadRegister2,WriteRegister;
	input [15:0] WriteData;
	input [2:0]Sel;	
	output reg [15:0] ReadData1,ReadData2;
	reg [15:0] Registers [0:15];
	
	initial begin
		Registers[0] <= 16'h0000;
		Registers[1] <= 16'h0000;
		Registers[2] <= 16'h0000;
		Registers[3] <= 16'h0000;
		Registers[4] <= 16'h0000;
		Registers[5] <= 16'h0000;
		Registers[6] <= 16'h0000;
		Registers[7] <= 16'h0000;
		Registers[8] <= 16'h0000;
		Registers[9] <= 16'h0000;
		Registers[10] <= 16'h0000;
		Registers[11] <= 16'h0000;
		Registers[12] <= 16'h0000;
		Registers[13] <= 16'h0000;
		Registers[14] <= 16'h0000;
		Registers[15] <= 16'h0000;
		
end
	
	
	always @( * )
	begin
		
		if (Sel==001) 
		begin
			Registers[WriteRegister] <= WriteData;
		end
		else if(Sel==010)
		begin
			ReadData1 <= Registers[ReadRegister1];
		end
		else if(Sel==011)
		begin
			ReadData1 <= Registers[ReadRegister1];
			ReadData2 <= Registers[ReadRegister2];
		end
		else if(Sel==100)
		begin
			Registers[WriteRegister] <= WriteData;
			ReadData1 <= Registers[ReadRegister1];
			ReadData2 <= Registers[ReadRegister2];
		end
	end
endmodule
