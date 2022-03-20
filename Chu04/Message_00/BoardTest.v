// Created by Jeevaka Dassanayake on 5/24/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [3:0] bt, output wire [7:0] ss, output wire [2:0] en );

	wire [4:0] value;

	Message message ( bt, value );

	DispHexMux hexMux( clk, 1'b0, value, value, value, 3'b000, 3'b111, en, ss );

endmodule
