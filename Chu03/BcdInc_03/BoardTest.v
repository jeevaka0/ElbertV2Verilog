// Created by Jeevaka Dassanayake on 5/08/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps


module BoardTest( input wire clk, input wire [7:0] dp, input wire [3:0] bt, output wire [7:0] ss, output wire [2:0] en );
//, output wire [7:0] led );

	wire [3:0] r1, r2, r3;
	wire c1, c2, c3;
	wire [7:0] ss1, ss2, ss3;

	BcdInc dig1( bt[3:0], 1'b1, r1, c1 );
	BcdInc dig2( dp[3:0], c1, r2, c2 );
	BcdInc dig3( dp[7:4], c2, r3, c3 );
	
	//assign led[7:4] = r1;
	//assign led[3:0] = r2;
	
	Hex2Sseg seg1( r1, c1, ss1 );
	Hex2Sseg seg2( r2, c2, ss2 );
	Hex2Sseg seg3( r3, c3, ss3 );
	
	SsegMux sm( clk, 1'b0, ss3, ss2, ss1, en, ss );

endmodule
