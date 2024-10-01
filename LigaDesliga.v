module LigaDesliga(
	input L, B, Pre,
	output Liga, Gre, Red, Mat, nMat, DigOff_1, Erro
);
	wire W1, nPre, nB, nL;
	
	not not0(nB, B);
	not not1(nL, L);
	not not2(nPre, Pre);

	and and0(Liga, L, nB, nPre);
	
	and and1(Gre, L, nB);
	or or0(W1, B, Pre);
	and and2(Red, L, W1);
	
	not not3(Mat, nL);
	and and3(nMat, L, B);
	
	not not4(Erro, nPre);
	nand nand0(DigOff_1, Pre, L);
	
endmodule