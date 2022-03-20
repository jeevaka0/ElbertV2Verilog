// Created by Jeevaka Dassanayake on 5/22/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Pwm( input clk, input reset, input [3:0] on_frac, output wave );

	wire [3:0] count;
	
	Counter #(4) counter( clk, reset, 1'b1, count );

	// Output
	assign wave = count < on_frac;

endmodule
