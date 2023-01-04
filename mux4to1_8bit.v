// #######################################################################
// # Copyright (C)                                                       #
// # 2023 Nima Akbarzade (iw4p@protonmail.com)                           #
// # Permission given to modify the code as long as you keep this        #
// # declaration at the top                                              #
// #######################################################################

module mux4to1(sel1, sel0, i0, i1, i2, i3 , f);
  input sel1, sel0, i0, i1, i2, i3;
  output f;
  wire w1, w2, w3, w4, nsel1, nsel0;
  not(nsel1, sel1);
  not(nsel0, sel0);
  
  and(w1, nsel1, nsel0, i0);
  and(w2, nsel1, sel0, i1);
  and(w3, sel1, nsel0, i2);
  and(w4, sel1, sel0, i3);
  
  or(f, w1, w2, w3, w4);
  
endmodule

module mux4to1_8bit(sel1, sel0, i0, i1, i2, i3 , f);
  input sel1, sel0;
  input [7:0]i3, i2, i1, i0;
  output [7:0]f;

  mux4to1 mux1(.sel1(sel1), .sel0(sel0), .i0(i0[0]), .i1(i1[0]), .i2(i2[0]), .i3(i3[0]), .f(f[0]));
  mux4to1 mux2(.sel1(sel1), .sel0(sel0), .i0(i0[1]), .i1(i1[1]), .i2(i2[1]), .i3(i3[1]), .f(f[1]));
  mux4to1 mux3(.sel1(sel1), .sel0(sel0), .i0(i0[2]), .i1(i1[2]), .i2(i2[2]), .i3(i3[2]), .f(f[2]));
  mux4to1 mux4(.sel1(sel1), .sel0(sel0), .i0(i0[3]), .i1(i1[3]), .i2(i2[3]), .i3(i3[3]), .f(f[3]));
  mux4to1 mux5(.sel1(sel1), .sel0(sel0), .i0(i0[4]), .i1(i1[4]), .i2(i2[4]), .i3(i3[4]), .f(f[4]));
  mux4to1 mux6(.sel1(sel1), .sel0(sel0), .i0(i0[5]), .i1(i1[5]), .i2(i2[5]), .i3(i3[5]), .f(f[5]));
  mux4to1 mux7(.sel1(sel1), .sel0(sel0), .i0(i0[6]), .i1(i1[6]), .i2(i2[6]), .i3(i3[6]), .f(f[6]));
  mux4to1 mux8(.sel1(sel1), .sel0(sel0), .i0(i0[7]), .i1(i1[7]), .i2(i2[7]), .i3(i3[7]), .f(f[7]));

endmodule

module test_mux4to1_8bit;
  reg [7:0]i0t, i1t, i2t, i3t;
  reg sel1t, sel0t;
  wire [7:0]q;
  mux4to1_8bit mux(.sel1(sel1t), .sel0(sel0t), .i0(i0t), .i1(i1t), .i2(i2t), .i3(i3t), .f(q));
  initial begin
    $monitor("sel1=%b, sel0=%b, i0=%b, i1=%b, i2=%b, i3=%b => f=%b", sel1t, sel0t, i0t, i1t, i2t, i3t, q);
    sel1t=1'b0; sel0t=1'b0; i0t=8'b10100100; i1t=8'b00001111; i2t=8'b00011101; i3t=8'b10011100;    
  end
endmodule
      