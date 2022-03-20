// Created by Jeevaka Dassanayake on 5/26/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [2:0] bt, output wire [7:0] ss, output wire [2:0] en );

	wire max_tick;
	wire [4:0] hex2, hex1, hex0;  // hex digits
	
	FrequencyDivider #( 6000000, 23 ) secondClk ( clk, 1'b0, 1'b1, max_tick );

	// bt[0] = 0 - reset; bt[1] = 0 - pause; bt[2] = 1 - count up.
	Banner baner( clk, ~bt[0], ~max_tick || ~bt[1], bt[2], hex2, hex1, hex0 );
	//Banner baner( clk, ~bt[0] , ~max_tick , bt[1], hex2, hex1, hex0 );

	DispHexMux hexMux( clk, 1'b0, hex2, hex1, hex0, 3'b000, 3'b111, en, ss );

endmodule
