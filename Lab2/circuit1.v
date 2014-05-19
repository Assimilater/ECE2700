`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:27 01/21/2014 
// Design Name: 
// Module Name:    circuit1 
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
module circuit1(input a, b, c, output G);
	wire a_1, b_1, b_2, c_3,
		and1, and2, and3, and4;
	
	not nota_1(a_1, a);
	not notb_1(b_1, b);
	not notb_2(b_2, b);
	not notc_3(c_3, c);
	
	and and_1(and1, a_1, b_1, c);
	and and_2(and2, a, b_2, c);
	and and_3(and3, a, b, c_3);
	and and_4(and4, a, b, c);
	
	or or_1(G, and1, and2, and3, and4);
endmodule
