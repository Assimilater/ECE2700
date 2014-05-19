`timescale 1 ns / 1 ns

module reg4bittest();
  
  reg Clk_s, Hold_s, Rst_s, Set_s;
  reg [3:0]D_s;
  wire [3:0]Q_s;
  
  reg4bit r1(Clk_s, Hold_s, Rst_s, Set_s, D_s, Q_s);
  
  always begin
    Clk_s <= 0;
    #10;
    Clk_s <= 1;
    #10;
  end
  
  initial begin
    Rst_s <= 1;
    D_s <= 'b0000;
    Set_s <= 0;
    Hold_s <= 0;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 1; D_s <= 'b1000;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 0; D_s <= 'b1100;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 0; D_s <= 'b1010;
    @(posedge Clk_s);
    #5 Rst_s <= 0; Set_s <= 0; Hold_s <= 1; D_s <= 'b1001;
    #5 Rst_s <= 1; Set_s <= 0; Hold_s <= 0; D_s <= 'b1110;
    #5 Rst_s <= 0; Set_s <= 1; Hold_s <= 0; D_s <= 'b1101;
  end    
  
endmodule
