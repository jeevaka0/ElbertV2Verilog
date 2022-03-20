// Created by Jeevaka Dassanayake on 4/28/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Decode3( input a2, input a1, input a0, output [7:0] d );

	assign na2 = ~a2;
	
	Decode2 highNibble( a2, a1, a0, d[7:4] );
	Decode2 lowNibble( na2, a1, a0, d[3:0] );

endmodule
