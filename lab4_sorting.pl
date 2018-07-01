/*lab4------------------------------------------------------*/
/*
sort/2

sort([2,4,1,2,5,0],L).
L = [0, 1, 2, 4, 5]. ucieło dwójkę!!! Ucina powtarzajace się elementy na liście
*/

/*usuwanie elementu*/
del(E, [E | T], T).				/*usuwamy element z głowy*/
del(E, [H | T], [H | T1]) :- 
	del(E, T, T1). 				/*E \= H*/ /*przypomina łączanie*/

/*
	del(2,[1,2,3,4],L).

	del(2,[2,3,4],[1|[]]) 	/*teraz wywołanie pierwszego dopasowania, bo element i głowa są takie same*/
	del(2,[3,4],[1|[3,4]]) 	/*nie gwarantuje usunięcia więcej niż jednego takiego elementu*/
	L=[1,3,4];				
*/
/*permutacja listy*/
perm([ ], [ ]).
perm(L, [H | T]) :- 
	del(H, L, L1),			
	perm(L1, T).
/*
perm2([],[]).
perm2([X|L],P) :-
	perm2(L,L1),
	wstaw(X,L1,P).
*/
/*Sprawdzenie czy lista jest posortowana*/
sorted([ ]).
sorted([ _ ]).
sorted([X, Y | T]) :- X =< Y, sorted([Y | T]).
/*
	wejście: 		[1,2,3]
	bierze: 		[1,2|[3]]
	warunek: 		1=<2
	przesyłamy: 	[2|[3]]
	bierze: 		[2,3|[]]
	warunek:		2=<3
	przesyłamy:		[3|[]]
	warunek:		[_]
	true
*/
/*slowsort*/
slowsort(L1, L2) :- 
	perm(L1, L2), 	/*poszukiewanie posortowanej permutacji*/
	sorted(L2).


slowsort(L1,L2) :-
	perm(L1,L2),
	sorted(L2).



/*sortowanie przez wstawianie*/
insert(E,[],[E]).
insert(E,[H|T],[H|T1]) :-		/*dodawaj do H i na końcu dodaj E w pierwszej klauzuli (po redukcji)*/
	E > H,
	insert(E,T,T1).
insert(E,[H|T],[E,H|T]) :-		/*dodaj E na początek listy*/
	E =< H.

insertSort([],[]).
insertSort([X],[X]).
insertSort([H|T],S) :-
	insertSort(T,T1),
	insert(H,T1,S).

/**/


/*min na liście*/
min([H],H,[]).			/*zwraca min - H oraz pozostałą część listy, czyli []*/
min([H|T],M,[H|T1]) :-	/*na począteku zjedżamy do pierwszej klauzli i ustalamy minimum*/
	min(T,M,T1),		
	H > M.
min([H|T],H,T) :-
	min(T,M,T1),
	H =< M.

















