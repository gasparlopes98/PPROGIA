soma(X,Y,R):-R is X + Y.
sub(X,Y,R):-R is X-Y.
mul(X,Y,R):-R is X*Y.
div(X,Y,R):-R is X/Y.

soma3(X,Y,Z,R):-
    soma(X,Y,R1),
    R is R1 +Z.

maior(X,Y,R):- R is max(X,Y).

maior3(X,Y,Z,R):-
    maior(X,Y,R1),
    R is max(Z,R1).

menor(X,Y,R):- R is min(X,Y).

menor3(X,Y,Z,R):-
    menor(X,Y,R1),
    R is min(Z,R1).

par(X):- 
    R is X mod 2,
    R==0.

impar(X):- 
    R is X mod 2,
    R\==0.

mdc(X,Y,X):-sub(X,Y,0).
mdc(X,Y,R):-
    maior(X,Y,MAIOR),
    menor(X,Y,MENOR),
    sub(MAIOR,MENOR,R1),
    mdc(R1,MENOR,R).
 
mmc(X,Y,MAIOR):- 
    maior(X,Y,MAIOR),
    menor(X,Y,MENOR),
    MAIOR mod MENOR=:=0.
mmc(X,Y,R):-
    maior(X,Y,MAIOR),
    menor(X,Y,MENOR),
    MAIOR mod MENOR > 0,
    MAIOR1 is MAIOR+MAIOR,
    mmc(MAIOR1,MENOR,R).