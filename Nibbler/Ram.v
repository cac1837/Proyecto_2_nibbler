module Ram(input [11:0]add, input weRam,csRam, inout [3:0]out);

    wire [11:0]add;   
    wire weRam,csRam;
    reg [3:0] ram [0:4095];
    reg [3:0] data_out;

    assign out = (csRam&&!weRam) ? data_out : 4'bzzzz;

    always @ (add or out or csRam or weRam) 
    begin                                          
      if ((csRam==1) && (weRam==1))               
        begin
          ram[add]<=out;
        end
      else if ((csRam==1)&&(weRam==0)) 
        begin
          data_out<=ram[add];
        end
    end


endmodule
