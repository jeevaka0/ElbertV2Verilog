// Created by Jeevaka Dassanayake on 4/10/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module TestEq2Bit;

	// Inputs
	reg bit1, bit2;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Eq2Bit uut ( bit1, bit2, out );

	always begin
	#1 bit1 = !bit1;
	end
	always begin
	#2 bit2 = !bit2;
	end

	initial begin
		// Initialize Inputs
		bit1 = 0;
		bit2 = 0;

		// Wait 10 ns for global reset to finish
		#10;
	
		//$finish;
		$stop;
	end
		
endmodule