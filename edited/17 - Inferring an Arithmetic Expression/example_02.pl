:- use_module(library(lists)).

0.7::leaf(T).
0.5::operator('+',T) ; 0.5::operator('-',T).

0.5::select_x(T).
l(x,T) :- select_x(T). % x=1
l(Value,T) :-
    \+select_x(T),
    findall(X, between(0,9,X), L),
    select_uniform(T, L, Value, _).

expr(A) :- expr(A,1,R).
expr(L,T1,T2) :- leaf(T1), T2 is T1+1, l(L,T1).
expr(S,T1,T2) :-
   \+ leaf(T1),
   Ta is T1+1,
   expr(E1,Ta,Tb),
   expr(E2,Tb,T2),
   operator(Operator,Ta),
   S =.. [Operator,E1,E2].

query(expr(A)).