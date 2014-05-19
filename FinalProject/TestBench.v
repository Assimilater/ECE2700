`timescale 1 ns / 1 ps
module TestBench();
	reg clock; initial clock <= 0; always begin #1 clock <= 1; #1 clock <= 0; end
	
	// Manage the clocks
	wire clk, clk_secs, clk_fast, timer;
	clockDivider c_disp(clock, 2, clk);
	clockDivider c_secs(clock, 20, clk_secs);
	clockDivider c_fast(clock, 10, clk_fast);
	mux1bit2x1 m_timer(clk_secs, clk_fast, clk_s, timer);
	
	//*
	reg u, d; wire up, down, clear;
	pressCounter press(clk, clk_fast, u, d, up, down, clear);
	
	initial begin
		u <= 0;
		d <= 0;
		clk_s <= 1;
		
		#2 u <= 1;
		#140 u <= 1;
		#2 d <= 1;
		#2 u <= 0;
		#140 d <= 0;
		#2 d <= 1;
		#2 u <= 1;
		#140 d <= 0;
		#5 u <= 0;
	end
	
	//*/
	/*
	wire [3:0] hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0;
	reg r, up_press, down_press, clear_press;
	reg [5:0] led;
	
	Clock test(clk, timer, r, led, up_press, down_press, clear_press,
		hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0);
	
	initial begin
		r <= 0;
		up_press <= 1;
		down_press <= 0;
		clear_press <= 0;
		led = 'b000010;
	end
	
	//*/
endmodule
