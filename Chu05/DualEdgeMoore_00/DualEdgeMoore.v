// Created by Jeevaka Dassanayake on 6/03/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

// Even though we call 'edge detector' we are just sampling the 'signal' during each clock cycle.

module DualEdgeMoore( input clk, input reset, input sig, output ege );

	// State.
	// MSb - The input (sig) value at last posedge clk
	// MSb - Our current output.
	
	reg in, out;
	wire next_in, next_out;

	// State changes
	always @( posedge clk, posedge reset )
	begin
		if( reset )
		begin
			in = sig;
			out = 1'b0;
		end
		else
		begin
			in = next_in;
			out = next_out;
		end
	end
	
	// Next state logic
	assign next_in = sig;
	assign next_out = ~out && in != next_in;		// Input changed and we are not signalling atm.
	
	// Output
	assign ege = out;

endmodule
