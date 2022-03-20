// Created by Jeevaka Dassanayake on 5/28/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

// Listing 4.21
module StackTest( input wire clk, input wire [2:0] bt, input wire [2:0] dp, output wire [7:0] led );

   // signal declaration
   wire [1:0] db_btn;

   Debounce debounce0( clk, ~bt[2], ~bt[0], , db_btn[0] );
   Debounce debounce1( clk, ~bt[2], ~bt[1], , db_btn[1] );

   // instantiate a 2^2-by-3 stack
								// clk, reset, push, 	pop, 		w_data, empty, full, r_data
   Stack #( 3, 2 ) stack( clk, ~bt[2], db_btn[0], db_btn[1], dp, led[7], led[6], led[2:0] );

   // disable unused leds
   assign led[5:3] = 3'b000;

 endmodule

