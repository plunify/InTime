module alu ( clk3, resetn, status0, aluop, alua, alub, alu_cout, aluz, aluout);  

input clk3, resetn;
input status0;

input [3:0] aluop;
input [7:0] alua, alub;

output alu_cout, aluz;

output [7:0] aluout;


// register definition for outputs

wire reset = ~resetn;

wire alu_cout_int, aluz_int;

wire [7:0] aluout_int, aluout;

reg [8:0] longq;

reg alu_cout;

reg aluz;

reg [7:0] aluout_reg;

//reg adder_cout;


parameter [3:0] ALUOP_ADD        = 4'b0000;
parameter [3:0] ALUOP_SUB        = 4'b1000;
parameter [3:0] ALUOP_AND        = 4'b0001;
parameter [3:0] ALUOP_OR         = 4'b0010;
parameter [3:0] ALUOP_XOR        = 4'b0101;
parameter [3:0] ALUOP_NOT        = 4'b0100;
parameter [3:0] ALUOP_ROR        = 4'b0011;
parameter [3:0] ALUOP_ROL        = 4'b0110;
parameter [3:0] ALUOP_SWAP       = 4'b0111;




// Wires that are the results of individual
// ALU operations.  All results feed into our
// big mux, which we will specifically build.
//
wire [7:0] and_result;
wire [7:0] or_result;
wire [7:0] xor_result;
wire [7:0] not_result;
wire [7:0] ror_result;
wire [7:0] rol_result;
wire [7:0] swap_result;
wire [8:0]  adder_result, sub_result;

	assign and_result = alua & alub;
assign or_result  = alua | alub;
assign xor_result = alua ^ alub;
assign not_result = ~alua;
assign ror_result  = {status0, alua[7:1]};
assign rol_result  = {alua[6:0], status0};
assign swap_result = {alua[3:0], alua[7:4]};
assign adder_result = {1'b0, alua} + {1'b0, alub};
assign sub_result = {1'b0, alua} - {1'b0, alub};

assign aluz_int = ~| aluout_int;
assign alu_cout_int = longq[8];
assign aluout_int = longq[7:0];
assign aluout = aluout_reg;

always @(aluop[3:0] or adder_result or and_result or 
         or_result or xor_result or not_result or 
		 ror_result or swap_result or longq or sub_result) 
  begin
	case (aluop) // synthesis full_case
		ALUOP_ADD:  longq = adder_result;
		ALUOP_SUB: longq = sub_result;
		ALUOP_AND:  longq = {1'b0,and_result};
		ALUOP_OR:  longq = {1'b0,or_result};
		ALUOP_XOR:  longq = {1'b0,xor_result};
		ALUOP_NOT:  longq = {1'b0,not_result};
		ALUOP_ROR:  longq = {1'b0,ror_result};
		ALUOP_SWAP:  longq = {1'b0,swap_result};
//		default : aluout_int = aluout_int;
	endcase
  end


always @(posedge clk3 or posedge reset) 
  begin
     if (reset) 
	    begin
		    aluout_reg <= 8'b00000000;
			aluz <= 1'b0;
			alu_cout <= 1'b0;
		end
	 else 
	    begin
		    aluout_reg <= aluout_int;
			aluz <= aluz_int;
			alu_cout <= alu_cout_int;
		end
   end

endmodule


