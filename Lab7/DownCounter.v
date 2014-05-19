`timescale 1 ns / 1 ps
module DownCounter(clk, tc, N);
	input clk;
	output reg tc;
	output reg [1:0]N;
	
	initial begin
		N <= 0;
	end
	
	always @(posedge clk) begin
		if (N == 0) begin
			N <= 3;
			tc <= 0;
		end
		else
			if (N == 1) tc <= 1;
			N <= N - 1;
	end
endmodule
