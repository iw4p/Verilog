// #######################################################################
// # Copyright (C)                                                       #
// # 2023 Nima Akbarzade (iw4p@protonmail.com)                           #
// # Permission given to modify the code as long as you keep this        #
// # declaration at the top                                              #
// #######################################################################

module mux4to1(sel1, sel0, i0, i1, i2, i3, f);
  input i0, i1, i2, i3, sel1, sel0;
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

module test_mux4to1;
  reg i0t,  i1t, i2t, i3t, sel1t, sel0t;
  wire q;
  mux4to1 mux(.sel1(sel1t), .sel0(sel0t), .i0(i0t), .i1(i1t), .i2(i2t), .i3(i3t), .f(q));
  initial begin
    $monitor("sel1=%b, sel0=%b, i0=%b, i1=%b, i2=%b, i3=%b => f=%b ", sel1t, sel0t, i0t, i1t, i2t, i3t, q);
    sel1t=1'b0; sel0t=1'b0; i0t=1'b1; i1t=1'b0; i2t=1'b0; i3t=1'b0;
    #10
    sel1t=1'b0; sel0t=1'b1; i0t=1'b0; i1t=1'b1; i2t=1'b0; i3t=1'b0;
    #10
    sel1t=1'b1; sel0t=1'b0; i0t=1'b0; i1t=1'b0; i2t=1'b1; i3t=1'b0;
    #10
    sel1t=1'b1; sel0t=1'b1; i0t=1'b0; i1t=1'b0; i2t=1'b0; i3t=1'b1;
    #10
    
    sel1t=1'b0; sel0t=1'b0; i0t=1'b0; i1t=1'b1; i2t=1'b1; i3t=1'b1;
    #10
    sel1t=1'b0; sel0t=1'b1; i0t=1'b1; i1t=1'b0; i2t=1'b1; i3t=1'b1;
    #10
    sel1t=1'b1; sel0t=1'b0; i0t=1'b1; i1t=1'b1; i2t=1'b0; i3t=1'b1;
    #10
    sel1t=1'b1; sel0t=1'b1; i0t=1'b1; i1t=1'b1; i2t=1'b1; i3t=1'b0;
    
  end
endmodule
