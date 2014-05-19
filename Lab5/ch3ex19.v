`timescale 1 ns / 1 ps

module ch3ex19(Clock, Hold, Reset, Set, S, I, D);
	
	input Clock, Hold, Reset, Set;
	input [1:0]S;
	input [3:0]I;
	output [3:0]D;
	
	// Can this be made into a two-dimensional vector?
	wire [3:0]R3, R2, R1, R0;
	// wire [3:0][3:0]R;
	// reg [3:0]R[3:0];
	
	reg4bit Q3(Clock, Hold, Reset, Set, I, R3);
	reg4bit Q2(Clock, Hold, Reset, Set, R3, R2);
	reg4bit Q1(Clock, Hold, Reset, Set, R2, R1);
	reg4bit Q0(Clock, Hold, Reset, Set, R1, R0);
	
	mux4bit4x1 controller(R3, R2, R1, R0, S, D);
	
	// If R can be two dimensional this will work
	// reg4bit Q3(Clock, Hold, Reset, Set, I, R[3]);
	// reg4bit Q2(Clock, Hold, Reset, Set, R[3], R[2]);
	// reg4bit Q1(Clock, Hold, Reset, Set, R[2], R[1]);
	// reg4bit Q0(Clock, Hold, Reset, Set, R[1], R[0]);
	
	// mux4bit4x1 controller(R[3], R[2], R[1], R[0], S, D);
	
endmodule

	