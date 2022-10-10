


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

