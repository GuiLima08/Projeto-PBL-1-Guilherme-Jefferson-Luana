module CondErro(
	input E, D, F, A,
	output Pre
);
	wire W1, W2, W3, W4;
	
	and and0(W1, E, D);
	or or0(W2, F, E, D);
	and and2(W3, W2, A);
	or or1(Pre, W1, W3);

endmodule