module Flags (input clk,enabled,rst,C,Zeta, output C_out,Zeta_out); 

  wire clk,enabled,rst,C,Zeta;    
  reg C_out=0;
  reg Zeta_out=0;

  always @ (posedge clk)
    begin
      if(rst) 
        begin        
          C_out <= 0;
          Zeta_out <= 0;
        end
      else if (enabled==1) 
        begin       
          C_out <=  C;
          Zeta_out <=  Zeta;
        end
    end

endmodule