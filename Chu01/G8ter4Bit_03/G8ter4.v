// Created by Jeevaka Dassanayake on 4/25/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module G8ter4( input [3:0] a, input [3:0] b, output gg );

	wire g32, g10;
	
	G8ter2 ms2b( a[3:2], b[3:2], g32 );
	G8ter2 ls2b( a[1:0], b[1:0], g10 );
	
	assign gg = g32 | ( g10 & ( a[3] == b[3] ) & ( a[2] == b[2] ) );

endmodule
