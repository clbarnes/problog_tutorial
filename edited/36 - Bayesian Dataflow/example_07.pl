0.5::bit(T,0); 0.5::bit(T,1).

% base case
step([X|_],T,X) :-
     bit(T,X).
% recursive case
step([H|Tail],T,V) :-
     bit(T,X),
     X \= H,
     TT is T+1,
     step(Tail,TT,V).

coin(L,V) :-
     step(L,1,V).

% 0.6 expanded is (1001)*
query(coin([1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1],_)).
query(coin([A,B,C,A,B,C,A,B,C],1)) :- between(0,1,A),between(0,1,B),between(0,1,C).