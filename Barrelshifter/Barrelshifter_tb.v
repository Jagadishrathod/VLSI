`include "Barrelshifter.v"
module top;
wire [15:0] Y;
reg [15:0] A;
reg [3:0] S;
reg Sel;
Barrel_Shifter_16 uut(Y, A,Sel, S);
initial
    begin
    A= 16'b1111111111111111;
    S = 4'b0010;
    Sel= 0;
    #10;
    Sel=0;  //left shift
    S =4'b0100;
    #10;
    Sel=1;
    S=4'b1000;
     end
initial
    $monitor($time," A == %b, S == %d,Output: %b",A,S,Y);
endmodule
