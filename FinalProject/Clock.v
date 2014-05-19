`timescale 1 ns / 1 ps
module Clock(
	clk, timer, r, edit, up_press, down_press, clear_press,
	hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0
);
	input clk, timer, r, up_press, down_press, clear_press;
	input [5:0] edit;
	output [3:0] hr1, hr0, min1, min0, sec1, sec0, m1, m0, d1, d0, y1, y0;
	
	wire [7:0] d_sec, d_min, d_hr, d_d, d_m, d_y;
	wire tc_sec, tc_min, tc_hr, tc_d, tc_m, tc_y;
	
	// Logic for maximum days
	reg [7:0] d_max;
	initial begin d_max <= 'd31; end
	always @(clk, d_m, d_y) begin
		// Handle February
		if (d_m == 'd2) begin
			// Leap year occurs if the year is divisible by 4
			if (d_y[1] == 0 && d_y[0] == 0) 
				d_max <= 'd29;
			else
				d_max <= 'd28;
		end
		// All even months have 30 days (except February)
		else if(d_m[0] == 0) begin
			d_max <= 'd30;
		end
		// All odd months have 31 days (remember to convert January from 1 to 0)
		else begin
			d_max <= 'd31;
		end
	end
	
	// Manage seconds
	UpDownCounter_i0 c_sec(clk, r, up_press & edit[3], down_press & edit[3], clear_press & edit[3], 'd59, timer, tc_sec, d_sec);
	Bin2DecConverter bd_sec(d_sec, sec1, sec0);
	
	// Manage minutes
	UpDownCounter_i0 c_min(clk, r, up_press & edit[4], down_press & edit[4], clear_press & edit[4], 'd59, tc_sec, tc_min, d_min);
	Bin2DecConverter bd_min(d_min, min1, min0);
	
	// Manage hours
	UpDownCounter_i1 c_hr(clk, r, up_press & edit[5], down_press & edit[5], clear_press & edit[5], 'd24, tc_min, tc_hr, d_hr);
	Bin2DecConverter bd_hr(d_hr, hr1, hr0);
	
	// Manage days
	UpDownCounter_i1 c_d(clk, r, up_press & edit[1], down_press & edit[1], clear_press & edit[1], d_max, tc_hr, tc_d, d_d);
	Bin2DecConverter bd_d(d_d, d1, d0);
	
	// Manage months
	UpDownCounter_i1 c_m(clk, r, up_press & edit[2], down_press & edit[2], clear_press & edit[2], 'd12, tc_d, tc_m, d_m);
	Bin2DecConverter bd_m(d_m, m1, m0);
	
	// Manage years
	UpDownCounter_i0 c_y(clk, r, up_press & edit[0], down_press & edit[0], clear_press & edit[0], 'd99, tc_m, tc_y, d_y);
	Bin2DecConverter bd_y(d_y, y1, y0);
endmodule

module UpDownCounter_i0(clk, r, up, down, clear, Max, tc_in, tc_out, N);
	input clk, r, up, down, clear, tc_in;
	input [7:0] Max;
	parameter Min = 0;
	output reg tc_out;
	output reg [7:0] N;
	
	initial begin
		N <= Min;
		tc_out = 0;
	end
	
	always @(posedge clk) begin
		tc_out <= 0;
		
		if (r) begin
			if (tc_in) begin
				if (N == Max) begin
					N <= Min;
					tc_out <= 1;
				end
				else
					N <= N + 1;
			end
		end
		else begin
			if (clear)
				N <= Min;
			else if (up) begin
				if (N == Max)
					N <= Min;
				else begin
					N <= N + 1;
				end
			end
			else if (down) begin
				if (N == Min)
					N <= Max;
				else
					N <= N - 1;
			end
		end
		
		if (N > Max || N < Min)
			N <= Min;
	end
endmodule

module UpDownCounter_i1(clk, r, up, down, clear, Max, tc_in, tc_out, N);
	input clk, r, up, down, clear, tc_in;
	input [7:0] Max;
	parameter Min = 1;
	output reg tc_out;
	output reg [7:0] N;
	
	initial begin
		N <= Min;
		tc_out = 0;
	end
	
	always @(posedge clk) begin
		tc_out <= 0;
		
		if (r) begin
			if (tc_in) begin
				if (N == Max) begin
					N <= Min;
					tc_out <= 1;
				end
				else
					N <= N + 1;
			end
		end
		else begin
			if (clear)
				N <= Min;
			else if (up) begin
				if (N == Max)
					N <= Min;
				else
					N <= N + 1;
			end
			else if (down) begin
				if (N == Min)
					N <= Max;
				else
					N <= N - 1;
			end
		end
		
		if (N > Max || N < Min)
			N <= Min;
	end
endmodule

module Bin2DecConverter(N, d_n1, d_n0);
	input [7:0] N;
	output reg [3:0] d_n1, d_n0;
	
	reg [7:0] temp;
	reg [15:0] n1, n2, n3, nsum;
	
	always @(N) begin
		// Use 26 (1 1010) / 256 (1 0000 0000) as an approximation of the tens digit
		n1 = N << 5;
		n2 = N << 4;
		n3 = N << 2;
		nsum = n1 + n2 + n3;
		nsum = nsum >> 9;
		
		d_n1 = nsum[3:0];
		
		temp = nsum[3:0];
		temp = temp * 'd10;
		temp = N - temp;
		
		d_n0 = temp[3:0];
		
		// 69, 79, 89, and 99 don't round correctly
		if (d_n0 == 'd15) begin
			d_n1 = d_n1 - 1;
			d_n0 = 9;
		end
	end
endmodule
