%1
nesimo(1,[X|_],X).
nesimo(N,[_|L],X):-
    N1 is N - 1,
    nesimo(N1,L,X).

%2
ultimo([X|[]],X).
ultimo([_|L],X):-
    ultimo(L,X).

%3
reverse(L1,L2):-
    reverse2(L1,[],L2).

reverse2([],L,L).
    reverse2([X|L1],L2,L3):-
    reverse2(L1,[X|L2],L3).

palindromo(L):- reverse(L,L2),L == L2.

% reverse3([],L,L).
% reverse3([X|L1],L2,L3):- 
%     reverse3(L1,[X|L2],L3).

% palindromo2(L):- reverse3(L,[],L2), L == L2.

%4
append([],L,L).
append([X|L1],L2,[X|L3]):-
    append(L1,L2,L3).

%5   
comprime([X],[X]).
comprime([X1,X2|L1],[X1|L2]):- 
    X1 \= X2 ,
    comprime([X2|L1],L2).
comprime([X1,X2|L1],L2):-
    X1 = X2,
    comprime([X2|L1],L2).

%6
retira(_,[],[]).
retira([N|0],[X|L1], [X|L2]):-
    cria_repetidos((N+1),L1,L2).
retira([N|N1],[X|L1], [X|L2]):-
    N2 is N1-1,
    retira([N|N2],[X|L1],L2).
cria_repetidos(N, L1, L2):-
    N1 is N-1,
    retira([N1|N1],L1,L2).

%8
menormin([],_).
menormin([X|L],M):-
    M1 is min(X,M),
    menormin(L, M1).
menor([X1,X2|L], M):-
    M is min(X1,X2),
    menormin(L, M).

%9
elimina_repetidos([], []).
elimina_repetidos([X|L1], [X|L2]):-
    delete(L1,X,M),
    elimina_repetidos(M, L2).

%10
substitui(_,_,[],[]).
substitui(X,Y,[X|L1],[Y|L2]):-
    substitui(X,Y,L1,L2),!.
substitui(X,Y,[X1|L1],[X1|L2]):-
    substitui(X,Y,L1,L2),!.