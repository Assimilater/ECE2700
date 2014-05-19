`timescale 1ns / 1ps

module mux4x1(input I3, I2, I1, I0, S1, S0, output F);
	//Reduced version
	wire mo_0, mo_1;
	
	mux2x1 m0(I1, I0, S0, mo_0);
	mux2x1 m1(I3, I2, S0, mo_1);
	mux2x1 m2(mo_1, mo_0, S1, F);
	
	
	/* Old Version
	wire ms_1, ms_0, mo_1, mo_0;
	
	and a1(ms_0, ~S1, S0);
	mux2x1 m1(I1, I0, ms_0, mo_0);
	
	and a2(ms_1, S1, S0);
	mux2x1 m2(I3, I2, ms_1, mo_1);
	
	mux2x1 m3(mo_1, mo_0, S1, F);
	*/
endmodule
