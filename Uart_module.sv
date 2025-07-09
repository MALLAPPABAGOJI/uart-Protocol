//UART PROGRAMME 
   
   module uart_module(din,s0,s1,run,rx,tx,dout,done,err);
   input [7:0]din;
   input run;
   input rx;
   input s0,s1;
   output reg tx;
   output reg done;
   output reg err;
   output reg [7:0]dout;
   
   
   bit clk_in;
   always #(tp/2) clk_in =~clk_in;
   
   uart uart_block(tx,rx,clk_in,run,din,dout,done,err);
   
   assign tp = s1 ? (s0 ?(26) : (52) )  : (s0?(104): (208) ) ;
   
   
   endmodule
