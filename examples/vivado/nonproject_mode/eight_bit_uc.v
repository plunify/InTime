module eight_bit_uc ( clock, resetn, porta, portb, portc );

input clock, resetn;

inout [7:0] porta, portb, portc;

wire resetn, aluz;
wire [11:0] inst;
wire f_we, w_we, status_z_we, status_c_we, tris_we, skip;
wire [7:0] k;
wire [4:0] fsel;
wire [8:0] longk;
wire [3:0] aluop;
wire [1:0] alua_sel, alub_sel;
wire bdpol;
wire [2:0] b_mux;
wire  [7:0] fin;
wire [10:0] pc;
wire [7:0] regfile_out;
wire [7:0] fsr, rtcc;
wire [7:0] status, porta, portb, portc, w;
wire [7:0] alua, alub;
wire alu_cout;
wire [7:0] aluout;
wire [11:0] romdata;				
wire [7:0] port_int_a;
wire [7:0] port_int_b;
wire [7:0] port_int_c;
wire [7:0] trisa;
wire [7:0] trisb;
wire [7:0] trisc;

wire clk1, clk2, clk3, clk4;

assign clk1 = clock;
assign clk2 = clock;
assign clk3 = clock;
assign clk4 = clock;
assign rtcc = 7'h0;
// instantiating decode block
ins_decode decode (.clk2(clk2), .resetn(resetn), .aluz(aluz), .inst(inst), .f_we(f_we), .w_we(w_we),
                    .status_z_we(status_z_we), .status_c_we(status_c_we), .tris_we(tris_we),
					.skip(skip), .k(k), .fsel(fsel), .longk(longk), .aluop(aluop), 
					.alua_sel(alua_sel), .alub_sel(alub_sel), .bdpol(bdpol), .b_mux(b_mux) );


// instantiating program counter block
prgm_cntr prgmcntr ( .clk4(clk4), .resetn(resetn), .inst(inst), .k(k), .fin(aluout), .pc(pc) );


// instantiating regs block 
reg_file regs (.clk(clk1), .f_we(f_we), .fsel(fsel), .fin(aluout), .regfile_out(regfile_out));


// instantiating data mux block

data_mux  dmux  ( .clk2(clk2), .resetn(resetn), .fsr(fsr), .rtcc(rtcc), .pc(pc[7:0]), .status(status), .porta(porta),
                  .portb(portb), .portc(portc), .regfile_out(regfile_out), .w(w),
 				  .k(k), .fsel(fsel), .aluout(aluout), .alua_sel(alua_sel), .alub_sel(alub_sel),
				  .b_mux(b_mux), .bdpol(bdpol), .alua(alua), .alub(alub), .fin(fin) );


// instantiating alu block

alu uc_alu ( .clk3(clk3), .resetn(resetn), .status0(status[0]), .aluop(aluop), .alua(alua), .alub(alub), 
             .alu_cout(alu_cout), .aluz(aluz), .aluout(aluout));

// instantiating instruction rom block

ins_rom rom (.addr(pc), .Data(romdata));

// instantiating special registers block

spcl_regs special_regs ( .clk1(clk1), .clk4(clk4), .resetn(resetn), .aluz(aluz), .alu_cout(alu_cout), .skip(skip),
                         .w_we(w_we), .status_c_we(status_c_we), .status_z_we(status_z_we),
						 .tris_we(tris_we), .f_we(f_we), .aluout(aluout), .romdata(romdata),
						 .fsel(fsel), .fin(aluout), .port_int_a(port_int_a), .port_int_b(port_int_b), 
						 .port_int_c(port_int_c), .trisa(trisa), .trisb(trisb), .trisc(trisc),
						 .status(status), .w(w), .fsr(fsr), .inst(inst) );

// instantiating  io blocks

io io_buff ( .porta(porta), .portb(portb), .portc(portc),
             .port_int_a(port_int_a), .port_int_b(port_int_b), .port_int_c(port_int_c), 
		     .trisa(trisa), .trisb(trisb), .trisc(trisc) );

endmodule


