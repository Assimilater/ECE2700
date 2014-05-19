`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:39 01/21/2014 
// Design Name: 
// Module Name:    circuit2 
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
module circuit2(input a, b, c, output H);
	wire b_1,
		and1, and2;
	
	not notb_1(b_1, b);
	
	and and_1(and1, a, b);
	and and_2(and2, b_1, c);
	
	or or_1(H, and1, and2);
endmodule
