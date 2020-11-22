module Phase_module (input clk,rst, output out); 

reg out = 0;      

always @ (posedge clk)
  begin
    out <= ~out;      
  end

endmodule
