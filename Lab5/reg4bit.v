`timescale 1 ns / 1 ps

module reg4bit(
		input
			Clock, Hold, Reset, Set,
			[3:0] D,
		output [3:0] Q
	);
	dflipflop Bits3(Clock, Hold, Reset, Set, D[3], Q[3]);
	dflipflop Bits2(Clock, Hold, Reset, Set, D[2], Q[2]);
	dflipflop Bits1(Clock, Hold, Reset, Set, D[1], Q[1]);
	dflipflop Bits0(Clock, Hold, Reset, Set, D[0], Q[0]);
endmodule
