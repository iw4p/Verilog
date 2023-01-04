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

module logicUnit8bit(x, y, sel1, sel0, f);
  input [7:0]x, y;
  input sel0, sel1;
  output [7:0]f;

  wire nsel1, nsel0;
  wire xOry, xAndy, xXory, xNot;
  wire w1, w2, w3, w4;
  
  not(nsel1, sel1);
  not(nsel0, sel0);
  
  or(xOry[0], x[0], y[0]);
  or(xOry[1], x[1], y[1]);
  or(xOry[2], x[2], y[2]);
  or(xOry[3], x[3], y[3]);
  or(xOry[4], x[4], y[4]);
  or(xOry[5], x[5], y[5]);
  or(xOry[6], x[6], y[6]);
  or(xOry[7], x[7], y[7]);

  and(xAndy[0], x[0], y[0]);
  and(xAndy[1], x[1], y[1]);
  and(xAndy[2], x[2], y[2]);
  and(xAndy[3], x[3], y[3]);
  and(xAndy[4], x[4], y[4]);
  and(xAndy[5], x[5], y[5]);
  and(xAndy[6], x[6], y[6]);
  and(xAndy[7], x[7], y[7]);

  xor(xOry[0], x[0], y[0]);
  xor(xOry[1], x[1], y[1]);
  xor(xOry[2], x[2], y[2]);
  xor(xOry[3], x[3], y[3]);
  xor(xOry[4], x[4], y[4]);
  xor(xOry[5], x[5], y[5]);
  xor(xOry[6], x[6], y[6]);
  xor(xOry[7], x[7], y[7]);

  not(xNot[0], x[0]);
  not(xNot[1], x[1]);
  not(xNot[2], x[2]);
  not(xNot[3], x[3]);
  not(xNot[4], x[4]);
  not(xNot[5], x[5]);
  not(xNot[6], x[6]);
  not(xNot[7], x[7]);
  mux4to1_8bit mux4to1(.sel1(sel1), .sel0(sel0), .i0(xOry), .i1(xAndy), .i2(xXory), .i3(xNot), .f(f));
endmodule

module test_logicUnit8bit;
  reg [7:0]xt, yt;
  reg sel1t, sel0t;
  wire ft;
  logicUnit8bit lu8bit(.x(xt), .y(yt), .sel1(sel1t), .sel0(sel0t), .f(ft));
  initial begin
    $monitor("x=%b, y=%b, sel1=%b, sel0=%b => f=%b", xt, yt, sel1t, sel0t, ft);
    xt=8'b01101100; yt=8'b00010111; sel1t=1'b0; sel0t=1'b0;
    #10
    xt=8'b01101100; yt=8'b00010111; sel1t=1'b0; sel0t=1'b1;
    #10
    xt=8'b01101100; yt=8'b00010111; sel1t=1'b1; sel0t=1'b0;
    #10
    xt=8'b01101100; yt=8'b00010111; sel1t=1'b1; sel0t=1'b1; 
  end
endmodule
  