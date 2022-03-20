// Created by Jeevaka Dassanayake on 5/21/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module WaveGen( input clk, input reset, input [3:0] on_us, input [3:0] off_us, output wave );

	wire max_tick, next_on_en;
	wire [3:0] on_count, off_count;
	reg on_en;
	
	FrequencyDivider us1Tick( clk, reset, max_tick );
	
	ModMCounter #(4) on( clk, reset, max_tick && on_en, on_us, on_count );
	ModMCounter #(4) off( clk, reset, max_tick && ~on_en, off_us, off_count );
	
	always @( posedge clk )
		if( reset )
			on_en <= 1'b1;
		else
			if( max_tick )
				on_en <= next_on_en;

	// Next state
	assign next_on_en =( on_en && on_us - 1 != on_count ) || ( ~on_en && off_us - 1 == off_count );

	// Output
	assign wave = on_en;

endmodule
