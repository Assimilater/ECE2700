`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:31 01/21/2014 
// Design Name: 
// Module Name:    disco_test 
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
module disco_test();
	reg S, M;
	wire B, L;
	ds_system Test(S, M, B, L);

	initial begin
		// Test all possible input combinations
		S <= 0; M <= 0;
		#10 S <= 0; M <= 1;
		#10 S <= 1; M <= 0;
		#10 S <= 1; M <= 1;
	end
endmodule
