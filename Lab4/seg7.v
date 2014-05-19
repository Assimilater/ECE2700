`timescale 1ns / 1ps

module seg7(input w, x, y, z, output reg a, b, c, d, e, f, g);
	always @(w, x, y, z)
	begin
		if (w == 0 && x == 0 && y == 0 && z == 0)
			// Output 0
			begin
				a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 1;
			end
		else if (w == 0 && x == 0 && y == 0 && z == 1)
			// Output 1
			begin
				a = 1; b = 0; c = 0; d = 1; e = 1; f = 1; g = 1;
			end
		else if (w == 0 && x == 0 && y == 1 && z == 0)
			// Output 2
			begin
				a = 0; b = 0; c = 1; d = 0; e = 0; f = 1; g = 0;
			end
		else if (w == 0 && x == 0 && y == 1 && z == 1)
			// Output 3
			begin
				a = 0; b = 0; c = 0; d = 0; e = 1; f = 1; g = 0;
			end
		else if (w == 0 && x == 1 && y == 0 && z == 0)
			// Output 4
			begin
				a = 1; b = 0; c = 0; d = 1; e = 1; f = 0; g = 0;
			end
		else if (w == 0 && x == 1 && y == 0 && z == 1)
			// Output 5
			begin
				a = 0; b = 1; c = 0; d = 0; e = 1; f = 0; g = 0;
			end
		else if (w == 0 && x == 1 && y == 1 && z == 0)
			// Output 6
			begin
				a = 0; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0;
			end
		else if (w == 0 && x == 1 && y == 1 && z == 1)
			// Output 7
			begin
				a = 0; b = 0; c = 0; d = 1; e = 1; f = 1; g = 1;
			end
		else if (w == 1 && x == 0 && y == 0 && z == 0)
			// Output 8
			begin
				a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0;
			end
		else if (w == 1 && x == 0 && y == 0 && z == 1)
			// Output 9
			begin
				a = 0; b = 0; c = 0; d = 0; e = 1; f = 0; g = 0;
			end
		else if (w == 1 && x == 0 && y == 1 && z == 0)
			// Output A
			begin
				a = 0; b = 0; c = 0; d = 1; e = 0; f = 0; g = 0;
			end
		else if (w == 1 && x == 0 && y == 1 && z == 1)
			// Output b
			begin
				a = 1; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0;
			end
		else if (w == 1 && x == 1 && y == 0 && z == 0)
			// Output C
			begin
				a = 0; b = 1; c = 1; d = 0; e = 0; f = 0; g = 1;
			end
		else if (w == 1 && x == 1 && y == 0 && z == 1)
			// Output d
			begin
				a = 1; b = 0; c = 0; d = 0; e = 0; f = 1; g = 0;
			end
		else if (w == 1 && x == 1 && y == 1 && z == 0)
			// Output E
			begin
				a = 0; b = 1; c = 1; d = 0; e = 0; f = 0; g = 0;
			end
		else if (w == 1 && x == 1 && y == 1 && z == 1)
			// Output F
			begin
				a = 0; b = 1; c = 1; d = 1; e = 0; f = 0; g = 0;
			end
	end
endmodule
