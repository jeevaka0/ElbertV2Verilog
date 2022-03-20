// Created by Jeevaka Dassanayake on 4/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module TestEq2x2bits;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Outputs
	wire c;

	// Instantiate the Unit Under Test (UUT)
	Eq2x2bits uut ( .a(a), .b(b), .c(c) );

	always begin
	#1 a[0] = !a[0];
	end
	always begin
	#2 a[1] = !a[1];
	end
	always begin
	#4 b[0] = !b[0];
	end
	always begin
	#8 b[1] = !b[1];
	end

	initial begin
		// Initialize Inputs
		a[0] = 0;
		a[1] = 0;
		b[0] = 0;
		b[1] = 0;

		// Wait 12 ns for global reset to finish
		#20;
	
		//$finish;
		$stop;
	end
      
endmodule

