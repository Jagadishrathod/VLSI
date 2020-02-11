module regfile32x16 (clk,reset,write,wrAddr,wrData,rdAddrA,rdDataA,rdAddrB,rdDataB);

input clk;
input reset;
input write;
input [4:0] wrAddr;
input [31:0] wrData;
input [4:0] rdAddrA;
output [31:0] rdDataA;
input [4:0] rdAddrB;
output [31:0] rdDataB;

reg [31:0]  regfile [0:15];

   assign rdDataA = regfile[rdAddrA];
   assign rdDataB = regfile[rdAddrB];

   always @(posedge clk) begin
      if (reset) begin
	 regfile[0] <= 0;
	 regfile[1] <= 0;
	 regfile[2] <= 0;
	 regfile[3] <= 0;
	 regfile[4] <= 0;
	 regfile[5] <= 0;
	 regfile[6] <= 0;
	 regfile[7] <= 0;
	 regfile[8] <= 0;
	 regfile[9] <= 0;
	 regfile[10] <= 0;
	 regfile[11] <= 0;
	 regfile[12] <= 0;
	 regfile[13] <= 0;
	 regfile[14] <= 0;
	 regfile[15] <= 0;
     /*regfile[16] <= 0;
	 regfile[17] <= 0;
	 regfile[18] <= 0;
	 regfile[19] <= 0;
	 regfile[20] <= 0;
	 regfile[21] <= 0;
	 regfile[22] <= 0;
	 regfile[23] <= 0;
	 regfile[24] <= 0;
	 regfile[25] <= 0;
	 regfile[26] <= 0;
	 regfile[27] <= 0;
	 regfile[28] <= 0;
	 regfile[29] <= 0;
	 regfile[30] <= 0;
	 regfile[31] <= 0;*/
      end 
      else begin
	 if (write) regfile[wrAddr] <= wrData;
      end // else: !if(reset)
   end
endmodule
