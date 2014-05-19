`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:51:09 01/28/2014 
// Design Name: 
// Module Name:    VotingTestBench 
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
module VotingTestBench();
	reg s0, s1, s2, t, p;
	wire G;
	
	voting Test3(G, s0, s1, s2, t, p);
	
	initial begin
		// Test ten possible input combinations
		    s0 <= 0; s1 <= 0; s2 <= 0; t <= 0; p <= 0;
		#10 s0 <= 0; s1 <= 0; s2 <= 1; t <= 0; p <= 0;
		#10 s0 <= 0; s1 <= 1; s2 <= 1; t <= 0; p <= 0;
		#10 s0 <= 1; s1 <= 0; s2 <= 1; t <= 0; p <= 0;
		
		#10 s0 <= 0; s1 <= 0; s2 <= 0; t <= 0; p <= 1;
		#10 s0 <= 0; s1 <= 0; s2 <= 0; t <= 1; p <= 0;
		#10 s0 <= 0; s1 <= 0; s2 <= 0; t <= 1; p <= 1;
		
		#10 s0 <= 0; s1 <= 0; s2 <= 0; t <= 0; p <= 1;
		#10 s0 <= 0; s1 <= 0; s2 <= 0; t <= 1; p <= 0;
		#10 s0 <= 1; s1 <= 1; s2 <= 0; t <= 1; p <= 0;
	end
endmodule
