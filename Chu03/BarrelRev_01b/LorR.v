// Created by Jeevaka Dassanayake on 4/29/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module LorR( input [7:0] a, input rr, output [7:0] r );

	wire [7:0] rev, rr1, rleft, rright;
	
	assign r = rr ? rright : rleft;	// Last step.

	RotR rotr2( a, rright );	// Parellel to 1 - 3
	Rev rev2( rr1, rleft );			// Step 3
	RotR rotr1( rev, rr1 );			// Step 2
	Rev rev1( a, rev );			// Step 1

endmodule
