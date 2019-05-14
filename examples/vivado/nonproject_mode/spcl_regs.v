module spcl_regs ( clk1, clk4, resetn, aluz, alu_cout, skip,
                   w_we, status_c_we, status_z_we,
						 tris_we, f_we, aluout, romdata,
						 fsel, fin, port_int_a, port_int_b, 
						 port_int_c, trisa, trisb, trisc,
						 status, w, fsr, inst );
 

input clk1, clk4, resetn, aluz, alu_cout, skip,
      w_we, status_c_we, status_z_we,
		tris_we, f_we ;
reg[11:0] inst_in;
input [7:0] aluout;
input [11:0] romdata;
input [4:0] fsel;
input [7:0] fin;

output  [7:0] port_int_a;
output [7:0] port_int_b;
output [7:0] port_int_c;

output  [7:0] trisa;
output [7:0] trisb;
output [7:0] trisc;

output [7:0] status;
output [7:0] w;
output [7:0] fsr;
output [11:0] inst;


reg [7:0] port_int_a, port_int_b, port_int_c;
reg [7:0]  port_en_b, port_en_c;// these are the b & c enable a has enable 'b1

reg [7:0]  trisa, trisb, trisc;

reg [7:0] status /* synthesis syn_preserve = 1 */;

reg [7:0] w;

reg [11:0] inst;

wire [7:0] status_in;

wire special_we;

wire  reset = ~resetn;

wire       regfile_fsel;  // High when fsel refers to actual register location

reg [ 7:0]  fsr;


// This signal indicates the fsel register address is refering to an
// actual Register File location (address >= 8) versus a special
// register.
assign regfile_fsel = fsel[4] | fsel[3] ;

assign special_we = f_we & ~regfile_fsel;

always @(posedge clk4 or posedge reset)
begin
  if (reset)  begin
  trisa <= 8'b11111111;
  trisb <= 8'b11111111;
  trisc <= 8'b11111111;
  end
  else 
    begin
      if(tris_we == 1'b1 &&  fsel[2:0] == 3'd5)
      trisa <= aluout;
	  if(tris_we == 1'b1 &&  fsel[2:0] == 3'd6)
      trisb <= aluout;
	  if(tris_we == 1'b1 &&  fsel[2:0] == 3'd7)
      trisc <= aluout;
    end
end



// Write to portaRegister
always@(posedge clk4 or posedge reset)
begin
  if(reset)
    port_int_a <= 8'b00000000;
  else if(f_we == 1'b1 && fsel[2:0] == 3'd5) 
   begin
      port_int_a <= aluout;
   end
end
  
always@(posedge clk4 or posedge reset)
begin
  if(reset)
    port_int_b <= 8'b00000000;
  else if(port_en_b) 
   begin
      port_int_b <= aluout;
   end
end
  
always@(posedge clk4 or posedge reset)
begin
  if(reset)
    port_int_c <= 8'b00000000;
  else if(port_en_c) 
   begin
      port_int_c <= aluout;
   end
end
  


// Write to portbRegister enable
always @(special_we or fsel[2:0]) begin
   if (special_we == 1'b1 && fsel[2:0] == 3'd6) begin
      port_en_b = 1'b1;
   end
   else begin
      port_en_b = 1'b0;
   end   
end



// Write to portcRegister
always @(special_we or fsel[2:0]) begin
   if (special_we == 1'b1 && fsel[2:0] == 3'd7) begin
      port_en_c = 1'b1;
   end
   else begin
      port_en_c = 1'b0;
   end   
end


// status register generated 

always@(posedge clk4 or posedge reset)
begin
  if(reset)
     begin
          status <= 8'b00000000;
	 end
  else
      begin
           status <= status_in;
	  end

end



// STATUS Register
assign status_in[7:3] = 5'b00000;
assign status_in[1]   = 1'b0;
assign status_in[2]   = (status_z_we & aluz) |        // Write aluz if we're supposed to..
                        (~status_z_we & status[2]);   // Otherwise, rewrite current value.
assign status_in[0]   = (status_c_we & alu_cout) |     // Write aluc if we're supposed to..
                        (~status_c_we & status[0]);   // Otherwise, rewrite current value.


// generating a w register
always@(posedge clk4 or posedge reset)
begin
  if(reset)
    w <= 8'b00000000;
  else if(w_we) 
   begin
      w <= aluout;
   end
end


always@(posedge clk4 or posedge reset)
begin
  if(reset)
    fsr <= 8'b00000000;
  else if(f_we == 1'b1 && fsel == 5'b00100 ) 
   begin
      fsr <= fin;
   end
end

always@(posedge clk1 or posedge reset)
begin
 if(reset == 1'b1)
   inst <= 12'b000000000000;
 else 
   inst <= inst_in;
end

// inst gets the ROM data unless skip is asserted which forces a NOP

always @(skip or romdata) begin
   if (skip == 1'b1) 
      inst_in = 12'b000000000000;
   else
      inst_in = romdata;
end



endmodule








