// Created by Jeevaka Dassanayake on 4/07/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module TestMe( input wire A, output wire B );

	assign B=!A;

endmodule
