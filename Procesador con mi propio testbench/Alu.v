module Alu(input [2:0]S, input [3:0]A,B, output C,Zeta, output [3:0]Y);    

  wire [2:0]S;                     
  wire [3:0]A,B;
  reg [3:0]Y;
  reg C=0;
  reg Zeta=0;

  always @ (*)            
    begin                 
      if(S==0)  // si es 000 su salida es A
        begin            
          Y<=A;
          C<=0;
          Zeta= (Y == 0);
        end
      else if (S==2)  // si es 001 su salida es B 
        begin                
          Y<=B;
          C<=0;
          Zeta= (Y == 0);
        end
      else if (S==3)  // si es 010 su salida es la suma de A y B, si existe un overflow agrega un 1 y si no es asi se mantiene en 0
        begin               
          Y<=(A+B);
          Zeta= (Y == 0);
              if((A+B)>15)   
              begin
                C<=1;
              end
            else          
              begin
                C<=0;
              end
        end
      else if (S==1)  // si es 011 compara A y B
        begin             
          Y<=(A-B);
          if (A==B) 
            begin
              Zeta = (Y == 0);         
              C<=0;
            end
          else if (A>B) 
            begin
              Zeta= (Y == 0);
              C<=0;
            end
          else 
            begin
              C<=1;
              Zeta= (Y == 0);
            end
        end
      else if (S==4)         
        begin
          Y<=(~(A&B));    
          C<=0;
          Zeta= (Y == 0);
        end
      else 
        begin
          Y<=Y;     
          C<=0;
          Zeta= (Y == 0);
        end
    end

endmodule
