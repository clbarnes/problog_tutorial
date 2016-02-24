0.4::p5_id(N,N,ID);0.6::p5_id(N,M,ID) :- M is N+5.
lp5_id([],[]).
lp5_id([N|L],[M|K]) :-
    p5_id(N,M,L),
    lp5_id(L,K).

query(lp5_id([1,1],_)).
query(lp5_id([1,2],_)).