`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:02 01/28/2014 
// Design Name: 
// Module Name:    DecoderTestBench 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DecoderTestBench();
	reg i2, i1, i0;
	wire d7, d6, d5, d4, d3, d2, d1, d0;
	
	dec3x8 Test1(i2, i1, i0, d7, d6, d5, d4, d3, d2, d1, d0);
	
	initial begin
		// Test all possible input combinations
		i2 <= 0; i1 <= 0; i0 <= 0;
		#10 i2 <= 0; i1 <= 0; i0 <= 1;
		#10 i2 <= 0; i1 <= 1; i0 <= 0;
		#10 i2 <= 0; i1 <= 1; i0 <= 1;
		#10 i2 <= 1; i1 <= 0; i0 <= 0;
		#10 i2 <= 1; i1 <= 0; i0 <= 1;
		#10 i2 <= 1; i1 <= 1; i0 <= 0;
		#10 i2 <= 1; i1 <= 1; i0 <= 1;
	end
endmodule
