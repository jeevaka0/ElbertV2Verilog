// Created by Jeevaka Dassanayake on 5/09/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module FpG8er( input [12:0] a, input [12:0] b, output reg g );	// a [sign bit][4 bit exp][8 bit mantissa], normalized.

always @*
begin
	if( a[12] )		// If a is -ve
		g = b[12] ? a[11:0] < b[11:0] : 0;		// If b is -ve as well, then a is greater if its magnitude is less.
	else
		g = b[12] ? 1 : a[11:0] > b[11:0];		// If both are +ve then a is greater if its magnitude is greater.
end

endmodule
