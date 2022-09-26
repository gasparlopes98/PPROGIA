nesimo(1,[X|_],X).
nesimo(N,[_|L],X):-
    N1 is N - 1,
    nesimo(N1,L,X).

ultimo([X|[]],X).
ultimo([_|L],X):-
    ultimo(L,X).

reverse(L1,L2):-
    reverse2(L1,[],L2).

reverse2([],L,L).
    reverse2([X|L1],L2,L3):-
    reverse2(L1,[X|L2],L3).

palindromo(L):- reverse(L,L2),L == L2.

reverse3([],L,L).
reverse3([X|L1],L2,L3):- 
    reverse3(L1,[X|L2],L3).

palindromo2(L):- reverse3(L,[],L2), L == L2.

append([],L,L).
append([X|L1],L2,[X|L3]):-
    append(L1,L2,L3).

flatten(L1,L2):- append(L1,L2).
   