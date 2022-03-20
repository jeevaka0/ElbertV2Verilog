// Created by Jeevaka Dassanayake on 5/27/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module FrequencyDivider #( parameter M = 2, parameter N = 1 )( input clk, input reset, input en, output max_tick );

	wire [N-1:0] count;

	ModMCounter #( M, N ) counter ( clk, reset, en, count );
	
	// Output
	assign max_tick = en && count == M - 1 ;

endmodule

