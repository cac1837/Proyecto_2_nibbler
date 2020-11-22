module Fetch (input clk,enabled,rst, input [7:0]D_in, output [7:0]D_out); 

  wire clk,enabled,rst; 
  wire [7:0]D_in;
  reg [7:0]D_out=0;

  always @ (posedge clk or posedge rst)
    begin
      if(rst) 
        begin           
          D_out <= 0;
        end
      else if (enabled) 
        begin    
          D_out <= D_in;
        end
    end

endmodule