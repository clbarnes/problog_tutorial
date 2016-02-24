1/3::dice(1,D,ID); 1/3::dice(2,D,ID); 1/3::dice(3,D,ID) :- die(D).
die(X) :- between(1,3,X).

roll([1]).
roll([H,F|L]) :- roll([F|L]), dice(H,F,L).

seen(L) :- reverse(L,[],R), roll(R).

reverse([],L,L).
reverse([H|T],A,L) :-
  reverse(T,[H|A],L).

query(seen([_,_,_,_,_])).