// Created by Jeevaka Dassanayake on 4/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Eq2x2bits( input [1:0] a, input [1:0] b, output c );

	wire r0, r1;
	
	Eq2Bit firstBit( a[0], b[0], r0 );
	Eq2Bit secondBit( a[1], b[1], r1 );
	
	assign c = r0 & r1;

endmodule
