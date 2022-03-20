// Created by Jeevaka Dassanayake on 5/13/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [4:0] bt, input wire [7:0] dp, output wire [7:0] ss, output wire [2:0] en );

	wire [7:0]r;		// Signed integer.
	wire uf, of;
	wire [3:0] bcd2, bcd1, bcd0;
	wire ready, done;

	wire [4:0] d2, d1, d0;
	wire [2:0] dp_in;

	Flt2Int flt2int( { dp[7:0], bt[3:0] }, r, of, uf );		// Last bit of the integer part will get ignored.

	Bin2Bcd int2bcd( clk, 1'b0, ~bt[4], { 3'b000, r[6:0] }, ready, done, bcd2[3:0], bcd1[3:0], bcd0[3:0] );

	assign dp_in = r[7] ? 3'b111 : 3'b000;		// Sign (all dots on if -ve)

	assign d0 = ( of || uf ) ? 5'b01111 : { 1'b0, bcd0 };
	assign d1 = of ? 5'b00000 : uf ? 5'b10000 : { 1'b0, bcd1 };
	assign d2 = ( of || uf ) ? 5'b10010 : { 1'b0, bcd2 };							// Init with blank.
	
	// DispHexMux( clk, reset, wire [3:0] hex2, hex1, hex0, wire [2:0] dp_in, en_in, [2:0] an, sseg );
	DispHexMux disp( clk, 1'b0, d2, d1, d0, dp_in, { ready, ready, ready }, en, ss );

endmodule
