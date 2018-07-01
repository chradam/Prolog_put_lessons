/*
When I wrote this, only God and I undrestood what I was doing.
Now, God only knows.
*/

/*lab3------------------------------------------------------*/
/*member - przynależność elementu do listy*/
nalezy(E,[E|T]). 		/*należy kiedy jest jej głową*/
nalezy(E,[H|E1]) :-  	/*lub należy do ogona listy (tu następuje odwołanie do pierwszego warunku, bo T to też lista)*/
	nalezy(E,E1). 		/*wywołanie rekurencyjne*/

/*append*/
polacz([],L,[L]).
polacz([H|T],L,[H|T1]) :-	 /*listy muszą mieć tę samą głowę*/
		polacz(T,L,T1). 	 /*ogony z listy 1 i 2 łączymy w T1 i podajwmy w wyniku*/
							 /*najpierw następuje redukcja do postaci ([],L,Result)*/
							 /*dodanie w międzyczasie głowy, która ulegała zmianie w procesie rekurencji*/
							 /*później przepisanie ([],L,L)*/

/*zapytania*/
/*
nalezy(1,[1,2]).
false
nalezy(X,[1,2]).
X=1,X=2;
nalezy(1,L). dużo możliwości

polacz([1],[],[1,2]).
false.
polacz([1],[2],L).
L = [1, 2].
polacz(X,[1,2],L).

polacz(X,Y,[1,2]).
X = [],
Y = [1, 2] ;
X = [1],
Y = [2] ;
X = [1, 2],
Y = [] ;

reverse([1,2,3],L).
*/

/*dołączanie na początek listy*/

addFirst([],E,[E]).
addFirst([H|T],E,[E,H|T]) :- /*na początek przypisanie wartości E na wynik*/
	addFirst(T,E,T1).		 /*później dopisanie */

/*dodanie na koniec listy*/

addLast([],E,[E]).
addLast([H|T],E,[H|T1]) :-
	addLast(T,E,T1).

/*
addFirst([1,2],3,L).
L = [3, 1, 2].

addLast([1|[2,4]],3,L).
L = [1, 2, 4|3].
*/

/*długość listy*/
dl([],0).
dl([H|T],Length) :-
	dl(T,N),			/*najpierw wywołanie z nową zmienną, gdy dokonamy pierwszej redukcji*/
	Length is N + 1.	/*zapis do zmiennej wynikowej*/


idl(List,N) :-
	idl(List,0,N).		/*Akumulator od zera*/
idl([],A,A). 			/*przepisanie*/
idl([H|T],A,N) :-
	A1 is A + 1,
	idl(T,A1,N).


/*odwróć elementy na liście - reverse*/
od([],[]).
od([H|T],L) :- 			/*odwrócenie to */
	od(T,T1),			/*T1 to zmienna pomocnicza, przyjmuje wartość listy []*/
	polacz(T1,[H],L).	/*np. dochodzimy do polacz([],[3,2,1],L). L=[3,2,1]*/
						/*[H] rzutowanie na H czyni z niej listę odwróconą*/

iod(L1,L2) :-
	iod(L1,[],L2).		
iod([],A,A).
iod([H|T],A,L2) :-		/*[1,2,3]*/
	iod(T,[H|A],L2).	/*[1|A] , [2|1], [3|[2,1]] = [3,2,1]*/



/*odwróć zagnieżdżone------------------------------------------------------*/

/*zlicza liczby mniejsze od 4 na zadanej liście*/
sumMin4([],0).
sumMin4([H|T], N) :-
	H < 4,
	sumMin4(T,N1),
	N is N1 + 1.		/*zapis po wywołaniu. Tu nie było do czego dodać, N nieznane?*/
sumMin4([H|T], N) :-
	H >=4,
	sumMin4(T,N).


isumMin4(L1,N) :-
	isumMin4(L1,0,N).
isumMin4([],A,A).
isumMin4([H|T],A,N) :-
	H < 4,
	A1 is A + 1,		/*zapis do nowej zmiennej przed wywołaniem. A tu A miało war 0 na początku?*/
	isumMin4(T,A1,N).
isumMin4([H|T],A,N) :-
	H >= 4,
	isumMin4(T,A,N).

/*zapisz na listę liczby < 4 z zadanej listy*/
min4([],[]).
min4([H|T],[H|T1]) :-
	H < 4,
	min4(T,T1).
min4([H|T], T1) :- 		/*"pętla, która zapewnia lekceważenie el >=4"*/
	H >= 4,
	min4(T,T1).


imin4(L1,L2) :-
	imin4(L1,[],L2).
imin4([],A,A).
imin4([H|T],A,L2) :-
	H < 4,
	imin4(T,[H|A],L2).
imin4([H|T],A,L2) :-
	H >= 4,
	imin4(T,[T1|A],L2).


/*zamień wszystkie -1 z listy na 0*/
u2m1([],[]).
u2m1([H|T],[H1|T1]) :-
	H == -1,
	H1 is 0,
	u2m1(T,T1).
u2m1([H|T],[H|T1]) :-
	H > -1,
	u2m1(T,T1).
u2m1([H|T],[H|T1]) :- /*3 warunki*/
	H < -1,
	u2m1(T,T1).

/* Zamien wszystkie ujemne na 0 rekurencyjnie*/
u20([],[]).
u20([H|T],[H1|T1]) :-
	H < 0,
	H1 is 0,
	u20(T,T1).
u20([H|T],[H|T1]) :-
	H >= 0,
	u20(T,T1).


iu20(L1,L2) :-
	iu20(L1,[],L2).

iu20([],A,A).
iu20([H|T],A,L2) :-
	H < 0,
	append(A,[0],A1),
	iu20(T,A1,L2).
iu20([H|T],A,L2) :-
	H >= 0,
	append(A,[H],A1),
	iu20(T,A1,L2).

