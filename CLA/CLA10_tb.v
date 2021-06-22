`include"CLA10.v"
module top;
  wire [9:0] sum;
  wire cout;
  reg [9:0] a, b;
  reg cin;
  
  CLA10 cla10(a,b,cin,sum,cout);
  
  initial
  begin
    $display("a|b||cout|sum");
  end
  
  initial
  begin
    $monitor("%b|%b||%b|%b", a[9:0], b[9:0], cout, sum[9:0]);
  end
  
  initial
  begin
    a=10'b1111101000; b=10'b1111000000;
    #10    a=10'b1111101000; b=10'b1111000100;
    #10    a=10'b0011100000; b=10'b1001000000;
    #10    a=10'b1100001000; b=10'b1011000000;

  end

endmodule

