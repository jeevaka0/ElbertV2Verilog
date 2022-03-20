// Created by Jeevaka Dassanayake on 5/22/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module BoardTest( input wire clk, input wire [0:0] bt, input wire [3:0] dp, 
	output wire [2:0] en, output wire [7:0] ss );

	wire [2:0] an;
	wire pulse;

	DispHexMux hexMux( clk, ~bt[0], 5'b01111, 5'b10000, 5'b10011, 3'b000, 3'b111, an, ss );

	Pwm pwm( clk, ~bt[0], dp[3:0], pulse );

	// 'en' is 0-enable signal.
	assign en[0] = an[0] || ~pulse;
	assign en[1] = an[1] || ~pulse;
	assign en[2] = an[2] || ~pulse;

endmodule
