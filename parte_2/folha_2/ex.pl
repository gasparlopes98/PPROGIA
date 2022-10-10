%1



%:- nodbgcomp.
:- set_flag(gc_interval, 40000000).      
:- set_flag(print_depth, 128).


:- lib(ic).
:- lib(ic_global).


queens(N, Qs, Back) :-
	length(Qs, N),
	Qs :: 1..N,

	diagonal( Qs, 1, Qs_u, Qs_d ),

	ic_global:alldifferent(Qs),
	ic_global:alldifferent(Qs_u),
	ic_global:alldifferent(Qs_d),

	middle_first(Qs, OrderedQs),

	search(OrderedQs, 0, first_fail, indomain_median, complete, [backtrack(Back)]).


diagonal([], _, [], []).
diagonal([Q|Qs], N, [Qu|Qs_u], [Qd|Qs_d]) :-
	Nneg is -N,
	ac_eq(Qu, Q, N),
	ac_eq(Qd, Q, Nneg),
	N1 is N + 1,
	diagonal(Qs, N1, Qs_u, Qs_d).


middle_first_indomain(X) :-
	nonvar(X).

middle_first_indomain(X) :-
	var(X),
	get_domain_as_list(X, List),
	middle_first(List, Ordered),
	member(X, Ordered).


middle_first(List, Ordered) :-
	halve(List, Front, Back),
	reverse(Front, RevFront),
	splice(Back, RevFront, Ordered).


halve(List, Front, Back) :-
	length(List, Len),
	Half_Len is Len // 2,
	length(Front, Half_Len),
	append(Front, Back, List).


splice(L, [], L).
splice([H1|L1], [H2|L2], [H1, H2|L]) :-
	splice(L1, L2, L).



%2
solve(L,F,S):-
    [L,F,S] :: -5..5,
    abs(L-F)#>=3,
    abs(L-S)#>=3,
    abs(F-S)#>=3,
    (48*L+54*F+24*S)#=0,

    labeling([L,F,S]).

%3
cardinal(L,U,Cs):-
   sats(Cs,N),
   N #=< U,
   L #=< N.


sats([],0).
sats([C1|Cs],N1):-
   call(B #= C1),
   N1 #= N2 + B,
   sats(Cs,N2).

nurse(S):-
    S = [X11,X12,X13,X14,X12,X22,X32,X42,X13,X23,X33,X43,X14,X24,X34,X44,X15,X25,X35,X45,X16,X26,X36,X46,X17,X27,X37,X47],
	S::0..1,
    cardinal(4,7,[X11#=1,X12#=1,X13#=1,X14#=1,X15#=1,X16#=1,X17#=1]),
    cardinal(3,7,[X21#=1,X22#=1,X23#=1,X24#=1,X25#=1,X26#=1,X27#=1]),
    cardinal(3,7,[X31#=1,X32#=1,X33#=1,X34#=1,X35#=1,X36#=1,X37#=1]),
    cardinal(3,7,[X41#=1,X42#=1,X43#=1,X44#=1,X45#=1,X46#=1,X47#=1]),
    X11+X21+X31+X41#=<2,
    X12+X22+X32+X42#=<2,
    X13+X23+X33+X43#=<2,
    X14+X24+X34+X44#=<2,
    X15+X25+X35+X45#=<2,
    X16+X26+X36+X46#=<2,
    X17+X27+X37+X47#=<2,
    labeling(S).
    
    