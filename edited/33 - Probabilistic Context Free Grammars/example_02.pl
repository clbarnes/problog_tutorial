% s is the starting non-terminal
state([],[s]).
% S -> 0.4 :: O M | 0.6 :: S S
0.4::state(W,[o,m|S]) ; 0.6::state(W,[s,s|S]) :- state(W,[s|S]).
% O -> a
state([a|W],S) :- state(W,[o|S]).
% M -> 0.7 :: b | 0.3 :: S C
0.7::state([b|W],S) ; 0.3::state(W,[s,c|S]) :- state(W,[m|S]).
% C -> b
state([b|W],S) :- state(W,[c|S]).

word(W) :- reverse(W,WR), state(WR,[]).

reverse(L,R) :- reverse(L,[],R).
reverse([],L,L).
reverse([H|T],A,R) :- reverse(T,[H|A],R).

query(word([_,_])).
query(word([_,_,_,_])).
query(word([_,_,_,_,_,_])).