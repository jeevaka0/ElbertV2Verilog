// Created by Jeevaka Dassanayake on 5/26/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

// Listing 4.15
module DispHexMux
   (
    input wire clk, reset,
    input wire [4:0] hex2, hex1, hex0,  // hex digits
    input wire [2:0] dp_in,             // 3 decimal points
	 input wire [2:0] en_in,
    output wire [2:0] an_out,  // enable 1-out-of-3 asserted low
    output wire [7:0] sseg_out // led segments
   );

   // constant declaration
   // refreshing rate around 800 Hz (50 MHz/2^16)
   localparam N = 18;
   // internal signal declaration
   reg [N-1:0] q_reg;
   wire [N-1:0] q_next;
   reg [4:0] hex_in;
   reg dp;
	reg en;
   reg [2:0] an;  // enable 1-out-of-3 asserted low
   reg [7:0] sseg; // led segments

   // N-bit counter
   // register
   always @(posedge clk, posedge reset)
      if (reset)
         q_reg <= 0;
      else
         q_reg <= q_next;

   // next-state logic
   assign q_next = q_reg + 1;

   // 2 MSBs of counter to control 4-to-1 multiplexing
   // and to generate active-low enable signal
   always @*
      case (q_reg[N-1:N-2])
         3'b00:
            begin
               an =  3'b110;
               hex_in = hex2;
               dp = dp_in[0];
					en = en_in[0];
            end
         2'b01:
            begin
               an =  3'b101;
               hex_in = hex1;
               dp = dp_in[1];
					en = en_in[1];
            end
         2'b10:
            begin
               an =  3'b011;
               hex_in = hex0;
               dp = dp_in[2];
					en = en_in[2];
            end
         default:
				begin
					an = 3'b111;
               hex_in = 5'b00000;
               dp = 1'b0;
					en = 1'b0;
				end
       endcase

   // hex to seven-segment led display
   always @*
   begin
		if( en )
			case(hex_in)
				5'b00000: sseg[6:0] = 7'b0000001;
				5'b00001: sseg[6:0] = 7'b1001111;
				5'b00010: sseg[6:0] = 7'b0010010;
				5'b00011: sseg[6:0] = 7'b0000110;
				5'b00100: sseg[6:0] = 7'b1001100;
				5'b00101: sseg[6:0] = 7'b0100100;
				5'b00110: sseg[6:0] = 7'b0100000;
				5'b00111: sseg[6:0] = 7'b0001111;
				5'b01000: sseg[6:0] = 7'b0000000;
				5'b01001: sseg[6:0] = 7'b0000100;
				5'b01010: sseg[6:0] = 7'b0001000;
				5'b01011: sseg[6:0] = 7'b1100000;
				5'b01100: sseg[6:0] = 7'b0110001;
				5'b01101: sseg[6:0] = 7'b1000010;
				5'b01110: sseg[6:0] = 7'b0110000;
				5'b01111: sseg[6:0] = 7'b0111000;
				// None-hex cases
				5'b10000: sseg[6:0] = 7'b1000001;			// Letter U
				5'b10001: sseg[6:0] = 7'b1111110;  // Dash  / -ve sign
				5'b10010: sseg[6:0] = 7'b1111111;  // Blank
				5'b10011: sseg[6:0] = 7'b0001001;	// Letter N
				5'b10100: sseg[6:0] = 7'b1100010;	// Letter o
				5'b10101: sseg[6:0] = 7'b0011100;	// Letter o (upper)
				5'b10110: sseg[6:0] = 7'b1111001;	// Letter l (on left)
				5'b10111: sseg[6:0] = 7'b1001001;	// Double l
				default: sseg[6:0] = 7'b1111100;  // Dash / -ve sign
		  endcase
		else
			sseg[6:0] = 7'b1111111;
     sseg[7] = ~dp;
   end

	assign an_out = an;
	assign sseg_out = sseg;

endmodule