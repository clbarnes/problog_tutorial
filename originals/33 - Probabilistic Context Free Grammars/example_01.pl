% s is the starting non-terminal
state([],[s]).
% s -> 0.3 :: a | 0.3 :: b | 0.4 :: s s
0.3::state([a|W],S) ; 0.3::state([b|W],S) ; 0.4::state(W,[s,s|S]) :- state(W,[s|S]).

word(W) :- reverse(W,WR),state(WR,[]).

reverse(L,R) :- reverse(L,[],R).
reverse([],L,L).
reverse([H|T],A,R) :- reverse(T,[H|A],R).

query(word([_])).
query(word([_,_])).
query(word([_,_,_])).