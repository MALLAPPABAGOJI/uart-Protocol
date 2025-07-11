//parity detector 
  
  module parity_detector();
  reg[7:0]data;
  bit even_parity;
  bit rx_parity;
  bit err;
  
   
   
   initial begin 
  data =8'bd1001_1001;
  even_parity =^(data);
  
  err=(rx_parity ^even_parity);
  $display("err=%0b",err);
   
   
   
   #10;$finish();
   
   end 
   endmodule
