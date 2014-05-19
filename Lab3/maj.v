`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:40 01/28/2014 
// Design Name: 
// Module Name:    maj 
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
module maj(output F, input a, b, c);
	wire a1, a2, a3;
	
	and and1(a1, a, b);
	and and2(a2, a, c);
	and and3(a3, b, c);
	
	or or1(F, a1, a2, a3);
endmodule
