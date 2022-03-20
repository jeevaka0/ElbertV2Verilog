// Created by Jeevaka Dassanayake on 5/24/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [7:0] dp, output wire [7:0] ss, output wire [2:0] en );

	wire [7:0] ss1, ss2, ss3;
	wire [12:0] flt;

	Int2Flt int2flt( dp, flt );
	
	Hex2Sseg seg3( flt[11:8], flt[12], ss3 );
	Hex2Sseg seg2( flt[7:4], 1'b0, ss2 );
	Hex2Sseg seg1( flt[3:0], 1'b0, ss1 );

	SsegMux sm( clk, 1'b0, ss3, ss2, ss1, en, ss );

endmodule
