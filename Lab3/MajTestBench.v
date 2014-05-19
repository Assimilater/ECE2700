`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:28 01/28/2014 
// Design Name: 
// Module Name:    MajTestBench 
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
module MajTestBench();
	reg a, b, c;
	wire F;
	
	maj Test2(F, a, b, c);
	
	initial begin
		// Test all possible input combinations
		a <= 0; b <= 0; c <= 0;
		#10 a <= 0; b <= 0; c <= 1;
		#10 a <= 0; b <= 1; c <= 0;
		#10 a <= 0; b <= 1; c <= 1;
		#10 a <= 1; b <= 0; c <= 0;
		#10 a <= 1; b <= 0; c <= 1;
		#10 a <= 1; b <= 1; c <= 0;
		#10 a <= 1; b <= 1; c <= 1;
	end
endmodule