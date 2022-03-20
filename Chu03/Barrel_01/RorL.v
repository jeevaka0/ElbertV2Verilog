// Created by Jeevaka Dassanayake on 4/29/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module RorL( input [7:0] a, input rr, output [7:0] r );

	assign r = rr ? { a[0], a[7:1] } : { a[6:0], a[7] };

endmodule
