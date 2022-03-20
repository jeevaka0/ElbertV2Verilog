// Created by Jeevaka Dassanayake on 5/11/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

// Listing 6.6
module Bin2Bcd
   (
    input wire clk, reset,
    input wire start,
    input wire [9:0] bin,
    output reg ready, done_tick,
    output wire [3:0] bcd2, bcd1, bcd0
   );

   // symbolic state declaration
   localparam [1:0]
      idle = 2'b00,
      op   = 2'b01,
      done = 2'b10;

   // signal declaration
   reg [1:0] state_reg, state_next;
   reg [9:0] p2s_reg, p2s_next;
   reg [3:0] n_reg, n_next;
   reg [3:0] bcd2_reg, bcd1_reg, bcd0_reg;
   reg [3:0] bcd2_next, bcd1_next, bcd0_next;
   wire [3:0] bcd1_tmp, bcd0_tmp;
	wire [2:0] bcd2_tmp;


   // body
   // FSMD state & data registers
   always @(posedge clk, posedge reset)
      if (reset)
         begin
            state_reg <= idle;
            p2s_reg <= 0;
            n_reg <= 0;
            bcd2_reg <= 0;
            bcd1_reg <= 0;
            bcd0_reg <= 0;
         end
      else
         begin
            state_reg <= state_next;
            p2s_reg <= p2s_next;
            n_reg <= n_next;
            bcd2_reg <= bcd2_next;
            bcd1_reg <= bcd1_next;
            bcd0_reg <= bcd0_next;
         end


   // FSMD next-state logic
   always @*
   begin
      state_next = state_reg;
      ready = 1'b0;
      done_tick = 1'b0;
      p2s_next = p2s_reg;
      bcd0_next = bcd0_reg;
      bcd1_next = bcd1_reg;
      bcd2_next = bcd2_reg;
      n_next = n_reg;
      case (state_reg)
         idle:
            begin
               ready = 1'b1;
               if (start)
                  begin
                     state_next = op;
                     bcd2_next = 0;
                     bcd1_next = 0;
                     bcd0_next = 0;
                     n_next = 4'b1010; // index
                     p2s_next = bin;   // shift register
                     state_next = op;
                  end
            end
         op:
            begin
               // shift in binary bit
               p2s_next = p2s_reg << 1;
               // shift 4 BCD digits
               //{bcd3_next, bcd2_next, bcd1_next, bcd0_next}=
               //{bcd3_tmp[2:0], bcd2_tmp, bcd1_tmp, bcd0_tmp,
               // p2s_reg[12]}

               bcd0_next = {bcd0_tmp[2:0], p2s_reg[9]};
               bcd1_next = {bcd1_tmp[2:0], bcd0_tmp[3]};
               bcd2_next = {bcd2_tmp[2:0], bcd1_tmp[3]};
               n_next = n_reg - 1;
               if (n_next==0)
                   state_next = done;
            end
         done:
            begin
               done_tick = 1'b1;
               state_next = idle;		
            end
         default: state_next = idle;
      endcase
   end

   // data path function units
   assign bcd0_tmp = (bcd0_reg > 4) ? bcd0_reg+3 : bcd0_reg;
   assign bcd1_tmp = (bcd1_reg > 4) ? bcd1_reg+3 : bcd1_reg;
   assign bcd2_tmp = (bcd2_reg > 4) ? (bcd2_reg+3) : bcd2_reg;

   // output
   assign bcd0 = bcd0_reg;
   assign bcd1 = bcd1_reg;
   assign bcd2 = bcd2_reg;

endmodule
