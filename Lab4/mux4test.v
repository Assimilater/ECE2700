`timescale 1 ns/1 ns

module mux4test();
  
  reg I3_s, I2_s, I1_s, I0_s, S1_s, S0_s;
  wire D_s;
  
  mux4x1 m1(I3_s, I2_s, I1_s, I0_s, S1_s, S0_s, D_s);
  
  initial begin
    S1_s <= 0; S0_s <= 0; I3_s <= 0; I2_s <= 0; I1_s <= 0; I0_s <= 1;
    #10 S1_s <= 0; S0_s <= 1; I3_s <= 0; I2_s <= 0; I1_s <= 1; I0_s <= 0;
    #10 S1_s <= 1; S0_s <= 0; I3_s <= 0; I2_s <= 1; I1_s <= 0; I0_s <= 0;
    #10 S1_s <= 1; S0_s <= 1; I3_s <= 1; I2_s <= 0; I1_s <= 0; I0_s <= 0;
  end    
  
endmodule
