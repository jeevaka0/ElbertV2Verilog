// Created by Jeevaka Dassanayake on 5/09/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps

module Int2Flt( input [7:0] a, output reg [12:0] r );

always @*
begin
	r[12] = a[7];
	casez( a[6:0] )
		7'b1?????? : r[11:0] = { 4'b0111, a[6:0], 1'b0 };
		7'b01????? : r[11:0] = { 4'b0110, a[5:0], 2'b00 };
		7'b001???? : r[11:0] = { 4'b0101, a[4:0], 3'b000 };
		7'b0001??? : r[11:0] = { 4'b0100, a[3:0], 4'b0000 };
		7'b00001?? : r[11:0] = { 4'b0011, a[2:0], 5'b00000 };
		7'b000001? : r[11:0] = { 4'b0010, a[1:0], 6'b000000 };
		7'b0000001 : r[11:0] = { 4'b0001, a[0:0], 7'b0000000 };
		7'b0000000 : r[11:0] = { 4'b0000, 7'b0000000 };
	endcase
end

endmodule
