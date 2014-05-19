`timescale 1 ns / 1 ps
module Watch(clk, clk_s, write, mode, up, down, r, led, an, seg);
	input clk, clk_s, write, mode, up, down;
	output r;
	output [5:0] led;
	output [3:0] an;
	output [6:0] seg;
	
	// Manage the clocks
	wire clk_fast, clk_disp, clk_secs, timer;
	clockDivider c_pulse(clk, 25000, clk_disp);
	clockDivider c_fast(clk, 5000000, clk_fast);
	clockDivider c_secs(clk, 50000000, clk_secs);
	mux1bit2x1 m_timer(clk_secs, clk_disp, clk_s, timer);
	
	// Manage the buttons
	wire write_press, mode_press, up_press, down_press, clear_press;
	press p_write(clk, write, write_press);
	press p_mode(clk, mode, mode_press);
	pressCounter p_cnt(clk, clk_fast, up, down, up_press, down_press, clear_press);
	
	// Manage the Execution FSM
	execFSM fsm_exec(clk, write_press, r);
	
	// Manage the Mode FSM
	wire [5:0] led_read, led_write;
	wire [1:0] n_read, n_write, n;
	
	modeFSM_read fsm_mread(clk, r & mode_press, n_read, led_read);
	modeFSM_write fsm_mwrite(clk, ~r & mode_press, n_write, led_write);
	
	mux2bit2x1 m_n(n_write, n_read, r, n);
	mux6bit2x1 m_led(led_write, led_read, r, led);
	
	// Manage the Clock HLSM
	wire [3:0] hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0;
	Clock c_watch(
		clk, timer, r, led, up_press, down_press, clear_press,
		hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0
	);
	
	// Finalize with the Display Driver Combinational Component
	displayFSM fsm_display(clk_disp, hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0, n, led, an, seg);

endmodule

/*
 * Design: Clock Divider for 50 MHz input clock
 * Author: John Call
 * Authored: April 8, 2014
 *
 * seg-7 Display Rate: 25000
 * Speed Clock's Rate: 5000000
 * 1 Hz Division Rate: 50000000
 * 
 */

module clockDivider(clk, Max, clk_out);
	input clk;
	input [31:0] Max;
	output reg clk_out;
	
	reg[31:0] cnt;
	always @(posedge clk) begin
		if (cnt == Max) begin
			clk_out <= 1;
			cnt <= 0;
		end
		else begin
			clk_out <= 0;
			cnt <= cnt + 1;
		end
	end
endmodule

/*
 * Design: Clock Pulse Equalizer
 * Author: John Call
 * Authored: April 8, 2014
 *
 * Companion to the Clock Divider, takes a clock pulse
 * that results from a clock divider to make the clocks
 * active state last as long as its inactive state. Ultimately
 * this is not used in the final watch design, but it made
 * it easier to debug the clocks using an LED when things worked in simulation.
 * 
 */
 
module pulseEqualizer(input clk, output reg s);
	initial begin
		s <= 0;
	end
	always @(posedge clk) begin
		s <= ~s;
	end
endmodule
