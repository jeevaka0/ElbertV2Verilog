// Created by Jeevaka Dassanayake on 4/28/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Decode4( input a3, input a2, input a1, input a0, output [15:0] d, output l, output m, output f );

	wire [3:0] high;
	Decode2 selector( 1'b1, a3, a2, high[3:0] );

	Decode2 nibble3( high[3], a1, a0, d[15:12] );
	Decode2 nibble2( high[2], a1, a0, d[11:8] );
	Decode2 nibble1( high[1], a1, a0, d[7:4] );
	Decode2 nibble0( high[0], a1, a0, d[3:0] );

	assign f = 'b0;
	assign m = 'b1;
	assign l = 'b1;

endmodule
