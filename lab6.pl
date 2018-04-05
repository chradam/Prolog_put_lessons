/*
atomic - akceptuje napisy
functor(T,F,N). - w dowolnym termie pokazujesymbol fun i jego arnosc
[H|T] dwuargumentowy term. functor to kropka i (H|T) kropka oddziela czesci skladowe pary

arg(N,T,Arg) 

np.
arg(2,[1,2,3],Arg) wynik Arg=[2,3]
arg(1,g,Arg) wynik false g postrakotowane jako stała

T=..L
najpierw daje symbol funkcyjne
np.
[2,4]=..L.
wynik
L = ['.', 2, [4]].

(2<4)=..L.
L = [<, 2, 4].
wynik

 2=..L.
 wynik
 L=[2].

 T=..[<,4,3].
 wynik
 T = (4<3)
 
[3|[2]]=..L.
wynik
L = ['.', 3, [2]].

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

/*
sa(-(2+2)).
wynik
true.
*/	

sa(-(X)) :-
	sa(X).

/*
w(E,X) :-
	number(E).
w(X,X).
w(E1+E2,X) :-
	w(E1,X),
	w(E2,X).
w(E1-E2,X) :-
	w(E1,X),
	w(E2,X).
w(E1*E2,X) :-
	w(E1,X),
	w(E2,X).
w(E/N,X) :-
	w(E,X),
	number(N),
	N \= 0.

w(E^N,X) :-
	w(E,X),
	integer(N),
	N > 0.

*/
/*
1(00|01)*11(0|10)+1

*/
/*
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
*/
/*
działa
0(10|110)+1(01|001)*0

[0,1,0,1,0]
[0,1,0,1,0,1,0]

*/
ac([0 | T]) :-
	a1(T).
a1([1,0 | T]) :-
	a2(T).
a1([1,1,0 | T]) :-
	a2(T).
a2([1,0 | T]) :-
	a2(T).
a2([1,1,0 | T]) :-
	a2(T).
a2([1 | T]) :-
	a4(T).
a4([0,1 | T]) :-
	a4(T).
a4([0,0,1 | T]) :-
	a4(T).
a4([0]).
	
	
	
	
	
	
	
	
	
	








