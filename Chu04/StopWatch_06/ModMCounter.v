// Created by Jeevaka Dassanayake on 5/27/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module ModMCounter #( parameter M = 2, parameter N = 1 )( input clk, input reset, input en, output [N-1:0] count );

	wire [N-1:0] next;

	DFFArray #( N ) flipFlops ( clk, reset, next, count );

	// Next state logic
	assign next = en ? ( count == M - 1 ? 0 : count + 1 ) : count;

endmodule
