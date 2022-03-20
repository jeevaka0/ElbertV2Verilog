// Created by Jeevaka Dassanayake on 6/03/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module SimTest();

	localparam T = 1;

	// Inputs
	reg clk, reset, sig;

	// Outputs
	wire anyEdge;

	// Instantiate the Unit Under Test (UUT)
	DualEdgeMealy dualEdge( clk, reset, sig, anyEdge );

	always
	begin
		clk = 1'b1;
		#(4*T);
		clk = 1'b0;
		#(4*T);
	end

	initial begin
		// Initialize Inputs
		reset = 1'b1;
		sig = 1'b0;
		#(T)
		reset = 1'b0;
		#(T)
		
		// Change once
		#(9*T)
		sig = ~sig;
		
		// Change while on
		#(8*T)
		sig = ~sig;
		
		// Change 2x
		#(8*T)
		sig = ~sig;
		
		#(1*T)
		sig = ~sig;
		
		// Change 3x
		#(15*T)
		sig = ~sig;
		
		#(1*T)
		sig = ~sig;
		
		#(1*T)
		sig = ~sig;
		
		// Change 2x while on
		#(6*T)
		sig = ~sig;
		
		#(2*T)
		sig = ~sig;
		
		// Change right on the edge
		#(11*T)
		sig = ~sig;
		
		// Change right on the edge
		#(16*T)
		sig = ~sig;
		
		#(1*T)
		sig = ~sig;
		
		// Change right on the edge
		#(15*T)
		sig = ~sig;
		
		#(1*T)
		sig = ~sig;
		
		#(2*T)
		sig = ~sig;

		// Wait long enough to see results.
		#(T*70);
        
		// Add stimulus here
		$stop;
	end
      
endmodule

