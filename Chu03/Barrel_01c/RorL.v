// Created by Jeevaka Dassanayake on 4/30/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module RorL( input [7:0] a, input rr, output reg [7:0] r );

	always @*
	begin
		if ( rr )
			begin
			r = { a[0], a[7:1] };
			end
		else
			begin
			r = { a[6:0], a[7] };
			end
	end

endmodule
