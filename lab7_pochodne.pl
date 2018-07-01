


/*
	d((x+2),x,D).
*/
d(X,X,1) :- !.
d(E,X,0) :- 
	atomic(E), !.

d(A+B,X,DA+DB) :- !,
	d(A,X,DA),
	d(B,X,DB).





/*
/*Pochodna */
d(X, X, 1):-!.
d(E, X, 0):-
    atomic(E),
    !.


/*suma pochodnych*/
d(A+B, X, DA+DB):-
        d(A, X, DA),
        d(B,X,DB).


/*roznica*/
d(A-B, X, DA-DB):-
        d(A, X, DA),
        d(B,X,DB).


/*iloczyn*/
d(A*B,X,DA*B+A*DB) :- !,
	d(A,X,DA),
	d(B,X,DB).


/*iloraz*/
d(A/B,X,(DA*B-DB*A)/(B*B)) :- !,
	d(A,X,DA),
	d(B,X,DB).


/*log naturalny*/
d(ln(A), X, DA/A):-!,
    d(A,X,DA).


/*Pochodna tangensa*/
d(tan(A), X, DA/A ):-!,
    d(A,X,DA).


/*Sinus*/
d(sin(A),X,DA*cos(A)):-!,
    d(A,X,DA).


/*cosinus*/
d(cos(A),X, (-1)*DA*sin(A) ):- !,
        d(A,X,DA).


/*tangens*/
d(tg(A), X, DA/cos(A)*cos(A)):- !,
          d(A,X,DA).


/*cotangens*/
d(ctg(A), X, (-1)*DA/sin(A)*sin(A)):- !,
          d(A,X,DA).

/*upraszczanie*/
s(X, X) :-
	atomic(X), !.
s(X, Y) :-
	X =.. [Op, A, B],
  s(A, A1),
  s(B, B1),
  r(Op, A1, B1, Y).

/*r dla 4 */
r(+,X,0,X) :-!.
r(+,0,X,X) :-!.
r(-,X,X,0) :-!.
r(-,X,0,X) :-!.
r(*,_,0,0) :-!.
r(*,0,_,0) :-!.
r(*,X,1,X) :-!.
r(*,1,X,1) :-!.
r(Op, X, Y, Z) :-
	Z =.. [Op, X, Y].


s(X,Y):-
  X=..[Op,A],
  s(A, A1),
  r(Op, A1, Y).

/*r dla 3*/
r(e,0,1):-!.
r(ln,1,0):-!.
r(sin, 0,0):-!.
r(cos,0,1):-!.
r(tg,0,0):-!.
r(Op, A, Z):-
  Z=..[Op,A].
*/