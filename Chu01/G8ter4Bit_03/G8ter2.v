// Created by Jeevaka Dassanayake on 4/23/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module G8ter2( input [1:0] a, input [1:0] b, output g );

	assign g = ( a[0] & ~b[1] & ~b[0] ) | ( a[1] & ~ b[1] ) | ( a[1] & a[0] & ~b[0] );

endmodule
