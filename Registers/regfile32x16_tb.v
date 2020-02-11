`include "regfile32x16.v"
module top;
reg [31:0] wrData;
reg [4:0] wrAddr;
reg [4:0] rdAddrA;
reg [4:0] rdAddrB;
reg write;
reg reset;
reg clk;
wire [31:0] rdDataA;
  wire [31:0] rdDataB;

regfile32x16 uut (.wrData(wrData), .wrAddr(wrAddr), .rdDataA(rdDataA), .rdAddrA(rdAddrA), .rdDataB(rdDataB), .rdAddrB(rdAddrB), .write(write), .reset(reset), .clk(clk) );
initial begin
  // Initialize Inputs
  wrData  = 32'h00010;
  wrAddr = 5'b0;
  rdAddrA  = 5'b00110;
  rdAddrB  = 5'b00100; 
  write  = 1'b0;
  reset  = 1'b1;
  clk  = 1'b0;
  #10;
   reset  = 1'b0;
   #20;
   wrAddr = 5'b1;
   wrData  = 32'habcd_efab;
   write  = 1'b1;
   #20;
   wrData  = 32'h0123_4567;
   write  = 1'b1;
   #20
   wrAddr = 5'b1;
   rdAddrA  = 5'b01000;
   rdAddrB  = 5'b00001;
   #10 $finish;
 end    
   always begin
  #10  clk = ~clk;
 end 
initial
        $monitor($time," wrData = %h,wrAddr = %h,rdDataA = %h, rdAddrA = %b, rdDataB = %h, rdAddrB = %b, write = %b, reset = %b, clk = %b",wrData, wrAddr, rdDataA, rdAddrA, rdDataB, rdAddrB, write, reset, clk );
       
endmodule
