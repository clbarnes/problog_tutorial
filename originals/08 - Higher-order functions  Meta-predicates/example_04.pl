:- use_module(library(apply)).
:- use_module(library(lists)).

PH::make_coin(C,PH).
coin(C) :- make_coin(C,0.8).
cumsum(C, In, Out) :- (coin(C), Out is In+1; \+coin(C), Out=In).
total(S) :-
    findall(X, between(1,10,X), L),
    foldl(cumsum, L, 0, S).

query(total(_)).