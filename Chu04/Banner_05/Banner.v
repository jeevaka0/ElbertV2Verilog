// Created by Jeevaka Dassanayake on 5/26/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module Banner( input clk, input reset, input pause, input dirn, output wire [4:0] hex2, output wire [4:0] hex1, output wire [4:0] hex0 );

	wire [3:0] count;
	wire [3:0] index;

	ModMCounter #( 12, 4 ) step ( clk, reset, ~pause, count );
	assign index = dirn ? count : 4'b1001 - count;
	
	Message m0( index, hex0 );
	Message m1( index == 11 ? 0 : index + 1 , hex1 );
	Message m2( ( index >= 10 ? index - 8 : index + 2 ), hex2 );

endmodule
