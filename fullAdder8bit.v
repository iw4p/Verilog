// #######################################################################
// # Copyright (C)                                                       #
// # 2023 Nima Akbarzade (iw4p@protonmail.com)                           #
// # Permission given to modify the code as long as you keep this        #
// # declaration at the top                                              #
// #######################################################################

module fullAdder(x, y, cin, cout, sum);
  input  x, y , cin;
  output cout, sum;
  wire w1, w2, w3;
  
  xor(sum, x, y, cin);
  
  and(w1, x, y);
  and(w2, x, cin);
  and(w3, y, cin);
  
  or(cout, w1, w2, w3);
  
endmodule

module fullAdder8bit(x, y, cin, cout, sum);
  input cin;
  input [7:0]x, y;
  output [7:0]sum;
  output cout;
  wire [6:0]c;
  fullAdder f1(.x(x[0]), .y(y[0]), .cin(cin), .cout(c[0]), .sum(sum[0]));
  fullAdder f2(.x(x[1]), .y(y[1]), .cin(c[0]), .cout(c[1]), .sum(sum[1]));
  fullAdder f3(.x(x[2]), .y(y[2]), .cin(c[1]), .cout(c[2]), .sum(sum[2]));
  fullAdder f4(.x(x[3]), .y(y[3]), .cin(c[2]), .cout(c[3]), .sum(sum[3]));
  fullAdder f5(.x(x[4]), .y(y[4]), .cin(c[3]), .cout(c[4]), .sum(sum[4]));
  fullAdder f6(.x(x[5]), .y(y[5]), .cin(c[4]), .cout(c[5]), .sum(sum[5]));
  fullAdder f7(.x(x[6]), .y(y[6]), .cin(c[5]), .cout(c[6]), .sum(sum[6]));
  fullAdder f8(.x(x[7]), .y(y[7]), .cin(c[6]), .cout(cout), .sum(sum[7]));
endmodule

module test_fullAdder8bit;
  reg cint;
  reg [7:0]xt, yt;
  wire [7:0]sumt;
  wire coutt;
  
  fullAdder8bit fullAdderM(.x(xt), .y(yt), .cin(cint), .cout(coutt), .sum(sumt));
  initial begin
    $monitor("x=%d, y=%d, cin=%d => cout=%d, sum=%d", xt, yt, cint, coutt, sumt);
    xt = 8'b01101011; yt = 8'b01011101; cint = 1'b0;
    #10
    xt = 8'b10000000; yt = 8'b00100001; cint = 1'b0;
    #10
    xt = 8'b01000000; yt = 8'b00010001; cint = 1'b1;
    
  end
endmodule
