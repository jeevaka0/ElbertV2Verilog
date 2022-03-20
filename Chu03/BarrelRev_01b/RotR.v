// Created by Jeevaka Dassanayake on 4/29/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module RotR( input [7:0] a, output [7:0] r );

	assign r = { a[0], a[7:1] };

endmodule
