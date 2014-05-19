`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:13 01/21/2014 
// Design Name: 
// Module Name:    ds_system 
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
module ds_system(input S, M, output B, L);
	wire m_;
	
	not not1(m_, M);
	and and1(B, S, m_);
	and and2(L, S, M);
endmodule
