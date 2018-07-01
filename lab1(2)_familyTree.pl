/*lab1----------------------------------------------------------------------------------*/
mezczyzna(adam).
mezczyzna(piotr).
mezczyzna(pawel).
mezczyzna(jan).
mezczyzna(tomasz).
mezczyzna(roman).

kobieta(ewa).
kobieta(ala).
kobieta(ola).
kobieta(marta).
kobieta(anna).
kobieta(iza).

/*wypisywanie mężczyzn po przecinku*/
m1:-
	mezczyzna(X),
	write(X),
	display(, ),
	fail.
m2.
/* jw. ale wynik w postaci listy */
m2:-
    setof(X, mezczyzna(X), L), /*L jest zbiorem wszystkich instancji termu X, dla których zachodzi cel mezczyzna(X)*/
    write(L).
 
rodzic(adam,ala).
rodzic(adam,piotr).
rodzic(adam,ola).
rodzic(adam,pawel).

rodzic(ewa,ala).
rodzic(ewa,piotr).
rodzic(ewa,ola).
rodzic(ewa,pawel).

rodzic(ola,roman).
rodzic(tomasz,roman).

rodzic(pawel,iza).
rodzic(anna,iza).

rodzic(jan,tomasz).
rodzic(jan,anna).

rodzic(marta,tomasz).
rodzic(marta,anna).

matka(X,Y) :-
	kobieta(X),
	rodzic(X,Y).

ojciec(X,Y) :-
	mezczyzna(X),
	rodzic(X,Y).

syn(X,Y) :-
	mezczyzna(X),
	rodzic(Y,X).

corka(X,Y) :-
	kobieta(X),
	rodzic(Y,X).

brat(X,Y) :-
	mezczyzna(X),
	rodzic(Z,X),
	rodzic(Z,Y),
	X \= Y.

siostra(X,Y) :-
	kobieta(X),
	rodzic(Z,X),
	rodzic(Z,Y),
	X \= Y.

rodzenstwo(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	X\=Y.

ciocia(C,O) :-
	kobieta(C),
	siostra(C,Z),
	rodzic(Z,O).

wujek(W,O) :-
	mezczyzna(W),
	brat(W,Z),
	rodzic(Z,O).

kuzyn(K,O) :-
	mezczyzna(K),
	syn(K,Z),
	rodzenstwo(Z,Y),
	rodzic(Y,O).

kuzyn2(K,O) :-
	mezczyzna(K),
	rodzic(R1,K),
	rodzic(R2,O),
	rodzenstwo(R1,R2).

kuzyn3(X,Y) :-
	syn(X,Z),
	rodzenstwo(Z,H),
	rodzic(H,Y).

kuzynka(K,O) :-
	kobieta(K),
	rodzic(R1,K),
	rodzic(R2,O),
	rodzenstwo(R1,R2).

babcia(B,O) :-
	kobieta(B),
	matka(B,R),
	rodzic(R,O).

dziadek(D,O) :-
	mezczyzna(D),
	ojciec(D,R),
	rodzic(R,O).

/*lab2----------------------------------------------------------------------------------*/

przodek(P,O) :-
	rodzic(P,O).
przodek(P,O) :-
	rodzic(P,R),
	przodek(R,O).

potomek(P,O) :-
	rodzic(O,P).
potomek(P,O) :-
	rodzic(R,P),
	potomek(R,O).