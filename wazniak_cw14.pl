/*http://wazniak.mimuw.edu.pl/index.php?title=Paradygmaty_programowania/%C4%86wiczenia_14:_Programowanie_w_logice_w_Prologu_II*/
/*zad1*/
/*
p(X, Y) :- q(X, Y).
p(X, Y) :- q(X, Z), p(Z, Y).
q(a, b).
q(b, a).
*/

/*
	Jaki będzie rezultat po wpisaniu celu p(a, X)?
	odp.
	p(a,Y) :- q(a,Y).
	q(a, Y) Y=b | czyli X=b

	p(X, Y) :- q(X, Z), p(Z, Y).
	p(a,Y) :- q(a, Z), p(Z, Y).
	q(a,Z) -> Z=b | p(b,Y) | p(X,Y) -> X=b, q(b,Y) -> b, czyli X=b 
	ponowne wywołanie drugiego dopasowania
	odp.
	X=a, X=b w nieskończoność 
*/

/*zad2*/
/*
 pocz(X, Y) :- p(X, Y).
 pocz(X, X) :- s(X).
 p(X, Y) :- !, q(X), !, r(Y).
 p(X, Y) :- s(X), r(Y).
 q(a).
 q(b).
 r(c).
 r(d).
 s(e).
 sukces(_).
*/
 /*
	Jaki będzie rezultat po wpisaniu celu pocz(X, Y)? 
	p(X,Y)
		sukses(1),
			ok
		q(X),
			X=a
			X=b
		sukces(2),
			ok
		r(Y),
			Y=c,
			Y=d,
	p(X,Y)
		s(X),
			X=e
		r(Y),
			Y=c
			Y=d
	odp.
		X=a,
		Y=c;

		X=a,
		Y=d;

		X=b,
		Y=c;

		X=b,
		Y=d;

		X=e,
		Y=c;

		X=d,
		Y=d.
	

	Co się zmieni, gdy wywołanie sukces(1) zastąpimy odcięciem?
	Odcięcie powoduje, że nie zostanie wywołana kolejna kaluzyla z tym samym dopasowaniu
	p(X,Y)
		s(X),
			X=e
		r(Y),
			Y=c
			Y=d
	odp.
		X=a,
		Y=c;

		X=a,
		Y=d;

		X=b,
		Y=c;

		X=b,
		Y=d;

	Co, gdy zastąpimy sukces(2)?
	odp. niezależnie od tego czy zaostąpimy sukces(1) odcięciem czy nie.
		X=a,
		Y=c;

		X=a,
		Y=d;	

 */
 /*zad3*/
 /*
Napisać program łączący listy. 
Czy można go użyć do wytworzenia wszystkich par list, 
które po złączeniu dają wskazaną listę? Sprawdź.
 */
zlacz([],L,L).
zlacz([H|T1],L2,[H|T2]) :-
	zlacz(T1,L2,T2).

/*zad4*/
/*
Napisać program wyliczający ostatni element listy.
*/

ostatni([X],X).
ostatni([_|T],X) :-
	ostatni(T,X).

/*zad5*/
/*
Napisać program sprawdzający, czy jedna lista jest permutacją drugiej.
*/

perm([],[]).
perm([H|T],L2) :-
	perm(T,X), /*X jest permutacją taila*/
	wstaw(H,X,L2). /*wstawienie H do X, to jest to  permutacja listy [H|T]*/

wstaw(E,L,R) :-
	zlacz(L1,L2,L), /**/
	zlacz(L1,[E,L2],R). /*dodanie elementu E na początek listy jako głowę*/

/*zad6*/
/*
Napisać (jak najprostszy) program sortujący listę liczb całkowitych.
*/
uporzadkowana([]).
uporzadkowana([_]).
uporzadkowana([X,Y|Z]) :- 
	X =< Y, 
	uporzadkowana([Y|Z]).

slowsort(L1,L2) :-
	perm(L1,L2),
	uporzadkowana(L2).

/*zad7*/

/*zad8*/
