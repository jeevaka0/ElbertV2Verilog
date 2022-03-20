// Created by Jeevaka Dassanayake on 5/20/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module SimTest();

	localparam T = 2;

	// Inputs
	reg clk, reset;

	wire max_tick;

	// Outputs
	wire [7:0] r;

	// Instantiate the Unit Under Test (UUT)
	FrequencyDivider #( 12, 4 ) frequencyDivider ( clk, reset, max_tick );
	
	ModMCounter #( 100, 8 ) counter ( max_tick, reset, r );

	always
	begin
//		clk = 1'b1;
//		#(T/2);
		clk = 1'b0;
		#(T/2);
	end

	initial begin
		// Initialize Inputs
		reset = 1'b1;
		#(T/2)
		reset = 1'b0;
		
		// Wait long enough to see results.
		#(T*2500);
        
		// Add stimulus here
		$stop;
	end
      
endmodule

