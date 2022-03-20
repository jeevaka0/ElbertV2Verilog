// Created by Jeevaka Dassanayake on 5/12/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

// Assumes normalized input.
module Flt2Int( input [12:1] a, output reg [7:0] r, output reg of, output reg uf );

always @*
begin
	r[7] = a[12];
	uf = 1'b0;
	of = 1'b0;
	r[6:0] = 7'b0000000;
	case ( a[11:8] )
		4'b0000 : uf = 1'b1;
		4'b0001 : r[6:0] = { 6'b000000, a[7] };
		4'b0010 : r[6:0] = { 5'b00000, a[7:6] };
		4'b0011 : r[6:0] = { 4'b0000, a[7:5] };
		4'b0100 : r[6:0] = { 3'b000, a[7:4] };
		4'b0101 : r[6:0] = { 2'b00, a[7:3] };
		4'b0110 : r[6:0] = { 1'b0, a[7:2] };
		4'b0111 : r[6:0] = a[7:1];
		default : of = 1'b1;
	endcase
end

endmodule
