// Created by Jeevaka Dassanayake on 6/03/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

// Even though we call 'edge detector' we are just sampling the 'signal' during each clock cycle.

module DualEdgeMealy( input clk, input reset, input sig, output ege );

	// State.
	// MSb - The input (sig) value at last posedge clk
	
	wire last;

	DFFArray #( 1 ) lastIn ( clk, reset, sig, last );	

	// Output
	assign ege = last != sig;

endmodule
