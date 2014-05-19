`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:14 01/28/2014 
// Design Name: 
// Module Name:    dec3x8 
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
module dec3x8(input i2, i1, i0, output d7, d6, d5, d4, d3, d2, d1, d0);
	wire not2, not1, not0;
	
	not nota(not2, i2);
	not notb(not1, i1);
	not notc(not0, i0);
	
	and and0(d0, not2, not1, not0);
	and and1(d1, not2, not1, i0);
	and and2(d2, not2, i1, not0);
	and and3(d3, not2, i1, i0);
	and and4(d4, i2, not1, not0);
	and and5(d5, i2, not1, i0);
	and and6(d6, i2, i1, not0);
	and and7(d7, i2, i1, i0);

endmodule
