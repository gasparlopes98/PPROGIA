progenitor(jose,joao).
progenitor(jose,ana).
progenitor(maria,joao).
progenitor(maria,ana).
progenitor(joao,mario).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(helena,carlos).
progenitor(mario,carlos).
masculino(jose).
masculino(joao).
masculino(mario).
masculino(carlos).
feminino(maria).
feminino(ana).
feminino(helena).
feminino(joana).
descendente(X,Y):- progenitor(Y,X).
filho(X,Y):- progenitor(Y,X),masculino(X).
filha(X,Y):- progenitor(Y,X),feminino(X).
pai(X,Y):- progenitor(X,Y),masculino(X).
mae(X,Y):- progenitor(X,Y),feminino(X).
avo(X,Y):- progenitor(X,A),progenitor(A,Y),masculino(X).
avof(X,Y):- progenitor(X,A),progenitor(A,Y),feminino(X).
irma(X,Y):- progenitor(A,X),progenitor(A,Y),feminino(X),X\=Y.
irmao(X,Y):- progenitor(A,X),progenitor(A,Y),masculino(X),X\=Y.
irmx(X,Y):- progenitor(A,X),progenitor(A,Y),X\=Y.
neto(X,Y):- avo(Y,X),masculino(X).
neta(X,Y):- avo(Y,X),feminino(X).
primo(X,Y):- avo(A,X),avo(A,Y),masculino(X),X\=Y.
prima(X,Y):- avo(A,X),avo(A,Y),feminino(X),X\=Y.
primx(X,Y):- avo(A,X),avo(A,Y),X\=Y,not(irmx(X,Y)).
tio(X,Y):- progenitor(A,Y),irmao(X,A).
tia(X,Y):- progenitor(A,Y),irma(X,A).