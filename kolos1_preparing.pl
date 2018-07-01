/*zad1*/
/*
test :- p(X,Y), s(Y), r(X), write(X), nl, fail.
test.

p(3,4).
p(4,9).
p(8,7).
r(X) :- s(X),t(X).
s(8).
s(7) :- !.
s(4).
t(9).
t(8).
t(5) :- !.
t(4).
*/
/*
odp.
8 -> dlatego, że jest fail na końcu, więc nie ma nawrotu. tu
true. -> dlatego, że następuje dopasowanie z test.
-----
bez "test." i z "fail.":
8
false

*/


/*
test
p(X,Y), s(Y), r(X), write(X), nl, fail.
X=8, Y=7 ->ostatnie dopasowanie
s(7),r(8),write(8),nl,fail.
s(7)->true
r(8)->s(8)->true,t(8)->true 

dlatego
bez "test." i bez "fail.":
8
true
*/
/*
/*------------------------------------------------------------------------------*/
p(X) :- q(X),r(X).
p(2).
q(X) :- s(X),t(X).
q(0).
r(5).
s(2).
s(5).
t(5).
*/
/*
odp.
X=5;
X=2
*/
/*zad2------------------------------------------------------------------------------*/

test :- p(X,Y), r(Y), s(X), write(X), nl, fail.
test.

p(3,4).
p(4,9).
p(7,8).
r(X) :- t(X),s(X).
s(7).
s(6) :- !.
s(8).
t(9).
t(8) :- !.
t(5). 
t(4).


/*
p(X,Y), r(Y), s(X), write(X), nl, fail.
X=3,Y=4
r(4), s(4), write(4), nl, fail.
r(4) :- t(4)->true,s(4)->false.

odp.
7
true
*/


/*zad3------------------------------------------------------------------------------*/
/*
test :- p(X,Y), r(Y), s(X), write(X), nl, fail.
test.
p(6,4).
p(4,5).
p(2,8).
r(X) :- t(X), s(X).
s(5).
s(6) :- !.
s(4).
t(9).
t(8) :- !.
t(5).
t(4).
*/
/*
X=6,Y=4
r(4), s(6), write(6), nl, fail.
X=4,Y=5
r(4),s(5),write(4),nl,fail.
X=2,Y=8
r(2),s(2) -> false,write(4),nl,fail.

odp.
6
4
false
*/

/*zad4-------------------------------------------------------------------------------*/
/*
harder
otoczenie3(+Lista1,+A,-Litsta2)
wykorzystaj append/3

otoczenie3([-1,2,0,-3,4,5],-3,L).
L = [2, 0, -3, 4, 5] ;

append([1],[2,3],X)
X=[1,2,3]

*/

otoczenie3(L0,E,L) :-
	append(L1,[E|L2],L0),	/*lista L1 zawiera elemeny przed E a lista L2 po E z listy L0*/
	ostanie(L1,L11),		/*ostanie max. 2 z piwerszej listy*/
	pierwsze(L2,L22),		/*pierwsze max. 2 z drugiej listy*/
	append(L11,[E],L01),	/*złącz L11 z E w listę L01*/
	append(L01,L22,L).		/*złącz L01 z L22 w listę L*/

ostanie([Y,Z],[Y,Z]) :- !.	/*zapisuje na listę ostanie max. dwa elementy*/
ostanie([Z],[Z]) :- !.		/*konieczne są ! by zakończyć na pewnym jednym max*/
ostanie([],[]) :- !.
ostanie([H|T],L11) :-
	ostanie(T,L11).

pierwsze([A,B|_],[A,B]) :- !.	/*zapisuje na listę pierwsze max. dwa elementy*/
pierwsze([A],[A]) :- !.			/*nie ma rekurencji, bo liczą się */
pierwsze([],[]) :- !.



/*zad5-------------------------------------------------------------------------------*/
/*
easy
	otoczenie(+Lista,+A,-A1,-A2). z append

	A1 i A2 to sąsiedzi Elementu A

	np.
	otoczenie([-1, 2, 0, -3, 4, 5], -3, X, Y).
	X=0		Y=4

*/
otoczenie(L0,E,E1,E2) :-
	append(L1,[E|L2],L0),
	lewy(L1, E1),
	prawy(L2, E2).
	
	lewy([X],X).
	lewy([H|T],A11) :-	/*ostani z listy*/
		lewy(T,A11).

	prawy([H|T],H).		/*pierwszy z listy*/

/*zad6-------------------------------------------------------------------------------*/
/*
	takie samo działanie jak powyżej
	otoczenie(+Lista,+A,-A1,-A2). bez append
*/

otoczenieV2([A1,A,A2|_],A,A1,A2).
otoczenieV2([H|T],A,A1,A2) :-
	otoczenieV2(T,A,A1,A2).

/*zad7-------------------------------------------------------------------------------*/
/*
	przenieś najmniejszy element z listy na koniec
	np.
	[1,-2,4,5,86] -> [1,4,5,86,-2]
	z append, select i min_list - wbudowane
*/
minEnd(L1,L2) :-
	min_list(L1,M),
	select(M,L1,L11),
	append(L11,[M],L2).


