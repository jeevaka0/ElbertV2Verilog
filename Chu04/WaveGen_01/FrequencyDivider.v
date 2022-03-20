// Created by Jeevaka Dassanayake on 5/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module FrequencyDivider ( input clk, input reset, output max_tick );

	localparam M = 12000000;
	wire [23:0] count;

	ModMCounter #(24) counter ( clk, reset, 1'b1, M, count );
	
	// Output
	assign max_tick = count == M - 1 ? 1'b1 : 1'b0;

endmodule

