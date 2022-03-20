// Created by Jeevaka Dassanayake on 6/07/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module AltDebounce #( parameter COUNT = 1, parameter BITS = 1 )( input clk, input reset, input sig, output db );

	// State. WAIT => We are waiting for the timer to expire so that we can test the input again.
	localparam ZERO = 2'b00;
	localparam ZERO_WAIT = 2'b01;
	localparam ONE = 2'b10;
	localparam ONE_WAIT = 2'b11;
	
	wire [BITS-1:0] count;
	wire timerOn;
	reg [1:0] state, next;
	
	assign timerOn = state == ZERO_WAIT || state == ONE_WAIT;

	ModMCounter #( COUNT, BITS ) ms20Clk( clk, reset, timerOn, count );

	// State changes
	always @( posedge clk, posedge reset )
	begin
		if( reset )
			state = ZERO;
		else
			state = next;
	end
	
	// Next state logic
	always @*
	begin
		next = state;
		case (state)
			ZERO		: if( sig ) next = ONE_WAIT;
			ZERO_WAIT: if( 0 == count ) next = sig ? ONE_WAIT : ZERO;
			ONE		: if( ~sig ) next = ZERO_WAIT;
			ONE_WAIT : if( 0 == count ) next = sig ? ONE : ZERO_WAIT;
		endcase
	end
	
	assign db = state == ONE || state == ONE_WAIT;

endmodule
