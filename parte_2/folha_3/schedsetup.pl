
:- lib(ic).
:- lib(branch_and_bound).

% solucao --> 1 <--
solve1(Tarefas, Setups, Duracao) :-
	Tarefas = [T1,   T2,   T3,   T4,   T5  ],
	Setups  = [Set1, Set2, Set3, Set4, Set5],
	
	Tarefas :: 1..5,
	
	alldifferent(Tarefas),
	
	Matriz  = [
				[ 0,  6, 10,  7, 12],
				[ 7,  0, 11,  8,  9],
				[12, 10,  0, 15,  8],
				[10, 14, 12,  0, 16],
				[ 9, 11, 10,  7,  0]
	         ],
			 
	% transforma matriz num vetor		 
	flatten(Matriz, Lista),
	
	element(T1, [ 4,  5,  8,  9,  4], Set1),  % Nenhuma tarefa precede T1
	
	% calcula indice do vetor em funcao dos indices da matriz
	T21 #= T1 + 5*T2 - 5,
	T32 #= T2 + 5*T3 - 5,
	T43 #= T3 + 5*T4 - 5,
	T53 #= T4 + 5*T5 - 5,
	
	% acede ao correspondente tempo de setup
	element(T21, Lista, Set2),
	element(T32, Lista, Set3),
	element(T43, Lista, Set4),
	element(T53, Lista, Set5),
			 
	Duracao #= 202 + Set1 + Set2 + Set3 + Set4 + Set5,
	
	minimize(search(Tarefas, 0, first_fail, indomain_max,  complete, []), Duracao).
	
	
% solucao --> 2 <--
solve2([T1, T2, T3, T4, T5], Duracao) :-
	
	T1 = [T10, T11, T12, T13, T14, T15],
	T2 = [T20, T21, T22, T23, T24, T25],
	T3 = [T30, T31, T32, T33, T34, T35],
	T4 = [T40, T41, T42, T43, T44, T45],
	T5 = [T50, T51, T52, T53, T54, T55],
	
	[T1, T2, T3, T4, T5] :: 0..1,
	
	
	T10       + T12 + T13 + T14 + T15 #= 1,
	T20 + T21       + T23 + T24 + T25 #= 1,
	T30 + T31 + T32       + T34 + T35 #= 1,
	T40 + T41 + T42 + T43       + T45 #= 1,
	T50 + T51 + T52 + T53 + T54       #= 1,
	
	
	T10 + T20 + T30 + T40 + T50 #= 1,
	(    + T21 + T31 + T41 + T51 #= 1) #= B1,
	(T12       + T32 + T42 + T52 #= 1) #= B2,
	(T13 + T23       + T43 + T53 #= 1) #= B3,
	(T14 + T24 + T34       + T54 #= 1) #= B4,
	(T15 + T25 + T35 + T45       #= 1) #= B5,
	
	B1 + B2 + B3 + B4 + B5 #= 4,
	
	
	T11 #= 0,
	T22 #= 0,
	T33 #= 0,
	T44 #= 0,
	T55 #= 0,
	
	Duracao #= 202 +  4*T10 + 5*T20  +  8*T30 +  9*T40 +  4*T50 +
	                          7*T21  + 12*T31 + 10*T41 +  9*T51 +
					  6*T12          + 10*T32 + 14*T42 + 11*T52 +
					 10*T13 + 11*T23          + 12*T43 + 10*T53 +
					  7*T14 +  8*T24 + 15*T34          +  7*T54 +
					 12*T15 +  9*T25 +  8*T35 + 16*T45,
					 
	flatten([T1, T2, T3, T4, T5], Vars),
	
	minimize(search(Vars, 0, first_fail, indomain_max,  complete, []), Duracao).
	
