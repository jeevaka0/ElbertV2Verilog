// Created by Jeevaka Dassanayake on 4/25/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module TestG8ter4;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire g;

	// Instantiate the Unit Under Test (UUT)
	G8ter4 uut ( .a(a), .b(b), .g(g) );

	always begin
	#1 a[0] = !a[0];
	end
	always begin
	#2 a[1] = !a[1];
	end
	always begin
	#4 a[2] = !a[2];
	end
	always begin
	#8 a[3] = !a[3];
	end
	always begin
	#16 b[0] = !b[0];
	end
	always begin
	#32 b[1] = !b[1];
	end
	always begin
	#64 b[2] = !b[2];
	end
	always begin
	#128 b[3] = !b[3];
	end

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#260;
        
		// Add stimulus here
		$stop;
	end
      
endmodule

