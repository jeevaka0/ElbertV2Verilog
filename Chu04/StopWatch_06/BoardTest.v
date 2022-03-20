// Created by Jeevaka Dassanayake on 5/27/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [2:0] bt, output wire [7:0] ss, output wire [2:0] en );

	// ~bt[0] - reset
	// bt[1] - enable (go)
	// bt[2] - count up.

	wire [3:0] hex2, hex1, hex0;
	wire sec_tick, sec10_tick, minute_tick;

	FrequencyDivider #( 12000000, 24 ) secondClk ( clk, ~bt[0], bt[1], sec_tick );

	ModMCounterWithUDFD #( 10, 4 ) seconds( clk, ~bt[0], sec_tick && bt[1], bt[2], hex0, sec10_tick );

	ModMCounterWithUDFD #( 6, 4 ) tenSeconds( clk, ~bt[0], sec10_tick && bt[1], bt[2], hex1, minute_tick );

	ModMCounterWithUD #( 6, 3 ) minutes( clk, ~bt[0], minute_tick && bt[1], bt[2], hex2 );

	DispHexMux disp( clk, ~bt[0], hex2, hex1, hex0, 3'b100, 3'b111, en, ss );

endmodule
