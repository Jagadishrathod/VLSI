`include "n_bit_adder.v"
module tb_N_bit_adder;
 // Inputs
 reg [31:0] a;
 reg [31:0] b;
 // Outputs
 wire [31:0] out;
integer f;
 // Instantiate the Unit Under Test (UUT)
 N_bit_adder uut (
  .a(a), 
  .b(b), 
  .out(out)
 );

 initial begin
  // Initialize Inputs
  f = $value$plusargs("x=%d",a);
  f = $value$plusargs("y=%d",b);
  #100;
//   $display("%d %d %d",a,b,out);
    f = $fopen("output.txt","w");
  #10 $fwrite(f,"%d",out);
  $fclose(f);
  // Add stimulus here
 end
      
endmodule
