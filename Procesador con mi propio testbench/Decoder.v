module Decoder(input phase,C,Zeta, input [3:0]in, output [12:0]out);
  wire phase,C,Zeta;
  wire [3:0]in;
  reg [12:0]carry=0;
  assign out = carry;
  always @ (phase or C or Zeta or in)
  begin
    if (phase==0)
      begin                               // ANY //
        carry  = 13'b1000000001000;
      end
    else
      begin
        if (in==4'b0000 && C==1)
          begin
            carry  <= 13'b0100000001000;    // JC CARRY_1//
          end
        else if (in==4'b0000 && C==0)
          begin
            carry  = 13'b1000000001000;     //JC CARRY_0
          end
        else if (in==4'b0001 && C==1)
          begin
            carry  = 13'b1000000001000;     //JNC  CARRY _1
          end
        else if (in==4'b0001 && C==0)
          begin
            carry  = 13'b0100000001000;     //JNC  CARRY_0
          end
        else if (in==4'b0010)
          begin
            carry  = 13'b0001001000010;     // CMPI
          end
        else if (in==4'b0011)
          begin
            carry  = 13'b1001001100000;   // CMPM
          end
        else if (in==4'b0100)
          begin
            carry  = 13'b0011010000010;   // LIT
          end
        else if (in==4'b0101)
          begin
            carry  = 13'b0011010000100;   // IN
          end
        else if (in==4'b0110)
          begin
            carry  = 13'b1011010100000;   // LD
          end
        else if (in==4'b0111)
          begin
            carry  = 13'b1000000111000;   //ST
          end
        else if (in==4'b1000 && Zeta==1)
          begin
            carry  = 13'b0100000001000;   //JZ Z_1
          end
        else if (in==4'b1000 && Zeta==0)
          begin
            carry  = 13'b1000000001000;   //JZ Z_0
          end
        else if (in==4'b1001 && Zeta==1)
          begin
            carry  = 13'b1000000001000;   // JNZ Z_1
          end
        else if (in==4'b1001 && Zeta==0)
          begin
            carry  = 13'b0100000001000;   // JNZ Z_0
          end
        else if (in==4'b1010)
          begin
            carry  = 13'b0011011000010;   // ADDI
          end
        else if (in==4'b1011)
          begin
            carry  = 13'b1011011100000;   // ADDM
          end
        else if (in==4'b1100)
          begin
            carry  = 13'b0100000001000;   // JMP
          end
        else if (in==4'b1101)
          begin
            carry  = 13'b0000000001001;   //OUT
          end
        else if (in==4'b1110)
          begin
            carry  = 13'b0011100000010;   //NANDI
          end
        else if (in==4'b1111)
          begin
            carry  = 13'b1011100100000;   //NANDM
          end
      end
  end
endmodule
