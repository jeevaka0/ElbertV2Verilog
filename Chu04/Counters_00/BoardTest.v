// Created by Jeevaka Dassanayake on 5/27/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [0:0] bt, output wire [7:0] led );

	wire max_tick;
	
	FrequencyDivider #( 12000000, 24 ) frequencyDivider1 ( clk, ~bt[0], 1'b1, max_tick );

	ModMCounter #( 256, 8 ) seconds ( clk, ~bt[0], max_tick, led[7:0] );

endmodule
