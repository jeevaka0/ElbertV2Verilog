// Created by Jeevaka Dassanayake on 6/10/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module SimTest();

	localparam t = 1;
	localparam T = 10;//2000;

	// Inputs
	reg clk, reset, sig;

	// Outputs
	wire debounced;

	// Instantiate the Unit Under Test (UUT)
	//AltDebounce ( 240000, 18 ) altDebounce( clk, reset, sig, debounced );
	AltDebounce #( 40, 6 ) altDebounce( clk, reset, sig, debounced );

	always
	begin
		clk = 1'b1;
		#(t);
		clk = 1'b0;
		#(t);
	end				// Clock is 2ns, Debounce circuit waits for 80ns before rechecking.

	initial begin
		// Initialize Inputs
		reset = 1'b0;
		sig = 1'b0;
		#(t)							// 1 ns
		reset = 1'b1;
		#(t)							// 2 ns
		reset = 1'b0;
		#(8*t)						// 10 ns
		
		// Change once
		#(8*T)						// 90ns
		sig = ~sig;					// s = 1 => db = 1 *****************
		
		// Change while on
		#(7*T)						// 160ns
		sig = ~sig;					// s = 0
		
										// 170 ns - db start to recheck. db = 0 *****************
		// Change 2x
		#(3*T)						// 190 ns
		sig = ~sig;					// s = 1	- db stays at 0
		
		#(1*T)						// 200 ns
		sig = ~sig;					// s = 0
		
		#(1*T)						// 210 ns
		sig = ~sig;					// s = 1
		
										// 250 db check switch to 1. ************************
		// Change 3x
		#(9*T)						// 300 ns
		sig = ~sig;					// s = 0 => db = 0
		
		#(1*T)						// 310 ns
		sig = ~sig;					// s = 1
		
		#(1*T)						// 320 ns
		sig = ~sig;					// s = 0

										// 330 db check switch to 0. ************************
		
		// Change 2x while off
		#(6*T)						// 380 ns
		sig = ~sig;					// s = 1 => db = 1 ***************************
		
		#(2*T)						// 400 ns
		sig = ~sig;					// s = 0
		
										// 410 ns db check and stay at 0. ************************
		#(2*T)						// 430 ns
		sig = ~sig;					// s = 1, db = 1 ***********************************
		
		// Change right on the edge
		#(8*T)						// 510 ns
		sig = ~sig;					// s = 0, db stay 1 based on the old input.
										// 512 ns, db = 0 ***********************************

		// Change right on the edge
		#(16*T+2*t)					// 672 ns
		sig = ~sig;					// s = 1, db stay 0 based on the old input.
										// 674 ns, db change to 1 *****************************

		#(1*T)						// 684 ns
		sig = ~sig;					// s = 1, db stays at 1
		
		// Change right on the edge
		#(15*T)						// 834 ns
		sig = ~sig;					// s = 0, db stays at 1 based the old input.
										// 836 ns, db = 0 **************************************
		
		#(1*T)						// 846 ns
		sig = ~sig;					// s = 1, db stays 0
		
		#(2*T)						// 866 ns
		sig = ~sig;					// s = 0, db stays at 0

		// Wait long enough to see results.
		#(T*70);
        
		// Add stimulus here
		$stop;
	end
      
endmodule

