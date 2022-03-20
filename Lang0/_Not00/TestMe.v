// Created by Jeevaka Dassanayake on 4/05/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:43 04/02/2018 
// Design Name: 
// Module Name:    TestMe 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TestMe(
    input wire A,
    output wire B
    );

	assign B=!A;

endmodule
