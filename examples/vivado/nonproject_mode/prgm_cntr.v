module prgm_cntr ( clk4, resetn, inst, k, fin, pc );

input clk4, resetn;

input [11:0] inst;

input [7:0] k;

input [7:0] fin;

output [10:0] pc;
reg [10:0] pc;



 
`define PC_SELECT_PCPLUS1       3'b000
`define PC_SELECT_K             3'b001
`define PC_SELECT_STACK1        3'b010
`define PC_SELECT_STACK2        3'b011
`define PC_SELECT_FOUT          3'b100
`define PC_SELECT_RESET_VECTOR  3'b101
`define RESET_VECTOR            11'b11111111111



reg[10:0] pc_in;
reg [2:0] pc_sel;

reg [1:0] stacklevel;
reg [1:0] stacklevel_in;

reg [7:0] stack1, stack2;

reg [10:0] pcplus1;

wire reset = ~resetn;

// 8:1 Control Select for MUX into PC 
always @(pc_sel or pcplus1 or k or stack1 or stack2 or fin or pc) begin
   case (pc_sel)
      3'b000:  pc_in = pcplus1;
      3'b001:  pc_in = k;
      3'b010:  pc_in = stack1;
      3'b011:  pc_in = stack2;
      3'b100:  pc_in = fin;
    //    3'b100:  fout <= pc[7:0];
      3'b101:  pc_in = `RESET_VECTOR;
      
      // Don't really carry about these...
	     default:
            pc_in = pc;
     // 3'b110:  pc_in = pc_in;
     // 3'b111:  pc_in = pc_in;
   endcase
end

always@(posedge clk4 or posedge reset)
begin
if(reset == 1'b1)
  begin
    stacklevel <= 2'b00;
    pcplus1 <= 11'b00000000000;
	pc <= 11'b00000000000;
  end
else
  begin
    stacklevel <= stacklevel_in;
    pcplus1 <= pc_in + 1'b1;
	pc <= pc_in;
  end
end

// MUX Into the PC.
//
//
always @(inst or stacklevel or reset) begin
   if (reset == 1'b1) begin
      pc_sel = `PC_SELECT_RESET_VECTOR;
   end
   else begin
      casex ({inst, stacklevel})
         14'b101?_????_????_??: pc_sel = `PC_SELECT_K;       // GOTO
         14'b1001_????_????_??: pc_sel = `PC_SELECT_K;       // CALL
         14'b1000_????_????_00: pc_sel = `PC_SELECT_STACK1;  // RETLW
         14'b1000_????_????_01: pc_sel = `PC_SELECT_STACK1;  // RETLW
         14'b1000_????_????_10: pc_sel = `PC_SELECT_STACK2;  // RETLW
         14'b1000_????_????_11: pc_sel = `PC_SELECT_STACK2;  // RETLW
         14'b0010_0010_0010_??: pc_sel = `PC_SELECT_FOUT;    // MOVF where f=PC
		 14'b0001_1110_0010_??: pc_sel = `PC_SELECT_FOUT;  //ADDWF
         default:
            pc_sel = `PC_SELECT_PCPLUS1;
      endcase
   end
end

// Write control to STACK1
//
always@(posedge clk4 or posedge reset)
begin  
   if (reset)
   stack1 <= 11'b00000000000;
   else if (inst[11:8] == 4'b1001 && stacklevel == 2'b00)
     begin
	   stack1 <= pc_in;
       $display ("Write to STACK1: %0h", pc);
	 end
end

always@(posedge clk4 or posedge reset)
begin  
   if (reset)
   stack2 <= 11'b00000000000;
   else if (inst[11:8] == 4'b1001 && stacklevel == 2'b01)
      begin
	    stack2 <= pc_in;
       $display ("Write to STACK2: %0h", pc);
	  end
end
// Write to stacklevel
//
// The stacklevel register keeps track of the current stack depth.  On this
// puny processor, there are only 2 levels (you could fiddle with this and
// increase the stack depth).  There are two stack registers, stack1 and stack2.
// The stack1 register is used first (e.g. the first time a call is performed),
// then stack2.  As CALLs are done, stacklevel increments.  Conversely, as
// RETs are done, stacklevel goes down. 

always @(inst or stacklevel or reset) begin
  // if (reset == 1'b1) begin
 //     stacklevel <= 2'b00;  // On reset, there should be no CALLs in progress
  // end
  // else begin
      casex ({inst, stacklevel})
         // Call instructions
         14'b1001_????_????_00: stacklevel_in = 2'b01;  // Record 1st CALL
         14'b1001_????_????_01: stacklevel_in = 2'b10;  // Record 2nd CALL
         14'b1001_????_????_10: stacklevel_in = 2'b10;  // Already 2! Ignore
         14'b1001_????_????_11: stacklevel_in = 2'b00;  // {shouldn't happen}

         // Return instructions
         14'b1000_????_????_00: stacklevel_in = 2'b00;  // {shouldn't happen}
         14'b1000_????_????_01: stacklevel_in = 2'b00;  // Go back to no CALL in progress
         14'b1000_????_????_10: stacklevel_in = 2'b01;  // Go back to 1 CALL in progress
         14'b1000_????_????_11: stacklevel_in = 2'b10;  // {shouldn't happen} sort of like, Go back to 2 calls in progress
         default:
         stacklevel_in = stacklevel;
      endcase
  //end
end

endmodule
