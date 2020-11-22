module Buffer(input eneabled, input [3:0]in, output [3:0]out);
  wire eneabled;
  wire [3:0]in;
  reg [3:0]out;
  always @ (*)
  begin
    if (eneabled)
      begin
        out[3:0]<=in[3:0];
      end
    else
      begin
        out[3:0]<=4'bzzzz;
      end
  end
endmodule