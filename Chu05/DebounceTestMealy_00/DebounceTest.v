// Created by Jeevaka Dassanayake on 6/03/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

// Listing 5.7
module DebounceTest ( input wire clk, input wire [1:0] btn, output wire [2:0] an, output wire [7:0] sseg );

   // signal declaration
   wire [7:0] b_count;
	wire [3:0] d_count;
   wire db_level;
	wire db_tick, btn_tick;
	wire clr, click;

   // instantiate 7-seg LED display time-multiplexing module
	wire [4:0] hex2, hex1, hex0;
	
   assign clr = ~btn[0];
	assign click = ~btn[1];
	assign hex0 = { 1'b0, d_count[3:0] };
	assign hex1 = { 1'b0, b_count[3:0] };
	assign hex2 = { 1'b0, b_count[7:4] };

	DispHexMux disp( clk, clr, hex2, hex1, hex0, 3'b010, 3'b111, an, sseg );
	
   // instantiate debouncing circuit
   db_fsm db_unit(clk, clr, click, db_level);

	DualEdgeMealy directBtn( clk, clr, click, btn_tick );
	DualEdgeMealy debouncedBtn( clk, clr, db_level, db_tick );

	ModMCounter #( 256, 8 ) directCount( clk, clr, btn_tick, b_count );
	ModMCounter #( 16, 4 ) debouncedCount( clk, clr, db_tick, d_count );

endmodule
