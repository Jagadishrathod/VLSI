`include "wallace.v"
module wallace_tb;
wire [15:0] product;
integer f,k;
reg [7:0] x, y;

wallace w(x,y,product);
initial
begin
k= $value$plusargs("x=%d",x);
f= $value$plusargs("y=%d",y);
// $display("%d %d ",x,y);
end
initial begin
  f = $fopen("output.txt","w");
  #10 $fwrite(f,"%d",product);
  $fclose(f);
end



endmodule
