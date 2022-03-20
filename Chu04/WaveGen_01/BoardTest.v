// Created by Jeevaka Dassanayake on 5/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [0:0] bt, input wire [7:0] dp, output wire [7:0] led );

	WaveGen waveGen( clk, ~bt[0], dp[7:4], dp[3:0], led[0] );
	
	assign led[1] = led[0];
	assign led[2] = led[0];
	assign led[3] = led[0];
	assign led[4] = led[0];
	assign led[5] = led[0];
	assign led[6] = led[0];
	assign led[7] = led[0];

endmodule
