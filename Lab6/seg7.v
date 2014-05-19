`timescale 1ns / 1ps

module seg7(N, a, b, c, d, e, f, g);
	input [3:0] N;
	output reg a, b, c, d, e, f, g;
	always @(N) begin
		if (N == 0) begin
			a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 1; // Output 0
		end
		else if (N == 1) begin
			a = 1; b = 0; c = 0; d = 1; e = 1; f = 1; g = 1; // Output 1
		end
		else if (N == 2) begin
			a = 0; b = 0; c = 1; d = 0; e = 0; f = 1; g = 0; // Output 2
		end
		else if (N == 3) begin
			a = 0; b = 0; c = 0; d = 0; e = 1; f = 1; g = 0; // Output 3
		end
		else if (N == 4) begin
			a = 1; b = 0; c = 0; d = 1; e = 1; f = 0; g = 0; // Output 4
		end
		else if (N == 5) begin
			a = 0; b = 1; c = 0; d = 0; e = 1; f = 0; g = 0; // Output 5
		end
		else if (N == 6) begin
			a = 0; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0; // Output 6
		end
		else if (N == 7) begin
			a = 0; b = 0; c = 0; d = 1; e = 1; f = 1; g = 1; // Output 7
		end
		else if (N == 8) begin
			a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; // Output 8
		end
		else if (N == 9) begin
			a = 0; b = 0; c = 0; d = 0; e = 1; f = 0; g = 0; // Output 9
		end
		else if (N == 10) begin
			a = 0; b = 0; c = 0; d = 1; e = 0; f = 0; g = 0; // Output A
		end
		else if (N == 11) begin
			a = 1; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0; // Output b
		end
		else if (N == 12) begin
			a = 0; b = 1; c = 1; d = 0; e = 0; f = 0; g = 1; // Output C
		end
		else if (N == 13) begin
			a = 1; b = 0; c = 0; d = 0; e = 0; f = 1; g = 0; // Output d
		end
		else if (N == 14) begin
			a = 0; b = 1; c = 1; d = 0; e = 0; f = 0; g = 0; // Output E
		end
		else if (N == 15) begin
			a = 0; b = 1; c = 1; d = 1; e = 0; f = 0; g = 0; // Output F
		end
	end
endmodule
