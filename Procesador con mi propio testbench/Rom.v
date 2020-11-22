module Rom (input wire [11:0] add, output wire [7:0] data); 

  reg [7:0] mem [0:4095];     
  assign data = mem[add];

  initial begin                       
    $readmemh("memory.list", mem);  
  end

endmodule
