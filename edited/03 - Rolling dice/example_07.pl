1/3::dice(1,D); 1/3::dice(2,D); 1/3::dice(3,D) :- die(D).
die(X) :- between(1,3,X).

roll(L) :-
   next(1,[1],L).

next(N,Seen,Rev) :-
   dice(Now,N),
   member(Now,Seen),
   reverse(Seen,[],Rev).
next(N,Seen,List) :-
   dice(Now,N),
   \+ member(Now,Seen),
   next(Now,[Now|Seen],List).

member(X,[X|_]).
member(X,[_|Z]) :-
   member(X,Z).

reverse([],L,L).
reverse([H|T],A,L) :-
   reverse(T,[H|A],L).

query(roll(_)).