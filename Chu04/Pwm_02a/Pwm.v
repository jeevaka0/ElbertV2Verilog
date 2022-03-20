// Created by Jeevaka Dassanayake on 5/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Pwm( input clk, input reset, input [3:0] on_frac, output wave );

	wire max_tick;
	wire [3:0] count;
	
	FrequencyDivider us1Tick( clk, reset, max_tick );
	
	Counter #(4) counter( clk, reset, max_tick, count );

	// Output
	assign wave = count < on_frac;

endmodule
