`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:16 01/21/2014 
// Design Name: 
// Module Name:    circuit1test 
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
module testbench();
	reg a, b, c;
	wire G;

	circuit1 Test1(a, b, c, G);
	circuit2 Test2(a, b, c, H);

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
