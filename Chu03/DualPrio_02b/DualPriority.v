// Created by Jeevaka Dassanayake on 5/08/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module DualPriority( input wire [12:1] r, output wire [3:0] first , output wire [3:0] second );

wire [12:1] stage2, stage3;

PriorityStage s1( r, first, stage2 );
PriorityStage s2( stage2, second, stage3 );

endmodule
