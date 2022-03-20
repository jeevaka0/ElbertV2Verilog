// Created by Jeevaka Dassanayake on 4/07/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module TestYou;

	// Inputs
	reg clock;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	TestMe uut (
		.A(clock), 
		.B(out)
	);

	always begin
	#1 clock =!clock;
	end

	initial begin
		// Initialize Inputs
		clock = 1;

		// Wait 10 ns for global reset to finish
		#10;
	
		//$finish;
		$stop;
	end
		
endmodule
