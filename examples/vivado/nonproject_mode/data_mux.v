module data_mux ( clk2, resetn, fsr, rtcc, pc, status, porta,
                  portb, portc, regfile_out, w,
 				  k, fsel, aluout, alua_sel, alub_sel,
				  b_mux, bdpol, alua, alub, fin );

input clk2, resetn;

input [7:0] fsr, rtcc;

input [7:0] pc;

input [7:0] status, porta, portb, portc,
			regfile_out, w, k;

input [4:0] fsel;

input [7:0] aluout;

input [1:0] alua_sel, alub_sel;

input [2:0] b_mux;

input bdpol;

output [7:0] alua, alub, fin;

reg [7:0] special_out, fout, bit_decoder;
reg [7:0] alua_int, alub_int;

reg [7:0] alua, alub;
wire   regfile_fsel;

wire [7:0] bd;

wire reset = ~resetn;

assign regfile_fsel = fsel[4] | fsel[3] ;




// First MUX selects from all the special regsiters

always @(fsel or fsr or rtcc or pc or status
         or porta or portb or portc) begin

   case (fsel[2:0])
      3'b000: special_out = fsr;
      3'b001: special_out = rtcc;
      3'b010: special_out = pc[7:0];
      3'b011: special_out = status;
      3'b100: special_out = fsr;
      3'b101: special_out = porta;
      3'b110: special_out = portb;
      3'b111: special_out = portc;

   endcase

end



// Second Mux selects from the special registers or the output
// of the register file.
always @(regfile_out or special_out or regfile_fsel) begin
   if (regfile_fsel == 1'b1) begin
      fout = regfile_out;
   end
   else begin
      fout = special_out;
   end
end



assign fin = aluout; 

// Bit Decoder
always @(b_mux) begin
   case (b_mux)
      3'b000: bit_decoder = 8'b00000001;
      3'b001: bit_decoder = 8'b00000010;
      3'b010: bit_decoder = 8'b00000100;
      3'b011: bit_decoder = 8'b00001000;
      3'b100: bit_decoder = 8'b00010000;
      3'b101: bit_decoder = 8'b00100000;
      3'b110: bit_decoder = 8'b01000000;
      3'b111: bit_decoder = 8'b10000000;
   endcase
end



assign bd = bit_decoder ^ {bdpol,bdpol,bdpol,bdpol,bdpol,bdpol,bdpol,bdpol};



// Implement MUX into alua
//
// Combinatorial
//
always @(alua_sel or w or fout or k or bd) begin
   case (alua_sel)
      2'b00: alua_int = w;
      2'b01: alua_int = fout;
      2'b10: alua_int = k;
      2'b11: alua_int = bd;
   endcase
end

// Implement MUX into alub
//
// Combinatorial
//
always @(alub_sel or w or fout or k) begin
   case (alub_sel)
      2'b00: alub_int = w;
      2'b01: alub_int = fout;
      2'b10: alub_int = k;
      2'b11: alub_int = 8'b00000001;
   endcase
end

always @(posedge clk2 or posedge reset) 

  begin

     if (reset) 
	    begin
		    alua <= 8'b00000000;
			alub <= 8'b00000000;
		end
	 else 
	    begin
		    alua <= alua_int;
			alub <= alub_int;
		end
   end

endmodule

