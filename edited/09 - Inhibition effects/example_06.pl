person(a).
person(b).

0.1::initialInf(X) :- person(X).
0.1::inf(X) :- person(X).
0.1::contact(X,Y) :- person(X), person(Y).
0.1::riskyTravel(X) :- person(X).
0.1::susceptible(X) :- person(X).

inf(X)      :- initialInf(X).
0.6::inf(X) :- contact(X, Y), inf(Y), \+susceptible(X).
0.8::inf(X) :- contact(X, Y), inf(Y),   susceptible(X).
0.2::inf(X) :- riskyTravel(X).

query(inf(_)).