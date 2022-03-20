// Created by Jeevaka Dassanayake on 5/22/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module HeartBeat( input clk, input reset, input enable, output [4:0] hex2, output [4:0] hex1, output [4:0] hex0 );

	localparam [4:0] rightOne = 5'b00001;
	localparam [4:0] leftOne = 5'b10110;
	localparam [4:0] DoubleEl = 5'b10111;
	localparam [4:0] blank = 5'b10010;

	wire [1:0] count;
	 
	ModMCounter #( 3, 2 ) counter ( clk, reset, enable, count );

	assign hex2 = count == 2'b01 ? rightOne : count == 2'b10 ? leftOne : blank;
	assign hex1 = count == 2'b00 ? DoubleEl : blank;
	assign hex0 = count == 2'b01 ? leftOne : count == 2'b10 ? rightOne : blank;

endmodule
