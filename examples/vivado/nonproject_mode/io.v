module io ( porta, portb, portc,
            port_int_a, port_int_b, port_int_c, 
				trisa, trisb, trisc ); 

inout  [7:0] porta;
inout [7:0] portb;
inout [7:0] portc;

input  [7:0] port_int_a;
input [7:0] port_int_b;
input [7:0] port_int_c;

input  [7:0] trisa;
input [7:0] trisb;
input [7:0] trisc;


assign porta[0] = ~trisa[0]? port_int_a[0]: 1'bz;
assign porta[1] = ~trisa[1]? port_int_a[1]: 1'bz;
assign porta[2] = ~trisa[2]? port_int_a[2]: 1'bz;
assign porta[3] = ~trisa[3]? port_int_a[3]: 1'bz;
assign porta[4] = ~trisa[4]? port_int_a[4]: 1'bz;
assign porta[5] = ~trisa[5]? port_int_a[5]: 1'bz;
assign porta[6] = ~trisa[6]? port_int_a[6]: 1'bz;
assign porta[7] = ~trisa[7]? port_int_a[7]: 1'bz;

assign portb[0] = ~trisb[0]? port_int_b[0]: 1'bz;
assign portb[1] = ~trisb[1]? port_int_b[1]: 1'bz;
assign portb[2] = ~trisb[2]? port_int_b[2]: 1'bz;
assign portb[3] = ~trisb[3]? port_int_b[3]: 1'bz;
assign portb[4] = ~trisb[4]? port_int_b[4]: 1'bz;
assign portb[5] = ~trisb[5]? port_int_b[5]: 1'bz;
assign portb[6] = ~trisb[6]? port_int_b[6]: 1'bz;
assign portb[7] = ~trisb[7]? port_int_b[7]: 1'bz;

assign portc[0] = ~trisc[0]? port_int_c[0]: 1'bz;
assign portc[1] = ~trisc[1]? port_int_c[1]: 1'bz;
assign portc[2] = ~trisc[2]? port_int_c[2]: 1'bz;
assign portc[3] = ~trisc[3]? port_int_c[3]: 1'bz;
assign portc[4] = ~trisc[4]? port_int_c[4]: 1'bz;
assign portc[5] = ~trisc[5]? port_int_c[5]: 1'bz;
assign portc[6] = ~trisc[6]? port_int_c[6]: 1'bz;
assign portc[7] = ~trisc[7]? port_int_c[7]: 1'bz;

endmodule



