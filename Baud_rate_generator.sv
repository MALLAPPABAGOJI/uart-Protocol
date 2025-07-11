module baud_generator(s0,s1,clk_in);
  input s0, s1;
 output clk_in;
  int tp;
  always #(tp/2) clk_in =~clk_in;
  assign tp = s1 ? (s0 ?(26) : (52) )  : (s0?(104): (208) ) ;
  endmodule 
  
  



  testbench module for baud_generator

 
  `timescale 1us/1us 
  `include "baude_generator.sv"
  module tb();
  logic s0,s1;
  baud_generator dut(s0,s1);
  initial begin 
  s1=0; s0 = 0; #100;
  s1=0; s0 = 1; #100;
  s1=1; s0 = 0; #100;
  s1=1; s0 = 1; #100;
  #100; $finish();
  end 
  endmodule 
