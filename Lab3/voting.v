`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:50:57 01/28/2014 
// Design Name: 
// Module Name:    voting 
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
module voting(output G, input s0, s1, s2, t, p);
	wire m1;
	
	maj maj1(m1, s0, s1, s2);
	maj maj2(G, m1, t, p);
endmodule
