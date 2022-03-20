// Created by Jeevaka Dassanayake on 5/07/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire [5:0] dp, input wire [5:0] bt, output wire [7:0] led );

DualPriority dualpriority( {bt[5:0], dp[5:0] }, led[7:4], led[3:0] );

endmodule
