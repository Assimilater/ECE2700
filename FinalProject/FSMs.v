`timescale 1 ns / 1 ps

module execFSM(input clk, w, output reg r);
	initial begin
		r <= 1;
	end
	always @(posedge clk) begin
		if (w == 1)
			r <= ~r;
	end
endmodule

module modeFSM_read(clk, m, n, led);
	input clk, m;
	output reg [1:0] n;
	output reg [5:0] led;
	
	reg [1:0] state;
	
	initial begin
		state <= 'd0;
		n <= 'b11;
		led <= 'b110000;
	end
	
	// Encode states
	parameter Time = 0;
	parameter Secs = 1;
	parameter Date = 2;
	parameter Year = 3;
	
	// Sequential logic
	always @(posedge clk) begin
		if (m == 1) begin
			if (state == Time)
					state <= Secs;
			else if (state == Secs)
					state <= Date;
			else if (state == Date)
					state <= Year;
			else if (state == Year)
					state <= Time;
		end
	end
	
	// Combinational logic
	always @(state) begin
		if (state == Time) begin
			n <= 'b11;
			led <= 'b110000;
		end
		else if (state == Secs) begin
			n <= 'b01;
			led <= 'b001000;
		end
		else if (state == Date) begin
			n <= 'b11;
			led <= 'b000110;
		end
		else if (state == Year) begin
			n <= 'b01;
			led <= 'b000001;
		end
	end
endmodule

module modeFSM_write(clk, m, n, led);
	input clk, m;
	output reg [1:0] n;
	output reg [5:0] led;
	
	reg [2:0] state;
	
	// Encode states
	parameter Hour = 0;
	parameter Mins = 1;
	parameter Secs = 2;
	parameter Mon = 3;
	parameter Day = 4;
	parameter Year = 5;
	
	initial begin
		state <= Hour;
		n <= 'b10;
		led <= 'b100000;
	end
	
	// Sequential logic
	always @(posedge clk) begin
		if (state == Hour) begin
			if (m == 1) state <= Mins;
		end
		else if (state == Mins) begin
			if (m == 1) state <= Secs;
		end
		else if (state == Secs) begin
			if (m == 1) state <= Mon;
		end
		else if (state == Mon) begin
			if (m == 1) state <= Day;
		end
		else if (state == Day) begin
			if (m == 1) state <= Year;
		end
		else if (state == Year) begin
			if (m == 1) state <= Hour;
		end
		else
				state <= Hour;
	end
	
	// Combinational logic
	always @(state) begin
		if (state == Hour) begin
			n <= 'b10;
			led <= 'b100000;
		end
		else if (state == Mins) begin
			n <= 'b01;
			led <= 'b010000;
		end
		else if (state == Secs) begin
			n <= 'b01;
			led <= 'b001000;
		end
		else if (state == Mon) begin
			n <= 'b10;
			led <= 'b000100;
		end
		else if (state == Day) begin
			n <= 'b01;
			led <= 'b000010;
		end
		else if (state == Year) begin
			n <= 'b01;
			led <= 'b000001;
		end
	end
endmodule

module displayFSM(clk, hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0, n, d, an, seg);
	input clk;
	input [1:0] n;
	input [5:0] d;
	input [3:0] hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0;
	output [6:0] seg;
	output reg [3:0] an;
	
	// Logic for selecting a specific annode
	reg [1:0] an_state;
	initial begin an_state <= 'd0; end
	always @(posedge clk) begin
		if (an_state == 'd3)
			an_state <= 'd0;
		else
			an_state <= an_state + 1;
	end
	always @(an_state, n) begin
		an <= 4'b1111;
		if (an_state == 'd0) begin
			if (n[0] == 1) an[3] <= 0;
		end
		else if (an_state == 'd1) begin
			if (n[0] == 1) an[2] <= 0;
		end
		else if (an_state == 'd2) begin
			if (n[1] == 1) an[1] <= 0;
		end
		else begin
			if (n[1] == 1) an[0] <= 0;
		end
	end
	
	// Logic for selecting a number based on the annode
	reg [3:0] num;
	seg7 n2seg7(num, seg);
	always @(an) begin
		if (~an[0]) begin
			if (d[5])
				num <= hr1;
			else if (d[2])
				num <= m1;
			else
				num <= 'd15;
		end
		else if (~an[1]) begin
			if (d[5])
				num <= hr0;
			else if (d[2])
				num <= m0;
			else
				num <= 'd15;
		end
		else if (~an[2]) begin
			if (d[4])
				num <= min1;
			else if (d[3])
				num <= sec1;
			else if (d[1])
				num <= d1;
			else if (d[0])
				num <= y1;
			else
				num <= 'd15;
		end
		else if (~an[3]) begin
			if (d[4])
				num <= min0;
			else if (d[3])
				num <= sec0;
			else if (d[1])
				num <= d0;
			else if (d[0])
				num <= y0;
			else
				num <= 'd15;
		end
	end
endmodule

module press(input clk, u, output reg bp);
	reg [1:0] state;
	
	// Encode states
	parameter init = 0;
	parameter ready = 1;
	parameter press = 2;
	parameter hold = 3;
	
	initial begin
		state <= init;
		bp <= 0;
	end
	
	// Sequential logic
	always @(posedge clk) begin
		if (state == init) begin
			if (u == 1)
				state <= press;
			else
				state <= ready;
		end
		else if (state == ready) begin
			if (u == 1)
				state <= press;
		end
		else if (state == press) begin
			if (u == 1)
				state <= hold;
			else
				state <= ready;
		end
		else if (state == hold) begin
			if (u == 0)
				state <= ready;
		end
	end
	
	// Combinational logic
	always @(state) begin
		if (state == press)
			bp <= 1;
		else
			bp <= 0;
	end
endmodule

module pressCounter(input clk, clk_fast, u, d, output up, down, clear);
	reg [2:0] state;
	
	parameter holdCount = 50000000; // Approx. 1 Hz
	reg [31:0] cnt;
	
	// Encode states
	parameter ready = 0;
	parameter uPress = 1;
	parameter uHoldStill = 2;
	parameter uHoldActive = 3;
	parameter dPress = 4;
	parameter dHoldStill = 5;
	parameter dHoldActive = 6;
	parameter reset = 7;
	
	// Combinational logic
	assign up = state == uPress || (state == uHoldActive && clk_fast);
	assign down = state == dPress || (state == dHoldActive && clk_fast);
	assign clear = state == reset;
	
	initial begin
		state <= ready;
		cnt <= holdCount;
	end
	
	// Sequential logic
	always @(posedge clk) begin
		if (state == ready) begin
			if (u & ~d)
				state <= uPress;
			else if (~u & d)
				state <= dPress;
			else if (u & d)
				state <= reset;
		end
		else if (state == uPress) begin
			if (~u & ~d)
				state <= ready;
			else if (~u & d)
				state <= dPress;
			else if (u & d)
				state <= reset;
			else begin
				state <= uHoldStill;
				cnt <= 0;
			end
		end
		else if (state == uHoldStill) begin
			if (~u & ~d)
				state <= ready;
			else if (~u & d)
				state <= dPress;
			else if (u & d)
				state <= reset;
			else if (cnt == holdCount)
				state <= uHoldActive;
			else
				cnt <= cnt + 1;
		end
		else if (state == uHoldActive) begin
			if (~u & ~d)
				state <= ready;
			else if (~u & d)
				state <= dPress;
			else if (u & d)
				state <= reset;
		end
		else if (state == dPress) begin
			if (~u & ~d)
				state <= ready;
			else if (u & ~d)
				state <= uPress;
			else if (u & d)
				state <= reset;
			else begin
				state <= dHoldStill;
				cnt <= 0;
			end
		end
		else if (state == dHoldStill) begin
			if (~u & ~d)
				state <= ready;
			else if (u & ~d)
				state <= uPress;
			else if (u & d)
				state <= reset;
			else if (cnt == holdCount)
				state <= dHoldActive;
			else
				cnt <= cnt + 1;
		end
		else if (state == dHoldActive) begin
			if (~u & ~d)
				state <= ready;
			else if (u & ~d)
				state <= uPress;
			else if (u & d)
				state <= reset;
		end
		else if (state == reset) begin
			if (u & d)
				cnt <= 0;
			else if (cnt != holdCount)
				cnt <= cnt + 1;
			else if (~u & ~d)
				state <= ready;
			else if (u & ~d)
				state <= uPress;
			else if (~u & d)
				state <= dPress;
		end
	end
endmodule
