// Created by Jeevaka Dassanayake on 4/30/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module TestRorL;

	// Inputs
	reg [7:0] a;
	reg rr;

	// Outputs
	wire [7:0] r;

	// Instantiate the Unit Under Test (UUT)
	RorL uut ( a, rr, r );

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
	#16 a[4] = !a[4];
	end
	always begin
	#32 a[5] = !a[5];
	end
	always begin
	#64 a[6] = !a[6];
	end
	always begin
	#128 a[7] = !a[7];
	end
	always begin
	#256 rr = !rr;
	end

	initial begin
		// Initialize Inputs
		a = 8'b0;
		rr = 0;

		// Wait 100 ns for global reset to finish
		#520;
        
		// Add stimulus here
		$stop;
	end
      
endmodule

