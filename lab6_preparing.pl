/*
6. Działania na termach
6.1 Rozpoznawanie termów: prostych wyrażeń arytmetycznych, wielomianów
6.2 Definiowanie automatów do rozpoznawania języków regularnych, których słowa są reprezentowane jako listy.
*/


/*
odcięcie, spowoduje, że wyświetli się tylko [], [a]. Dalej nawróty zostają przerwane. 
Zapoobiega to daleszemu wyświetlaniu typu [a,a,a], [a,a,a|...]
Innymi słowy odcina pozostałe ścieżki na jakie można spełnić cel X
*/
p([]). 
p([a|X]) :- 
   p(X),
   !.

 /*
przynalezność do zbioru (member)
 */

nalezy(X,[X|_]).
nalezy(X,[_|Y]) :-
	nalezy(X,Y).

 /*
zawieranie się zbiorów (subset)
pusty zbiór zawiera się w dowolnej liście
zbiór zawiera się w innym zbiorze, jeżeli:
	jego glowa nalezy do tego zbioru
	i każdy element z listy ogona też (realizowane przez rekurencję)
 */
podzbior([],Y).
podzbior([A|X],Y) :-
	nalezy(A,Y),
	podzbior(X,Y).



/*------------------------------------------------------------------------------*/
z4([4|_]).
	member(4,L).

/*
wzorzec a(bb|a)* ba

*/
ac(a|T) :-
	ac1(T). /**/
ac1([b,a]).
ac1(b,b|T) :-
	ac1(T).
ac1([a|T]) :-
	ac1(T).
