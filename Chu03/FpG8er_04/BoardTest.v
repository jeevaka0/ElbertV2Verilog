// Created by Jeevaka Dassanayake on 5/09/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire [7:0] dp, input wire [5:0] bt, output wire [0:0] led );

	wire [12:0] b;
	assign b = { bt[5], 4'b1001 , 8'b10010111 };
	
	FpG8er fpg8er( { bt[4:0], dp[7:0] }, b, led[0] );

endmodule
