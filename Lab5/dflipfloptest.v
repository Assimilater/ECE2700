`timescale 1 ns/1 ns

module dflipfloptest();
  
  reg Clk_s, Hold_s, Rst_s, Set_s;
  reg D_s;
  wire Q_s;
  
  dflipflop d1(Clk_s, Hold_s, Rst_s, Set_s, D_s, Q_s);
  
  always begin
    Clk_s <= 0;
    #10;
    Clk_s <= 1;
    #10;
  end
  
  initial begin
    Rst_s <= 1; 
    D_s <= 0;
    Set_s <= 0;
    Hold_s <= 0;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 1; D_s <= 1;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 0; D_s <= 1;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 0; D_s <= 1;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 1; D_s <= 0;
    #5 Rst_s <= 1; Set_s <= 0; Hold_s <= 0; D_s <= 0;
    #5 Rst_s <= 0; Set_s <= 1; Hold_s <= 0; D_s <= 0;
  end    
  
endmodule
