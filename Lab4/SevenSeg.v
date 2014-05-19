`timescale 1ns / 1ps

module SevenSeg(input w, x, y, z, output a, b, c, d, e, f, g, n3, n2, n1, n0);
	assign n3 = 0;
	assign n2 = 1;
	assign n1 = 1;
	assign n0 = 1;
	
	seg7 seg7_1(w, x, y, z, a, b, c, d, e, f, g);
endmodule
