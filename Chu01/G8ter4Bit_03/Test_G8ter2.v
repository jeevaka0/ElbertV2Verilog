// Created by Jeevaka Dassanayake on 4/23/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Test_G8ter2;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Outputs
	wire g;

	// Instantiate the Unit Under Test (UUT)
	G8ter2 uut ( .a(a), .b(b), .g(g) );

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
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#20;
        
		// Add stimulus here
		$stop;
	end
      
endmodule

