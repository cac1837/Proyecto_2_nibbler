module P_counter(input clk,enabled,rst,load, input [11:0]in, output [11:0]C); 

  wire clk,enabled,rst,load; 
  wire [11:0]in;
  reg [11:0]C=0;

  always @ (posedge clk)    
    begin
      if (load) 
        begin     
          C <= in;
        end
      else if(rst) 
        begin    
          C <= 0;
        end
      else if (enabled) 
        begin    
          C <= C+1;
        end
    end

endmodule