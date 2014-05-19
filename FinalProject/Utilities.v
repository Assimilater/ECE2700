`timescale 1 ns / 1 ps

module seg7(input [3:0] N, output reg [6:0] Q); // Q = abcdefg
	always @(N) begin
		if (N == 0)
			Q = 'b0000001; // Output 0
		else if (N == 1)
			Q = 'b1001111; // Output 1
		else if (N == 2)
			Q = 'b0010010; // Output 2
		else if (N == 3)
			Q = 'b0000110; // Output 3
		else if (N == 4)
			Q = 'b1001100; // Output 4
		else if (N == 5)
			Q = 'b0100100; // Output 5
		else if (N == 6)
			Q = 'b0100000; // Output 6
		else if (N == 7)
			Q = 'b0001111; // Output 7
		else if (N == 8)
			Q = 'b0000000; // Output 8
		else if (N == 9)
			Q = 'b0000100; // Output 9
		else if (N == 10)
			Q = 'b0001000; // Output A
		else if (N == 11)
			Q = 'b1100000; // Output b
		else if (N == 12)
			Q = 'b0110001; // Output C
		else if (N == 13)
			Q = 'b1000010; // Output d
		else if (N == 14)
			Q = 'b0110000; // Output E
		else if (N == 15)
			Q = 'b0111000; // Output F
	end
endmodule

module mux1bit2x1(I1, I0, S, Q);
	input S;
	input I1, I0;
	output reg Q;
	
	always @(*) begin
		if(S == 1) begin
			Q <= I0;
		end
		else begin
			Q <= I1;
		end
	end
endmodule

module mux2bit2x1(I1, I0, S, Q);
	input S;
	input [1:0] I1, I0;
	output reg [1:0] Q;
	
	always @(*) begin
		if(S == 1) begin
			Q <= I0;
		end
		else begin
			Q <= I1;
		end
	end
endmodule

module mux6bit2x1(I1, I0, S, Q);
	input S;
	input [5:0] I1, I0;
	output reg [5:0] Q;
	
	always @(*) begin
		if(S == 1) begin
			Q <= I0;
		end
		else begin
			Q <= I1;
		end
	end
endmodule
