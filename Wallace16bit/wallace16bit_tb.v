`include "wallace16bit.v"
module top;
reg [15:0] A, B;
wire [31:0] out;
wallace16 uut(A, B, out);
initial begin
     #0  A = 16'd1012 ; 
         B = 16'd65535;
     #10 A = 16'd23 ; 
         B = 16'd23;
     #10 A = 16'd40000 ;
         B = 16'd65535;
    end
      
 initial
    $monitor($time," A == %d, B == %d  Output == %d",A,B,out);
endmodule
