filho(joao,jose).
filho(jose,manuel).
filho(carlos,jose).
pai(paulo,filipe).
pai(paulo,maria).
pai(pedro,manuel).
pai(jorge,pedro).
pai(anibal,jorge).

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
descende(X,Y):-
    pai(P,X),
    descende(P,Y).

gdesc(X,Y,1):-pai(Y,X).
gdesc(X,Y,G):-
    pai(P,X),
    gdesc(P,Y,G1),
    G is G1 +1.

gavo(X,Y):-
    gdesc(Y,X,G),
    G is 2.

bisavo(X,Y):-
    gdesc(Y,X,G),
    G is 3.

triavo(X,Y):-
    gdesc(Y,X,G),
    G is 4.

tetraavo(X,Y):-
    gdesc(Y,X,G),
    G is 5.