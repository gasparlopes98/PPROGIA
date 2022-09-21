filho(joao,jose).
filho(jose,manuel).
filho(carlos,jose).
pai(paulo,filipe).
pai(paulo,maria).
pai(P,F):-filho(F,P).
avo(antonio,nadia).
avo(A,N):-neto(N,A).
neto(nuno,ana).
neto(N,A):-avo(A,N).
masculino(joao).
masculino(jose).
feminino(maria).
feminino(joana).
descende(X,Y):-pai(Y,X).

graud(X,Y,G):- descende(X,Y), G is 1.
