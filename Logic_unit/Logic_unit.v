module Logic_unit( Opcode,A,B,Result,Sel);
input [3:0]  Opcode;
input [15:0] A,B;
output reg [15:0] Result = 16'b0;
output reg Sel = 1'b0;

parameter  [3:0] AND = 4'b1000,
                 NAND = 4'b1001,
				 NOR = 4'b1010,
				 OR = 4'b1011,
                 NOT = 4'b1100,
                 XOR = 4'b1101,    
				 XNOR = 4'b1110,
				 NEG = 4'b1111; //2'complement
always @ (Opcode or A or B)
begin
case (Opcode)
    AND: begin
        Result = A & B;
        Sel  = (Result == 16'b0);
    end
      
    NAND: begin
        Result = ~(A & B);
        Sel  = (Result == 16'b0);
    end
      
    NOR: begin
        Result = ~(A | B);
        Sel  = (Result == 16'b0);
    end
      
    OR: begin
        Result = A | B;
        Sel  = (Result == 16'b0);
    end

    NOT: begin
        Result = ~A;
        Sel = (Result ==16'b0);
    end

    XOR: begin
        Result = A ^ B;
        Sel  = (Result == 16'b0);
     end
      
    XNOR: begin
        Result = A ~^ B;
        Sel = (Result == 16'b0);
    end

    NEG: begin
        Result = ~A+1;
        Sel = (Result == 16'b0);
    end
     
    default: begin
        Result = 16'b0;
        Sel  = 1'b0;
    end
endcase
end
endmodule
