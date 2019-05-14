
`define RTL_VERSION

module reg_file (clk, f_we, fsel, fin, regfile_out);

input        clk;
input        f_we;
input  [4:0] fsel;          // Interface to microprogram in ROM
input  [7:0] fin;           // Input busses
output [7:0] regfile_out;          // Output busses

reg [4:0] addr;
//reg [7:0] regfile_out;
reg[7:0] mem_regfile[31:0];

assign regfile_out = mem_regfile[addr];

always @(posedge clk)
begin
if(f_we )
  addr <= fsel;
else
  mem_regfile[addr] <= fin;
end
endmodule


