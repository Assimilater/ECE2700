`timescale 1 ns / 1 ps

module Counter(clk, reset, load, dir, count, i3, i2, i1, i0, a, b, c, d, e, f, g, tc, n3, n2, n1, n0);
	input clk, reset,load, dir, count, i3, i2, i1, i0;
	output a, b, c, d, e, f, g;
	output reg tc, n3, n2, n1, n0;
	
	wire clock;
	reg [3:0] N;
	reg [1:0] Active;
	
	// Start the FSM at 0
	initial begin
		N = 'd0;
		Active = 'd0;
	end
	
	// Run subnodes
	clockdivider i_clk(clk, clock);
	seg7 i_seg7(N, a, b, c, d, e, f, g);
	
	// Update position from moving seven segment display
	always @(posedge clk) begin
		if (Active == 3)
			Active <= 0;
		else
			Active <= Active + 1;
	end
	always @(Active) begin
		n3 <= ~(~Active[1] & ~Active[0]);
		n2 <= ~(~Active[1] & Active[0]);
		n1 <= ~(Active[1] & ~Active[0]);
		n0 <= ~(Active[1] & Active[0]);
	end
	
	// Update tc light
	always @(N) begin
		if (N == 0 || N == 15)
			tc <= 1;
		else
			tc <= 0;
	end
	
	// Coutning FSM
	always @(posedge clock) begin
		if (reset == 1)
			N <= 0;
		else if (load == 1) begin
			N[3] <= i3;
			N[2] <= i2;
			N[1] <= i1;
			N[0] <= i0;
		end
		else if (count == 1) begin
			// Increment if dir == 0
			if (dir == 0) begin
				if (N == 15)
					N <= 0;
				else
					N <= N + 1;
			end
			// Decrement if dir == 1
			else begin
				if (N == 0)
					N <= 15;
				else
					N <= N - 1;
			end
		end
	end
	
endmodule
