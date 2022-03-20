// Created by Jeevaka Dassanayake on 5/22/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.


module RotSq( input clk, input reset, input enable, output [4:0] hex2, output [4:0] hex1, output [4:0] hex0 );

	localparam [4:0] blank = 5'b10010;
	localparam [4:0] upperO = 5'b10101;
	localparam [4:0] lowerO = 5'b10100;

	wire [2:0] count;
	 
	ModMCounter #( 6, 3 ) counter ( clk, reset, enable, count );

	assign hex2 = count == 3'b011 ? upperO : count == 3'b100 ? lowerO : blank;
	assign hex1 = count == 3'b010 ? upperO : count == 3'b101 ? lowerO : blank;
	assign hex0 = count == 3'b001 ? upperO : count == 3'b000 ? lowerO : blank;

endmodule
