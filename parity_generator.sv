//parity generator block 
  
  module parity_gen();
  reg[7:0]data;
  bit Even_parity=0;
  initial begin 
  data =8'bd1001_1001;
  
  even_parity =^(data);
  $display("even_parity=%0b",even_parity);
  #10; $finish();
  end 
endmodule
  
