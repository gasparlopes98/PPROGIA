

:- lib(ic).
:- lib(ic_global).
:- lib(branch_and_bound).


investe(Ops, Lucro) :-
	Ops = [Op1, Op2, Op3, Op4, Op5, Op6, Op7],
	Ops :: 0..1,
	
	43*Op1 + 28*Op2 + 34*Op3 + 48*Op4 + 17*Op5 +  32*Op6 + 23* Op7 #=< 100,
	
	Op1 + Op2 #=< 1, 
	Op3 + Op4 #=< 1,
	
	Op3 #=< Op1 + Op2,
	Op4 #=< Op1 + Op2,
	
	% Op3 + Op4 #=<= Op1 + OP2,
	
	Lucro #= 17*Op1 + 10*Op2 + 15*Op3 + 19*Op4 + 7*Op5 +  13*Op6 + 9*Op7,
	Custo #= - Lucro,
	
	minimize(labeling(Ops), Custo).

