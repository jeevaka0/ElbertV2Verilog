// Created by Jeevaka Dassanayake on 5/22/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module ModMCounter #( parameter M = 2, parameter N = 1 )( input clk, input reset, input en, output [N-1:0] count );

reg [N-1:0] counter;
wire [N-1:0] next;

// State changes
always @( posedge clk, posedge reset )
begin
	if( reset )
		counter <= 0;
	else
		counter <= next;
end

// Next state logic
assign next = en ? ( counter == M - 1 ? 0 : counter + 1 ) : counter;

// Output
assign count = counter;

endmodule
