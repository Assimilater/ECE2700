`timescale 1ns / 1ps

module shifter(
	input i3, i2, i1, i0,
	      s1, s0,
	output d3, d2, d1, d0);
	
	//        rotate right,     (s1 s0 = 11)
	//        |   right,        (s1 s0 = 10)
	//        |   |   left,     (s1 s0 = 01)
	//        |   |   |   hold, (s1 s0 = 00)
	//        |   |   |   |   Select, Output
	mux4x1 m1(i0, 0,  i2, i3, s1, s0, d3);
	mux4x1 m2(i3, i3, i1, i2, s1, s0, d2);
	mux4x1 m3(i2, i2, i0, i1, s1, s0, d1);
	mux4x1 m4(i1, i1, 0,  i0, s1, s0, d0);
endmodule
