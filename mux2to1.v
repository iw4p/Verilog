// #######################################################################
// # Copyright (C)                                                       #
// # 2023 Nima Akbarzade (iw4p@protonmail.com)                           #
// # Permission given to modify the code as long as you keep this        #
// # declaration at the top                                              #
// #######################################################################

module mux2to1(sel, i1, i0, f);
    input i0, i1, sel;
    output f;
    wire nsel, w1, w2;
    not(nsel, sel);
    and(w1, i0, nsel);
    and(w2, i1, sel);
    or(f, w1, w2);
endmodule

module test_mux2to1;
  reg s, a1, a0;
  wire q;
  mux2to1 mux(.sel(s), .i1(a1), .i0(a0), .f(q));
  initial begin
    $monitor("sel = %b: i0 = %b, i1 = %b --> f = %b", s, a0, a1, q);
    s = 1'b0; a1=1'b0; a0=1'b0;
    #10
    s = 1'b0; a1=1'b1; a0=1'b1;
    #10
    s = 1'b0; a1=1'b1; a0=1'b0;
    #10
    s = 1'b0; a1=1'b1; a0=1'b1;
    #10
    s = 1'b1; a1=1'b0; a0=1'b0;
    #10
    s = 1'b1; a1=1'b0; a0=1'b1;
    #10
    s = 1'b1; a1=1'b1; a0=1'b0;
    #10
    s = 1'b1; a1=1'b1; a0=1'b1;
  end
endmodule
