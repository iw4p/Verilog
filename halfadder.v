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

module test_halfAdder();
reg x1, y1;
wire cout1, sum1;
halfAdder half1(.x(x1), .y(y1), .sum(sum1), .cout(cout1));
initial begin
	$monitor("x=%b, y=%b => sum=%b, cout=%b ", x1, y1, sum1, cout1);
	x1 = 1'b0; y1 = 1'b0;
	#10
	x1 = 1'b1; y1 = 1'b0;
	#10
	x1 = 1'b0; y1 = 1'b1;
	#10
	x1 = 1'b1; y1 = 1'b1;
end 
endmodule 

