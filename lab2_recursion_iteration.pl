/*silnia*/
silnia(0,1).
silnia(N,X) :-
	N > 0,
	N1 is N - 1,
	silnia(N1,X1), /*wywołanie dla nowej zmiennej X1*/
	X is N * X1.
	
isilnia(N,X) :-
	isilnia(N,1,X).
isilnia(0,A,A). /*warunek kończący każde działanie - jeżeli N zejdzie do 0 następuje przepisanie A na X*/
isilnia(N,A,X) :-
	N > 0,
	A1 is A * N,
	N1 is N - 1,
	isilnia(N1,A1,X).

/*czy liczba jest naturalna*/
nat(0).
nat(N) :-
	N > 0,
	integer(N).

nat2(0).
nat2(N) :-
	N > 0,
	N1 is N - 1,
	nat2(N1).	

inat(N) :-
	inat(N,0).
inat(A,A).
inat(N,A) :-
	A < N,
	A1 is A + 1,
	inat(N,A1).

/*parzystość liczb dodatnich*/
parzysta(0).
parzysta(X) :-
	X > 0,
	X1 is X - 2,
	parzysta(X1).

iparzysta(N) :-
	iparzysta(N,0).
iparzysta(N,N).
iparzysta(N,A) :-
	A < N,
	A1 is A + 2,
	iparzysta(N,A1).

/*nieparzystość liczb dodatnich*/
nieparzysta(1).
nieparzysta(N) :-
	N > 2,
	N1 is N - 2,
	nieparzysta(N1).

inieparzysta(N) :-
	inieparzysta(N,1).
inieparzysta(A,A).
inieparzysta(N,A) :-
	A < N,
	A1 is A + 2,
	inieparzysta(N,A1).

/*podzielność przez 3*/
podz3(3).
podz3(N) :-
	N > 3,
	N1 is N - 3,
	podz3(N1).

/*podzielność przez 4*/
podz4(4).
podz4(N) :-
	N > 4,
	N1 is N - 4,
	podz4(N1).

/*----------------------------------*/
even(X) :- 0 is mod(X, 2). 
odd(X) :- 1 is mod(X, 2).
p3(X) :- 0 is mod(X,3).
/*----------------------------------*/

/*fibonacci*/
fib(0,1).
fib(1,1).
fib(N,F) :-
	N > 1,
	N1 is N - 1,
	fib(N1,F1),
	N2 is N - 2,
	fib(N2,F2),
	F is F1 + F2.

ifib(N,F) :-
	N > 1,
	ifib(N,1,1,F).
ifib(1,X,_,X).
ifib(N,A1,A2,F) :-
	N1 is N - 1,
	W1 is A1 + A2,
	W2 is A1,
	ifib(N1,W1,W2,F).

/*potęga*/

exp(X,0,1). /*X^0=1*/
exp(X,N,Y):-
	N>0,
	X>0,
	N1 is N - 1,
	exp(X,N1,Y1),
	Y is Y1 * X.
