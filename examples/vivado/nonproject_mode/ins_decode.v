module ins_decode ( clk2,resetn ,aluz, inst, f_we, w_we,
                    status_z_we, status_c_we, tris_we,
					skip, k, fsel, longk, aluop, 
					alua_sel, alub_sel, bdpol, b_mux );
input clk2, resetn;
input  aluz;
input  [11:0] inst;

inout f_we;


output w_we, status_z_we, status_c_we, tris_we, skip; 
output [7:0] k;

inout [4:0] fsel;

output [8:0] longk;

output [3:0] aluop;

output [1:0] alua_sel, alub_sel;

output bdpol;

output [2:0] b_mux;

reg [13:0] decodes, decodes_in; 

wire reset = ~resetn;
// this is never used either take it out 
// or hook it up if necessary
//reg [7:0] bit_decoder;

reg skip, skip_in;

assign {  alua_sel,
		  alub_sel,
		  aluop,
		  w_we,
		  f_we, 
		  tris_we,
		  status_z_we,
		  status_c_we,
		  bdpol
		} = decodes;


// Define sub-signals out of inst

assign b_mux   = inst[7:5];
assign k =     inst[7:0];
assign fsel  = inst[4:0];
assign longk = inst[8:0];

// later take it out don't use it
//assign d     = inst[5];

