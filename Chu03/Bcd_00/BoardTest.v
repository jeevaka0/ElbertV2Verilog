// Created by Jeevaka Dassanayake on 5/12/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [2:0] bt, input wire [7:0] dp, output wire [7:0] ss, output wire [2:0] en );

	wire [3:0] s2, s1, s0;
	wire ready, done;

	// Bin2Bcd( clk, reset, start, [9:0] bin, ready, done_tick, wire [3:0] bcd2, bcd1, bcd0 );
	Bin2Bcd tobcd( clk, 1'b0, ~bt[0],
	{ dp[7:0], bt[2:1] }
	, ready, done, s2, s1, s0 );
	
	// DispHexMux( clk, reset, wire [3:0] hex2, hex1, hex0, wire [2:0] dp_in, en_in, [2:0] an, sseg );
	DispHexMux disp( clk, 1'b0, s2, s1, s0, 3'b000, { ready, ready, ready }, en, ss );

endmodule
