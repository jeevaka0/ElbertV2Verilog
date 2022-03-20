// Created by Jeevaka Dassanayake on 5/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module SimTest();

	localparam T = 2;

	// Inputs
	reg clk, reset;

	// Outputs
	wire r;

	// Instantiate the Unit Under Test (UUT)
	WaveGen waveGen( clk, reset, 4'b1001, 4'b0100, r );

	always
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end

	initial begin
		// Initialize Inputs
		reset = 1'b1;
		#(T/2)
		reset = 1'b0;
		
		// Wait long enough to see results.
		#(T*300);
        
		// Add stimulus here
		$stop;
	end
      
endmodule

