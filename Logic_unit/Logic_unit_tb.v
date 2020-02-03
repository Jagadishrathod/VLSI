`include "Logic_unit.v"
module top;
reg [15:0] A,B;
reg [3:0] Opcode;
wire [15:0] Result;
wire Sel;

Logic_unit LU0(Opcode,A,B,Result,Sel);
initial 
begin
    A = 16'b1111111111111100;
    B = 16'b1001111111111111;
    Opcode = 4'b1000;
    #10;
end
initial
        $monitor($time," A == %b, B == %b, Opcode == %b, output == %b",A,B,Opcode,Result);
endmodule

