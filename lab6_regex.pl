/*
	6.1. Rozpoznawanie termów: prostych wyrażeń arytmetycznych, wielomianów.

	setof(T,G,L) L-lista wszytskich instancji termu T-Term, dla których zachodzi cel G-Goal

	np.
	setof(T,father(adam,T),Kids)
	Wynik: W Kids wszystkie dzieci Adama
	----------------------------------------------
	functor(T,F,N). - w dowolnym termie pokazujesymbol funktor i jego arnosc
	np.
	functor(2+2,+,N).
	N = 2.
	----------------------------------------------
	arg(N,T,Arg) - do Arg zapisane są elementy od 2 pozycji ze "zbioru"
	np.
	arg(2,[1,2,3],Arg).
	Arg=[2,3]

	arg(2,1+4*2,Arg).	//1   2	
	Arg = 4*2.			//1+(4*2) tak to zostało potraktowane 
	----------------------------------------------
	T=..L - najpierw wstawia na listę L funktor, a później pozostałe elementy
	[2,4]=..L.
	L = ['.', 2, [4]].
	
	(2<4)=..L.
	L = [<, 2, 4].

	2+2=..[H|T].
	H =  (+),
	T = [2, 2].
	---------------------------------------------
	czy jest to liczba calkowita
	simple arithmetic

	sa(X) :-
		integer(X).
*/

sa(X) :-
	integer(X).
sa(X+Y) :-
	sa(X),
	sa(Y).
sa(X-Y) :-
	sa(X),
	sa(Y).
sa(X*Y) :-
	sa(X),
	sa(Y).
sa(X/Y) :-
	sa(X),
	sa(Y).
sa(+(X)) :-
	sa(X).
sa(-(X)) :-
	sa(X).




/*
1(00|01)*11(0|10)+1
*/
ac([1 | T]) :-
	a1(T).
a1([0,0 | T]) :-
	a1(T).
a1([0,1 | T]) :-
	a1(T).
a1([1,1 | T]) :-
	a2(T).
	
a2([0 | T]) :-
	a3(T).
a2([1,0 | T]) :-
	a3(T).
a3([0 | T]) :-
	a3(T).
a3([1,0 |T]) :-
	a3(T).
a4([1]).


/*************************************************************************************/
/*
działa
0(10|110)+1(01|001)*0

[0,1,0,1,0]
[0,1,0,1,0,1,0]

*/

bc([0|T]) :-
	b1(T).

b1([1,0|T]) :-
	b2(T).
b1([1,1,0|T]) :-
	b2(T).
b2([1,0|T]) :-
	b2(T).
b2([1,1,0|T]) :-
	b2(T).

b2([1|T]) :-
	b3(T).

b3([0,1|T]) :-
	b3(T).
b3([0,0,1|T]) :-
	b3(T).
b3([0]).