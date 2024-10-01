module Motores(
	input E, D, F, Liga,
	output Rd, R_Rd, Re, R_Re
);
	wire nF, nE, nD, W0, W1, W2, W3, W4, W_Rd, W_R_Rd, W_Re, W_R_Re;
	
	not not1(nF, F);
	not not2(nE, E);
	not not3(nD, D);
	
	// Re
	or or0(W1, E, nF);
	and and0(W_Re, nD, W1);
	
	// Rd
	or or2(W2, D, nF);
	and and1(W_Rd, nE, W2);
	
	// R_Re
	or or4(W3, D, F);
	and and2(W_R_Re, W3, nE);
	
	// R_Rd
	or or5(W4, E, F);
	and and3(W_R_Rd, W4, nD);
	
	// Condiçao de funcionamento
	and and4(Re, W_Re, Liga);
	and and5(Rd, W_Rd, Liga);
	and and6(R_Re, W_R_Re, Liga);
	and and7(R_Rd, W_R_Rd, Liga);

endmodule