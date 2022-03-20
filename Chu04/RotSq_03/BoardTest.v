// Created by Jeevaka Dassanayake on 5/22/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [0:0] bt, output wire [7:0] ss, output wire [2:0] en );

	wire max_tick;
	wire [4:0] hex2, hex1, hex0;  // hex digits
	
	FrequencyDivider #( 3000000, 22 ) secondClk ( clk, ~bt[0], 1'b1, max_tick );

	RotSq rotSq ( clk, ~bt[0], max_tick, hex2, hex1, hex0 );

	DispHexMux hexMux( clk, ~bt[0], hex2, hex1, hex0, 3'b000, 3'b111, en, ss );

endmodule
