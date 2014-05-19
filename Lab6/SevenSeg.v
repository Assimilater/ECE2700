`timescale 1 ns / 1 ps

module SevenSeg(clk, reset, move, count, a, b, c, d, e, f, g, n3, n2, n1, n0);
	input clk, reset, move, count;
	output a, b, c, d, e, f, g;
	output reg n3, n2, n1, n0;
	
	wire clock;
	reg [3:0] N;
	reg [1:0] Active;
	
	initial begin
		Active = 'd0;
		N = 'd0;
	end
	
	clockdivider i_clk(clk, clock);
	seg7 i_seg7(N, a, b, c, d, e, f, g);
	
	always @(posedge clock) begin
		if (reset == 1) begin
			Active <= 0;
			N <= 0;
		end
		else begin
			// Moving seven segment display
			if (move == 1) begin
				if (Active == 3)
					Active <= 0;
				else
					Active <= Active + 1;
			end
			
			// Sophisticated incrementing seven segment display
			if (count == 1) begin
				if (N == 15)
					N <= 0;
				else
					N <= N + 1;
			end
		end
	end
	
	always @(Active) begin
		// Update position from moving seven segment display
		n3 <= ~(~Active[1] & ~Active[0]);
		n2 <= ~(~Active[1] & Active[0]);
		n1 <= ~(Active[1] & ~Active[0]);
		n0 <= ~(Active[1] & Active[0]);
	end
endmodule
