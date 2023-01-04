// #######################################################################
// # Copyright (C)                                                       #
// # 2023 Nima Akbarzade (iw4p@protonmail.com)                           #
// # Permission given to modify the code as long as you keep this        #
// # declaration at the top                                              #
// #######################################################################

module halfAdder(x, y, sum, cout);
input x, y;
output sum, cout;
xor(sum, x, y);
and(cout, x, y);
endmodule

module fullAdder(x, y, cin, cout, sum);
  input  x, y , cin;
  wire w0, w1, w2;
  output cout, sum;
  
  halfAdder h1(.x(cin), .y(x), .sum(w0), .cout(w1));
  halfAdder h2(.x(w0), .y(y), .sum(sum), .cout(w3));
  
  or(cout, w1, w2);
  
endmodule

module test_fullAdder;

reg x1, y1, cin1;
wire cout1, sum1;

fullAdder fadder1(.x(x1), .y(y1), .cin(cin1), .cout(cout1), .sum(sum1));

initial begin
$monitor("x=%b, y=%b, cin=%b => sum=%b, cout=%b ", x1, y1, cin1, sum1, cout1);
#10
x1=1'b0;y1=1'b0;cin1=1'b0;
#10
x1=1'b0;y1=1'b0;cin1=1'b1;
#10
x1=1'b0;y1=1'b1;cin1=1'b0;
#10
x1=1'b0;y1=1'b1;cin1=1'b1;
#10
x1=1'b1;y1=1'b0;cin1=1'b0;
#10
x1=1'b1;y1=1'b0;cin1=1'b1;
#10
x1=1'b1;y1=1'b1;cin1=1'b0;
#10
x1=1'b1;y1=1'b1;cin1=1'b1;

end

endmodule


