// Created by Jeevaka Dassanayake on 5/12/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

// Listing 4.15
module DispHexMux
   (
    input wire clk, reset,
    input wire [3:0] hex2, hex1, hex0,  // hex digits
    input wire [2:0] dp_in,             // 3 decimal points
	 input wire [2:0] en_in,
    output reg [2:0] an,  // enable 1-out-of-3 asserted low
    output reg [7:0] sseg // led segments
   );

   // constant declaration
   // refreshing rate around 800 Hz (50 MHz/2^16)
   localparam N = 18;
   // internal signal declaration
   reg [N-1:0] q_reg;
   wire [N-1:0] q_next;
   reg [3:0] hex_in;
   reg dp;
	reg en;

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
               hex_in = hex0;
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
               hex_in = hex2;
               dp = dp_in[2];
					en = en_in[2];
            end
         default:
				begin
					hex_in = 3'b000;
					dp = 1'b0;
					en = 1'b0;
					an = 3'b111;
				end
       endcase

   // hex to seven-segment led display
   always @*
   begin
		if( en )
			case(hex_in)
				4'h0: sseg[6:0] = 7'b0000001;
				4'h1: sseg[6:0] = 7'b1001111;
				4'h2: sseg[6:0] = 7'b0010010;
				4'h3: sseg[6:0] = 7'b0000110;
				4'h4: sseg[6:0] = 7'b1001100;
				4'h5: sseg[6:0] = 7'b0100100;
				4'h6: sseg[6:0] = 7'b0100000;
				4'h7: sseg[6:0] = 7'b0001111;
				4'h8: sseg[6:0] = 7'b0000000;
				4'h9: sseg[6:0] = 7'b0000100;
				4'ha: sseg[6:0] = 7'b0001000;
				4'hb: sseg[6:0] = 7'b1100000;
				4'hc: sseg[6:0] = 7'b0110001;
				4'hd: sseg[6:0] = 7'b1000010;
				4'he: sseg[6:0] = 7'b0110000;
				default: sseg[6:0] = 7'b0111000;  //4'hf
		  endcase
		else
			sseg[6:0] = 7'b1111111;
      sseg[7] = ~dp;
   end

endmodule