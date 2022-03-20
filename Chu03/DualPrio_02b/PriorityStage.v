// Created by Jeevaka Dassanayake on 5/08/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

`timescale 1ns / 1ps
module PriorityStage( input wire [12:1] r, output reg [3:0] first, output reg [12:1] stage2 );

always @*
begin
	casez (r)
		12'b1???????????: begin first = 4'b1100; stage2 = { 1'b0, r[11:1] }; end
		12'b01??????????: begin first = 4'b1011; stage2 = { 2'b00, r[10:1] }; end
		12'b001?????????: begin first = 4'b1010; stage2 = { 3'b000, r[9:1] }; end
		12'b0001????????: begin first = 4'b1001; stage2 = { 4'b0000, r[8:1] }; end
		12'b00001???????: begin first = 4'b1000; stage2 = { 5'b00000, r[7:1] }; end
		12'b000001??????: begin first = 4'b0111; stage2 = { 6'b000000, r[6:1] }; end
		12'b0000001?????: begin first = 4'b0110; stage2 = { 7'b0000000, r[5:1] }; end
		12'b00000001????: begin first = 4'b0101; stage2 = { 8'b00000000, r[4:1] }; end
		12'b000000001???: begin first = 4'b0100; stage2 = { 9'b000000000, r[3:1] }; end
		12'b0000000001??: begin first = 4'b0011; stage2 = { 10'b000000000, r[2:1] }; end
		12'b00000000001?: begin first = 4'b0010; stage2 = { 11'b0000000000, r[1] }; end
		12'b000000000001: begin first = 4'b0001; stage2 = { 12'b000000000000 }; end
		12'b000000000000: begin first = 4'b0000; stage2 = { 12'b000000000000 }; end
	endcase
end

endmodule