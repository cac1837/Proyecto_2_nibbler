module Acumulador (input clk,eneabled,rst, input [3:0]in, output [3:0]out);
  wire clk,eneabled,rst;
  wire [3:0]in;
  reg [3:0]out=0;
  always @ (posedge clk) //va a funcionar cada vez que reciba un clk o rst
    begin
      if(rst)  // =rst se reiniciara el contador
        begin
          out<= 0;
        end
      else if (eneabled==1) // indica si esta en uso
        begin
          out<=in;
        end
    end
endmodule
