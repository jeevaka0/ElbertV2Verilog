// Created by Jeevaka Dassanayake on 5/08/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BcdInc( input [3:0] a, input d, output reg [3:0] r, output reg c );

always @*
begin
	r = a + d;
	if( r == 4'b1010 )
		begin
		r = 4'b0000;
		c = 1'b1;
		end
	else
		c = 1'b0;
end

endmodule
