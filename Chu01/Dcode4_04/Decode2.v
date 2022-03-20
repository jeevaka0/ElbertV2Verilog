// Created by Jeevaka Dassanayake on 4/28/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Decode2( input en, input a1, input a0, output [3:0] d );

	assign d[0] = ~a1 & ~a0 & en;
	assign d[1] = ~a1 & a0 & en;
	assign d[2] = a1 & ~a0 & en;
	assign d[3] = a1 & a0 & en;

endmodule
