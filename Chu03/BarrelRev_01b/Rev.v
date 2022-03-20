// Created by Jeevaka Dassanayake on 4/29/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Rev( input [7:0] a, output [7:0] rrev );

	assign rrev = { a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7] };

endmodule
