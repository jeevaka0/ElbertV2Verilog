// Created by Jeevaka Dassanayake on 4/10/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
module Eq2Bit( input wire A, input wire B, output wire R );

	assign both = A & B;
	assign neither = ~A & ~B;
	assign R = both | neither;

endmodule
