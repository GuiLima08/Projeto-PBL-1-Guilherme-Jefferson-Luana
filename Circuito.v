module Circuito(
	input L, B, E, D, F, A, 
	output Gre, Red, DigOff_1, 
	output [4:0] Col,
	output [4:0] Lin,
	output [2:0] DigOff_2a4,
	output [2:0] Erro,
	output [1:0] Re,
	output [1:0] Rd,
	output [1:0] R_Re,
	output [1:0] R_Rd

);
	wire Liga, Pre, Mat, nMat, W_Erro, W_Re, W_Rd, W_R_Re, W_R_Rd, N_Re, N_Rd, N_R_Re, N_R_Rd, N_Erro, N_Mat, N_nMat;

CondErro cond_erro(
	.E(E),
	.D(D),
	.F(F),
	.A(A),
	.Pre(Pre)
);

LigaDesliga liga_desliga(
	.B(B),
	.L(L),
	.Pre(Pre),
	.Gre(Gre),
	.Red(Red),
	.Liga(Liga),
	.Mat(Mat),
	.nMat(nMat),
	.DigOff_1(DigOff_1),
	.Erro(W_Erro)
);

Motores motores(
	.Liga(Liga),
	.E(E),
	.D(D),
	.F(F),
	.Re(W_Re),
	.Rd(W_Rd),
	.R_Re(W_R_Re),
	.R_Rd(W_R_Rd)
);

	not(N_Re, W_Re);
	not(N_Rd, W_Rd);
	not(N_R_Re, W_R_Re);
	not(N_R_Rd, W_R_Rd);
	not(N_Erro, W_Erro);
	not(N_Mat, Mat);
	not(N_nMat, nMat);


	not(Erro[0], N_Erro);
	not(Erro[1], N_Erro);
	not(Erro[2], N_Erro);
	not(DigOff_2a4[0], 0);
	not(DigOff_2a4[1], 0);
	not(DigOff_2a4[2], 0);

	not(Col[0], N_Mat);
	not(Col[1], N_Mat);
	not(Col[2], N_Mat);
	not(Col[3], N_Mat);
	not(Col[4], N_Mat);
	not(Lin[0], N_nMat);
	not(Lin[1], N_nMat);
	not(Lin[2], N_nMat);
	not(Lin[3], N_nMat);
	not(Lin[4], N_nMat);

	not(Re[0], N_Re);
	not(Re[1], N_Re);
	not(Rd[0], N_Rd);
	not(Rd[1], N_Rd);
	not(R_Re[0], N_R_Re);
	not(R_Re[1], N_R_Re);
	not(R_Rd[0], N_R_Rd);
	not(R_Rd[1], N_R_Rd);
	
endmodule