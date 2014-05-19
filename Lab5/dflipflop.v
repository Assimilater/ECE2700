`timescale 1 ns / 1 ps

module dflipflop(input Clock, Hold, Reset, Set, D, output reg Q);
	always @ (posedge Clock, posedge	Reset, posedge Set)
	begin
		if(Reset == 1) Q <= 0;
		else if(Set == 1) Q <= 1;
		else if(Hold == 0) Q <= D;
	end
endmodule
