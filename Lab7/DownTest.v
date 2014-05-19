`timescale 1 ns / 1 ps
module DownTest();
	reg Clock;
	wire tc;
	wire [1:0]N;
	
	DownCounter myTest(Clock, tc, N);
	
	initial begin
		Clock <= 0;
	end
	always begin
		 Clock <= 0;
		 #10;
		 Clock <= 1;
		 #10;
	end
endmodule
