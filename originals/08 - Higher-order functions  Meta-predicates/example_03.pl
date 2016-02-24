:- use_module(library(apply)).
:- use_module(library(lists)).

PH::make_coin(C,PH).
coin(C) :- make_coin(C,0.8).
tonum(C, Num) :- (coin(C), Num=1; \+coin(C), Num=0).
total(S) :-
    findall(X, between(1,10,X), L),
    maplist(tonum, L, Nums),
    sum_list(Nums, S).

query(total(_)).