// Created by Jeevaka Dassanayake on 5/08/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

//module BoardTest( input wire [8:1] sw, input wire [6:1] bt, output wire [7:0] led );
module BoardTest( input wire clk, input wire [3:0] bt, output wire [7:0] ss, output wire [2:0] en );

	wire [7:0] ss3, ss2, ss1;

	Hex2Sseg d1( bt, 1'b0, ss1 );
	Hex2Sseg d2( 4'b1000, 1'b1, ss2 );
	Hex2Sseg d3( 4'b1001, 1'b0, ss3 );

	SsegMux ssm( clk, 1'b0, ss1, ss2, ss3, en, ss );

endmodule
