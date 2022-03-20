// Created by Jeevaka Dassanayake on 5/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module ModMCounterWithUDFD #( parameter M = 2, parameter N = 1 )( input clk, input reset, input en, input up, output [N-1:0] count, output tick );

	ModMCounterWithUD #( M, N ) counter ( clk, reset, en, up, count );
	
	assign tick = en && count == ( up ? M - 1 : 0 );

endmodule