always@(posedge clk2 or posedge reset)
begin
if(reset == 1'b1)
  begin
    decodes = 14'b00000000000000;
    skip = 1'b0;
  end
else
  begin
    decodes = decodes_in;
	skip = skip_in;
  end
end

// We want to insert the NOP instruction for the following conditions:
//    GOTO,CALL and RETLW instructions (All have inst[11:10] = 2'b10
//    BTFSS instruction when aluz is HI  (
//    BTFSC instruction when aluz is LO
//
always @(inst or aluz or f_we or fsel) begin
   if((f_we == 1'b1) & (fsel == 5'b00010))
   skip_in <= 1'b1;
   else
   begin
     casex ({inst, aluz})
      13'b10??_????_????_?:    // A GOTO, CALL or RETLW instructions
         skip_in <= 1'b1;
         
      13'b0110_????_????_1:    // BTFSC instruction and aluz == 1
         skip_in <= 1'b1;
	
      13'b0111_????_????_0:    // BTFSS instruction and aluz == 0
         skip_in <= 1'b1;
      

	 13'b0010_11??_????_1:     // DECFSZ(aluz == 1)
        skip_in <= 1'b1;

     13'b0011_11??_????_1 :  // INCFSZ(aluz == 1)
	   skip_in <= 1'b1;

     default:
         skip_in <= 1'b0;
   endcase
   end
end






// This is a large combinatorial decoder.
// I use the casex statement.

always @(inst) begin
	casex (inst)
		// *** Byte-Oriented File Register Operations
		12'b0000_0000_0000: decodes_in = 14'b00_00_0000_0_0_0_0_0_0; // NOP
		12'b0000_001X_XXXX: decodes_in = 14'b00_00_0010_0_1_0_0_0_0; // MOVWF
		12'b0000_0100_0000: decodes_in = 14'b00_00_0011_1_0_0_1_0_0; // CLRW
		12'b0000_011X_XXXX: decodes_in = 14'b00_00_0011_0_1_0_1_0_0; // CLRF
		12'b0000_100X_XXXX: decodes_in = 14'b01_00_1000_1_0_0_1_1_0; // SUBWF (d=0)
		12'b0000_101X_XXXX: decodes_in = 14'b01_00_1000_0_1_0_1_1_0; // SUBWF (d=1)
		12'b0000_110X_XXXX: decodes_in = 14'b01_11_1000_1_0_0_1_0_0; // DECF  (d=0)
		12'b0000_111X_XXXX: decodes_in = 14'b01_11_1000_0_1_0_1_0_0; // DECF  (d=1)
		12'b0001_000X_XXXX: decodes_in = 14'b00_01_0010_1_0_0_1_0_0; // IORWF (d=0)
		12'b0001_001X_XXXX: decodes_in = 14'b00_01_0010_0_1_0_1_0_0; // IORWF (d=1)
		12'b0001_010X_XXXX: decodes_in = 14'b00_01_0001_1_0_0_1_0_0; // ANDWF (d=0)
		12'b0001_011X_XXXX: decodes_in = 14'b00_01_0001_0_1_0_1_0_0; // ANDWF (d=1)
		12'b0001_100X_XXXX: decodes_in = 14'b00_01_0011_1_0_0_1_0_0; // XORWF (d=0)
		12'b0001_101X_XXXX: decodes_in = 14'b00_01_0011_0_1_0_1_0_0; // XORWF (d=1)
		12'b0001_110X_XXXX: decodes_in = 14'b00_01_0000_1_0_0_1_1_0; // ADDWF (d=0)
		12'b0001_111X_XXXX: decodes_in = 14'b00_01_0000_0_1_0_1_1_0; // ADDWF (d=1)
		12'b0010_000X_XXXX: decodes_in = 14'b01_01_0010_1_0_0_1_0_0; // MOVF  (d=0)
		12'b0010_001X_XXXX: decodes_in = 14'b01_01_0010_0_1_0_1_0_0; // MOVF  (d=1)
		12'b0010_010X_XXXX: decodes_in = 14'b01_01_0100_1_0_0_1_0_0; // COMF  (d=0)
		12'b0010_011X_XXXX: decodes_in = 14'b01_01_0100_0_1_0_1_0_0; // COMF  (d=1)
		12'b0010_100X_XXXX: decodes_in = 14'b01_11_0000_1_0_0_1_0_0; // INCF  (d=0)
		12'b0010_101X_XXXX: decodes_in = 14'b01_11_0000_0_1_0_1_0_0; // INCF  (d=1)
		12'b0010_110X_XXXX: decodes_in = 14'b01_11_1000_1_0_0_0_0_0; // DECFSZ(d=0)
		12'b0010_111X_XXXX: decodes_in = 14'b01_11_1000_0_1_0_0_0_0; // DECFSZ(d=1)
		12'b0011_000X_XXXX: decodes_in = 14'b01_01_0101_1_0_0_0_1_0; // RRF   (d=0)
		12'b0011_001X_XXXX: decodes_in = 14'b01_01_0101_0_1_0_0_1_0; // RRF   (d=1)
		12'b0011_010X_XXXX: decodes_in = 14'b01_01_0110_1_0_0_0_1_0; // RLF   (d=0)
		12'b0011_011X_XXXX: decodes_in = 14'b01_01_0110_0_1_0_0_1_0; // RLF   (d=1)
		12'b0011_100X_XXXX: decodes_in = 14'b01_01_0111_1_0_0_0_0_0; // SWAPF (d=0)
		12'b0011_101X_XXXX: decodes_in = 14'b01_01_0111_0_1_0_0_0_0; // SWAPF (d=1)
		12'b0011_110X_XXXX: decodes_in = 14'b01_11_0000_1_0_0_0_0_0; // INCFSZ(d=0)
		12'b0011_111X_XXXX: decodes_in = 14'b01_11_0000_0_1_0_0_0_0; // INCFSZ(d=1)

		// *** Bit-Oriented File Register Operations
		12'b0100_XXXX_XXXX: decodes_in = 14'b11_01_0001_0_1_0_0_0_1; // BCF
		12'b0101_XXXX_XXXX: decodes_in = 14'b11_01_0010_0_1_0_0_0_0; // BSF
		12'b0110_XXXX_XXXX: decodes_in = 14'b11_01_0001_0_0_0_0_0_0; // BTFSC
		12'b0111_XXXX_XXXX: decodes_in = 14'b11_01_0001_0_0_0_0_0_0; // BTFSS
														   
		// *** Literal and Control Operations			   
		12'b0000_0000_0010: decodes_in = 14'b00_00_0000_0_0_0_0_0_0; // OPTION
		12'b0000_0000_0011: decodes_in = 14'b00_00_0000_0_0_0_0_0_0; // SLEEP
		12'b0000_0000_0100: decodes_in = 14'b00_00_0000_0_0_0_0_0_0; // CLRWDT
		12'b0000_0000_0101: decodes_in = 14'b00_00_0010_0_0_1_0_0_0; // TRIS 5
		12'b0000_0000_0110: decodes_in = 14'b00_00_0010_0_0_1_0_0_0; // TRIS 6
		12'b0000_0000_0111: decodes_in = 14'b00_00_0010_0_0_1_0_0_0; // TRIS 7
														   
		12'b1000_XXXX_XXXX: decodes_in = 14'b10_10_0010_1_0_0_0_0_0; // RETLW
		12'b1001_XXXX_XXXX: decodes_in = 14'b10_10_0010_0_0_0_0_0_0; // CALL
		12'b101X_XXXX_XXXX: decodes_in = 14'b10_10_0010_0_0_0_0_0_0; // GOTO
		12'b1100_XXXX_XXXX: decodes_in = 14'b10_10_0010_1_0_0_0_0_0; // MOVLW
		12'b1101_XXXX_XXXX: decodes_in = 14'b10_00_0010_1_0_0_1_0_0; // IORLW
		12'b1110_XXXX_XXXX: decodes_in = 14'b10_00_0001_1_0_0_1_0_0; // ANDLW
		12'b1111_XXXX_XXXX: decodes_in = 14'b10_00_0011_1_0_0_1_0_0; // XORLW

		default:
			decodes_in = 14'b00_00_0000_0_0_0_0_0_0;
	endcase
end

endmodule




