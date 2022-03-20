// Created by Jeevaka Dassanayake on 5/22/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.


module FrequencyDivider #( parameter M = 2, parameter N = 1 )( input clk, input reset, input en, output max_tick );

	wire [N-1:0] count;

	ModMCounter #( M, N ) counter ( clk, reset, en, count );
	
	// Output
	assign max_tick = count == M - 1 ? 1'b1 : 1'b0;

endmodule

