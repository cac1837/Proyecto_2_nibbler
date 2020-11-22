module uP( input clock,reset, input [3:0]pushbuttons, output phase,c_flag,z_flag, output [3:0] instr,oprnd,data_bus,FF_out,accu, output [7:0] program_byte, output [11:0] PC, address_RAM);
  /*instr es la salida del fetch con bits mas significativos
  oprnd es la salida del fetch con bits menos significativos
  data_bus 1 es la salida del buffer 1
  FF_out es la salida del flip flop 
  accu es la salida del acumulador
  program byte es la salida del rom
  pc es la salida de el program counter*/

    wire [2:0]Y;
    wire [3:0]ALU_out;
    wire [7:0]out_fetch;
    wire [12:0]dato_out;
    wire incPC,loadPC,loadA,loadflags,csRAM,weRAM,oeALU,oeIN,oeOprnd,loadOut,C,Zeta;
    assign address_RAM[11:8] = oprnd;
    assign address_RAM[7:0] = program_byte;
    assign csRAM = dato_out[5];
    assign instr = out_fetch[7:4]; 
    assign incPC = dato_out[12];
    assign loadA = dato_out[10];
    assign loadflags = dato_out[9];
    assign loadOut = dato_out[0];
    assign loadPC = dato_out[11];
    assign oprnd = out_fetch[3:0];
    assign oeALU = dato_out[3];
    assign oeIN = dato_out[2];
    assign oeOprnd = dato_out[1];
    assign Y = dato_out[8:6];
    assign weRAM = dato_out[4];

  Acumulador       accumulator (clock,loadA,reset,ALU_out,accu);
  Alu              alu (Y,accu,data_bus,C,Zeta,ALU_out);
  Buffer           buffer_alu (oeALU,ALU_out,data_bus);
  Buffer           buffer_fetch (oeOprnd,oprnd,data_bus);
  Buffer           buffer_in (oeIN,pushbuttons,data_bus);
  Decoder          decoder (phase,c_flag,z_flag,instr,dato_out);
  Fetch            fetch  (clock,~phase,reset,program_byte,out_fetch);
  Flags            flags_module (clock,loadflags,reset,C,Zeta,c_flag,z_flag);
  P_counter        program_counter (clock,incPC,reset,loadPC,address_RAM,PC);
  Phase_module     Phase_module (clock,reset,phase);
  Ram              ram (address_RAM,weRAM,csRAM,data_bus);
  Rom              rom (PC,program_byte);
  Acumulador       ffout (clock,loadOut,reset,data_bus,FF_out);

endmodule

`include "Acumulador.v"
`include "Alu.v"
`include "Buffer.v"
`include "Decoder.v"
`include "Fetch.v"
`include "Flags.v"
`include "P_counter.v"
`include "Phase_module.v"
`include "Ram.v"
`include "Rom.v"





                  
                  
                  
                  
                  
                  