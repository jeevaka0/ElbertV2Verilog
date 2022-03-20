// Created by Jeevaka Dassanayake on 5/08/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

module SsegMux( input wire clk, reset, input [7:0] in2, in1, in0, output reg [2:0] an, output reg [7:0] sseg );

   // constant declaration
   // refreshing rate around 800 Hz (50 MHz/2^16)
   localparam N = 18;

   // signal declaration
   reg [N-1:0] q_reg;
   wire [N-1:0] q_next;

   // N-bit counter
   // register
   always @(posedge clk,  posedge reset)
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
         2'b00:
            begin
               an = 3'b110;
               sseg = in0;
            end
         2'b01:
            begin
               an =  3'b101;
               sseg = in1;
            end
         default:
            begin
               an =  3'b011;
               sseg = in2;
            end
       endcase

endmodule
