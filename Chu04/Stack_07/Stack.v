// Created by Jeevaka Dassanayake on 5/28/18.
//   Copyright (c) 2018 Jeevaka Dassanayake.

// Listing 4.20
module Stack #( parameter DATA_BITS=8, ADDRESS_BITS=4 )( input wire clk, reset, input wire push, pop, input wire [DATA_BITS-1:0] w_data
	, output wire empty, full, output wire [DATA_BITS-1:0] r_data );

   // State variables
   reg [DATA_BITS-1:0] stack [2**ADDRESS_BITS-1:0];  // register array
   reg [ADDRESS_BITS-1:0] top;
	reg isFull;								// When top == 0, this tells if the stack is full or empty.
	
	wire [DATA_BITS-1:0] top_value;
	
	// Next state variables.
	reg [ADDRESS_BITS-1:0] next_top;
	reg nextFull;
	reg [DATA_BITS-1:0] next;
	
	// If both push and pop are enabled, then the input w_data is assigned to r_data without any state changes.

	// State update on clock.
	always @( posedge clk, posedge reset )
	begin
		if( reset )
		begin
			top = 0;					// Next empty slot.
			isFull = 1'b0;			// Stack is not full.
		end
		else if( push )			// push (covers pop case if enabled as well)
		begin
			top = next_top;
			stack[ next_top - 1 ] = next;
			isFull = nextFull;
		end
		else if ( pop )		// pop
		begin
			top = next_top;
			isFull = nextFull;
		end	
	end


	assign top_value = stack[ top - 1 ];		// Arrays do not work in always @* (in spartan 3?)

	// Next state logic.
   always @*
   begin
		// Do nothing by default.
		next_top = top;
		next = top_value;
		nextFull = isFull;
      case ( { push, pop } )
         // 2'b00:  no op
         2'b01: // read
				begin
					if ( top != 0 || isFull ) // not empty
						next_top = top - 1;
					nextFull = 1'b0;
				end
         2'b10: // write
            if ( ~isFull ) // not full
               begin
						next_top = top + 1;
						next = w_data;
						nextFull = next_top == 0;
					end
         2'b11: // Push and pop. Done independently. Existing top is poped. And new w_data is pushed.
            begin
					next = w_data;
            end
      endcase
   end
	
	// Output logic. (Valid at next clock posedge.)
	assign empty = top == 0 && !isFull;
	assign full = isFull;
	assign r_data = stack[top - 1];		// Will be garbage if empty.

endmodule

