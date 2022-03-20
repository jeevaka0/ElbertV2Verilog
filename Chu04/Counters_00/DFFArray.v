// Created by Jeevaka Dassanayake on 5/27/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.


module DFFArray #( parameter N = 1 )( input clk, input reset, input [N-1:0] next, output [N-1:0] stateOut );

	reg [N-1:0] state;

	// State changes
	always @( posedge clk, posedge reset )
	begin
		if( reset )
			state <= 0;
		else
			state <= next;
	end

	assign stateOut = state;

endmodule
