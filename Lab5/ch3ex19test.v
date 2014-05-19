`timescale 1 ns / 1 ns

module ch3ex19test();
	
	reg Clock, Hold, Reset, Set;
	reg [1:0]S;
	reg [3:0]I;
	wire [3:0]D;
	
	ch3ex19 e1(Clock, Hold, Reset, Set, S, I, D);
	
	always begin
		 Clock <= 0;
		 #10;
		 Clock <= 1;
		 #10;
	end
	
	initial begin
		// Initialize everything at 0
		Reset <= 1; Set <= 0; Hold <= 0;
		I <= 'b0000; S <= 'd3;
		
		// Release reset and set the first value
		@(posedge Clock);
		#5 Reset <= 0; I <= 'b0001;
		
		// Hold so each value can be inspected
		@(posedge Clock);
		#5 Hold <= 1;
		#5 S <= 'd3;
		#5 S <= 'd2;
		#5 S <= 'd1;
		#5 S <= 'd0;
		#5 S <= 'd3;
		
		// Release Hold, update to the next input value
		@(posedge Clock);
		#5 Hold <= 0; I <= 'b1000;
		
		// Repeat the above two sections a couple times
		@(posedge Clock);
		#5 Hold <= 1;
		#5 S <= 'd3;
		#5 S <= 'd2;
		#5 S <= 'd1;
		#5 S <= 'd0;
		#5 S <= 'd3;
		
		@(posedge Clock);
		#5 Hold <= 0; I <= 'b1100;
		
		@(posedge Clock);
		#5 Hold <= 1;
		#5 S <= 'd3;
		#5 S <= 'd2;
		#5 S <= 'd1;
		#5 S <= 'd0;
		#5 S <= 'd3;
		
		@(posedge Clock);
		#5 Hold <= 0; I <= 'b1010;
		
		@(posedge Clock);
		#5 Hold <= 1;
		#5 S <= 'd3;
		#5 S <= 'd2;
		#5 S <= 'd1;
		#5 S <= 'd0;
		#5 S <= 'd3;
		
		@(posedge Clock);
		#5 Hold <= 0; I <= 'b1110;
		
		@(posedge Clock);
		#5 Hold <= 1;
		#5 S <= 'd3;
		#5 S <= 'd2;
		#5 S <= 'd1;
		#5 S <= 'd0;
		#5 S <= 'd3;

		// Test Set and Reset (Hold is assumed to work to make the prior tests function)
		@(posedge Clock);
		#10 Set <= 1;
		#10 Reset <= 1;
		#10 I <= 0000; Hold <= 0; Set <= 0; Reset <= 0;
	end
	
endmodule
