
%1.a
smm(Op1, Op2, Soma) :-
    Op1 = [0,S,E,N,D],
    Op2 = [0,M,O,R,E],
    Soma = [M,O,N,E,Y],
    X = [S,E,N,D,M,O,R,Y],
    Digits = [0,1,2,3,4,5,6,7,8,9],
    assign_digits(X, Digits),
    M > 0,
    S > 0,
        1000*S + 100*E + 10*N + D +
        1000*M + 100*O + 10*R + E =:=
    10000*M + 1000*O + 100*N + 10*E + Y.

select(X, [X|R], R).
select(X, [Y|Xs], [Y|Ys]):- select(X, Xs, Ys).

assign_digits([], _List).
assign_digits([D|Ds], List):-
    select(D, List, NewList),
    assign_digits(Ds, NewList).
%1.b
:- lib(ic).
sendmore(Digits) :-
    Digits = [S,E,N,D,M,O,R,Y],
    Digits :: [0..9],
    alldifferent(Digits),
    S #\= 0, M #\= 0,
        1000*S + 100*E + 10*N + D
        + 1000*M + 100*O + 10*R + E
    #= 10000*M + 1000*O + 100*N + 10*E + Y,
    labeling(Digits).


%2
puzzle(Op1,Op2,Soma):-
    Op1 = [D,O,N,A,L,D],
    Op2 = [G,E,R,A,L,D],
    Soma = [R,O,B,E,R,T],
    X = [D,O,N,A,L,G,E,R,B,T],
    Digits = [0,1,2,3,4,5,6,7,8,9],
    assign_digits(X, Digits),
    D > 0,
    G > 0,
        100000*D + 10000*O + 1000*N + 100*A + 10*L + D +
        100000*G + 10000*E + 1000*R + 100*A + 10*L + D =:=
        100000*R + 10000*O + 1000*B + 100*E + 10*R + T.

%4
mapa(X):-
    Digits = [A,B,C,D,E,F,G,H,I,J,K],
    Digits :: [1..3],
    A #\= B, A #\= C, A #\=D,
    B#\=C, B#\=F, B#\=G, B#\=I, B#\=E,
    D#\=C, D#\=E, E #\=I, 
    F #\=G,F#\=H,F#\=J,
    I #\=G, I#\=H, I#\=J, I #\=K,
    H #\=J, J#\=K,
    labeling(Digits).

%5
zebra(Nac,Cor,Animal,Bebida,Tabaco):-
    Nac = [Ingles,Espanhol,Noruegues,Portugues,Ucraniano],
    Cor = [Vermelho,Amarelo,Azul,Verde,Branco],
    Animal = [Cao, Raposa, Iguana,Cavalo,Zebra],
    Bebida=[Cha,Cafe,Agua,Sumo,Leite],
    Tabaco=[Marlboro,Chesterfields,Winston,Luky,SG],
    List =[Nac,Cor,Animal,Bebida,Tabaco],
    flatten(List,Vars),
    Vars :: [1..5],
    alldifferent(Nac),alldifferent(Cor),
    alldifferent(Animal),alldifferent(Bebida),
    alldifferent(Tabaco),
    Ingles#=Vermelho,Espanhol#=Cao,Noruegues#=1,Amarelo#=Marlboro,
    abs(Chesterfields-Raposa)#=1,Azul#=2,Winston#=Iguana,
    Luky#=Sumo,Ucraniano#=Cha,Portugues#=SG,abs(Marlboro-Cavalo)#=1,
    Verde#=Cafe,(Branco-Verde)#=1,Leite#=3,
    labeling(Vars).

queens(N, Board) :-
    length(Board, N), 
    Board :: 1..N, 
    constrain_queens(Board),
    labeling(Board).
constrain_queens([]).
constrain_queens([X|Y]) :-
    safe(X, Y, 1), 
    constrain_queens(Y).
safe(_, [], _).
safe(X, [Y|T], K) :-
    noattack(X, Y, K), 
    K1 is K + 1,
    safe(X, T, K1).
noattack(X, Y, K) :-
    X #\= Y, 
    X + K #\= Y, 
    X - K #\= Y.

nqueens(N, Qs) :-
    length(Qs, N), 
    Qs :: 1..N,
    diagonal(Qs, 1, N, Qs_u, Qs_d),
    alldifferent(Qs), alldifferent(Qs_u), alldifferent(Qs_d),
    labeling(Qs).
diagonal([], _, _, [], []).
diagonal([Q|Qs], N, M, [Qu|Qs_u], [Qd|Qs_d]) :-
    Qu #= Q + N, 
    Qd #= Q + M,
    N1 is N + 1, 
    M1 is M - 1,
    diagonal(Qs, N1, M1, Qs_u, Qs_d).