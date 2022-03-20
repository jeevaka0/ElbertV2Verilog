// Created by Jeevaka Dassanayake on 5/26/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module Message( input [3:0] index, output reg [4:0] value );

always @*
case (index)
	4'h0: value = 5'b01000;
	4'h1: value = 5'b00000;
	4'h2: value = 5'b00100;
	4'h4: value = 5'b00100;
	4'h5: value = 5'b00011;
	4'h6: value = 5'b00010;
	4'h8: value = 5'b00101;
	4'h9: value = 5'b00100;
	4'ha: value = 5'b00111;
	4'hb: value = 5'b00010;


//	4'h0: value = 5'b00000;
//	4'h1: value = 5'b00001;
//	4'h2: value = 5'b00010;
//	4'h3: value = 5'b00011;
//	4'h4: value = 5'b00100;
//	4'h5: value = 5'b00101;
//	4'h6: value = 5'b00110;
//	4'h7: value = 5'b00111;
//	4'h8: value = 5'b01000;
//	4'h9: value = 5'b01001;
	default: value = 5'b10001;
endcase

endmodule