/*zad8-------------------------------------------------------------------------------*/
/*
	to samo co powyżej, ale tylko z append
*/
min([H],H).
min([H|T], M) :-
	min(T,M1),
	M1 < H,
	M is M1.
min([H|T],M) :-
	min(T,M1),
	M1 > H,
	M is H.

mnk([],[]).
mnk(L1, L2) :-
	min(L1,M),
	mnk(M,L1,L2).
mnk(M,[H|T],L2):-
	H==M,				/*pozbywamy się min, jeżeli wystąpiło na początku, bedzie też służyc jako odwołannia dla następnej klauzuli*/
	append(T,[M],L2).
mnk(M,[H|T],[H|T1]) :-
	H\=M,
	mnk(M,T,T1).		

/*zad9-------------------------------------------------------------------------------*/
/*
	ekstremum z listy
*/
extremum([M],M) :- !.
extremum([H|T],M) :-
	extremum(T,M1),
	M1 > H, !,
	M is M1.
extremum([H|T],M) :-
	extremum(T,M1),
	M1 =< H,
	M is H.

/*max wartość i lista pozostałych elementów*/
ekstr([M],M,[]).
ekstr([H|T],M,[H|T1]) :-
	ekstr(T,M,T1),
	H < M, !.
ekstr([H|T],H,T) :-		/*jeżeli nie chcemy dopisywać do listy wynikowej war max to nie dodajemy H*/
	ekstr(T,M,T1),
	H >= M.

/*zad10-------------------------------------------------------------------------------*/
/*
	[1,2,-3,4,5,-10] => [-3,-10,1,2,4,5].(ujemne na początek)

*/
ujemneFirst([],[]).
ujemneFirst([H|T],[H|T1]) :-
	H < 0,
	ujemneFirst(T,T1).

ujemneFirst([H|T],[T1|H]) :-
	H >= 0,
	ujemneFirst(T,T1).

ujemneFirst2(L1,L2) :-
	znak(L1,L11,L22),
	append(L11,L22,L2).

	znak([],[],[]).
	znak([H|T],[H|T1],L22) :-
		H < 0,
		znak(T,T1,L22).

	znak([H|T],L11,[T1|H]) :-
		H >= 0,
		znak(T,L11,T1).

/*zad11-------------------------------------------------------------------------------*/
/*nie działa dla nieparzystch*/

dl([],0).
dl([H|T],Length) :-
	dl(T,N),
	Length is N + 1.

rowny([],[],[]).
rowny([X],[],[]).
rowny(L1,L2,L3) :-
	dl(L1,Dl),
	Dl mod 2 =:= 0,
	append(L2,L3,L1),
	dl(L2,X1),
	dl(L3,X2),
	X1 == X2.

rowny(L1,L2,L3) :-
	dl(L1,Dl),
	Dl mod 2 =:= 1,
	append(L2,[_|L3],L),
	dl(L2,X1),
	dl(L3,X2),
	X1 == X2.


/*zad12-------------------------------------------------------------------------------*/
/*
	wskazać środek listy
*/
middle([X],X).
middle([X,Y],[X,Y]).
middle([_|T],Answer) :-
	append(Inner,[_],T),	
	middle(Inner,Answer).

/*
wejście:	[1,2,3,5,6]
append:		Inner=[2,3,5], [_]->bierze osatnie element, T=[2,3,5,6]
wyjście:	3 -> dopasowanie do pierwszej klauzuli
*/


/*zad13-------------------------------------------------------------------------------*/
/*
	usuń powtarzajace się elementy na liście
*/


/*zad14-------------------------------------------------------------------------------*/
/*
	kolejne pary elementów z listy 
*/

/*zad15-------------------------------------------------------------------------------*/



/*ZADANIA PREDYKATY*/

/*zad16-------------------------------------------------------------------------------*/
/*
	wykorzystaj predykat =..(Term,List)
	do zdefiniowania my_arg(N,Term,Arg)
	np.
	my_arg(3,f(2+4,X,Y+7),Arg).
	Wynik: Arg=Y+7
*/

my_arg(N,Term,Arg) :-
	Term=..[H|T],
	wyznacz(N,T,Arg). 	/*przekazanie tylko taila*/

wyznacz(1,[H|T],H).
wyznacz(N,[H|T],Arg) :-
	N1 is N - 1,
	wyznacz(N1,T,Arg). 


/*zad17-------------------------------------------------------------------------------*/
/*
	wykorzystaj predykat =../2
	do zdefiniowania my_functor(Term,Functor,N).
	np.
	my_functor(2*(coś+7),F,N)
	wynik: F=* N=2
*/

my_functor(Term,F,N) :-
	Term=..[F|T],
	arnosc(T,N).		/*czyli liczba elementów w ogonie*/

arnosc([],0).
arnosc([_|T],Length) :-
	arnosc(T,N1),
	Length is N1 + 1.


my_functor2(Term,F,N) :-
	Term=..[F|T],
	length(T,N).		/*wbudowane length*/



