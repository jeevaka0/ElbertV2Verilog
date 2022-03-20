// Created by Jeevaka Dassanayake on 4/05/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:11:32 04/02/2018
// Design Name:   TestMe
// Module Name:   /Work/Learn/FPGA/Xilinix/Elbertv2/Delme/TestYou.v
// Project Name:  Delme
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TestMe
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

		// Wait 100 ns for global reset to finish
		#10;
	
		//$finish;
		$stop;
	end
		
endmodule
