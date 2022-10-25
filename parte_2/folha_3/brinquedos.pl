

:- lib(ic).
:- lib(branch_and_bound).


solve(Fabricas, Brinquedos, Horas, Lucro) :-
	Fabricas = [FA, FB],
	Brinquedos = [B1, B2],
	Horas = [HorasA1, HorasA2, HorasB1, HorasB2],
		
	Fabricas   :: 0..1,
	Brinquedos :: 0..1000000,
	Horas      :: 0..700,

	FA + FB #= 1, % só usar uma fabrica
	
	HorasA1 + HorasA2 #=< 500,
	HorasB1 + HorasB2 #=< 700,
	
	FA #= (HorasA1 + HorasA2 #> 0),
	FB #= (HorasB1 + HorasB2 #> 0),

	B1 #= 50 * HorasA1 * FA + 40 * HorasB1 * FB,
	B2 #= 40 * HorasA2 * FA + 25 * HorasB2 * FB,

	Vars = [HorasA1, HorasA2, HorasB1, HorasB2, FA, FB, B1, B2],
	
	Lucro #= 10 * B1 - 50000 + 15 * B2  - 80000,
	
	Custo #= -Lucro,
	
	minimize(search(Vars, 0, first_fail, indomain,  complete, []), Custo).
	
