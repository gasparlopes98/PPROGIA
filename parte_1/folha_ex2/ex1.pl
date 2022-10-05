fatorial(0,1).
fatorial(N,F):-
    N1 is N-1,
    factorial(N1,F1),
    F is F1*N.

potencia(_,0,1).
potencia(B,P,R):-
    P1 is P-1,
    potencia(B,P1,R1),
    R is R1*B.

somatorio(X,Y,(X+Y)/2):-Y==X.
somatorio(X,Y,0):-X>Y.
somatorio(I,F,B):-
    F1 is F-1,
    I1 is I+1,
    somatorio(I1,F1,B1),
    B is B1+F1+I1.

divisao(N,D,R,B):-
    B is N // D,
    R is N mod D.