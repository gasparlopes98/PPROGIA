%1
nesimo(1,[X|_],X).
nesimo(N,[_|L],X):-
    N1 is N - 1,
    nesimo(N1,L,X).

%2
ultimo([X|[]],X).
ultimo([_|L],X):-
    ultimo(L,X),!.

%3
reverse(L1,L2):-
    reverse2(L1,[],L2).

reverse2([],L,L).
    reverse2([X|L1],L2,L3):-
    reverse2(L1,[X|L2],L3).

palindromo(L):- reverse(L,L2),L == L2.

%4 
flatten1([],[]).
flatten1([H|L1],[H|L2]):-    % se elemento não for lista
    atom(H),                % verificação se H é um átomo
    flatten1(L1,L2),!.
flatten1([Lx|Ly],L2):-      % se elemento for lista
    flatten1(Lx,X),
    flatten1(Ly,Y),
    append(X,Y,L2).         % listas sem elementos listas são adicionadas a L2

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
    cria_repetidos((N+1),L1,L2),!.
retira([N|N1],[X|L1], [X|L2]):-
    N2 is N1-1,
    retira([N|N2],[X|L1],L2).
cria_repetidos(N, L1, L2):-
    N1 is N-1,
    retira([N1|N1],L1,L2).

%7
rotatelist([H], [], H).  % guarda ultimo valor da lista original (L1) e L2 = vazio
rotatelist([X|L1], [X|L2], H) :- % vai colocando valores de L1 em L2
    rotatelist(L1, L2, H). 
rotatelist(L1, [H|L2]):- % coloca o ultimo valor da lista original na nova lista
    rotatelist(L1, L2, H).

rodar(0,L,L). % L2 vai ser igual a L1 rodada N vezes
rodar(N, L1, L2):-
    N1 is N-1,
    rotatelist(L1,L3), % devolve lista (L3) com ultimo valor de L1 na cabeça
    rodar(N1,L3,L2),!.

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

%11
uniao(L1,L2,L3):-
    append(L1,L2,M),
    elimina_repetidos(M,L3).

%12
intersecao([],_,[]).
intersecao([X|L1], L2,[X|L3]):-
    member(X, L2),!,
    intersecao(L1,L2,L3).
intersecao([_|L1], L2,L3):-
    intersecao(L1,L2,L3).
    