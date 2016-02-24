person(a).
person(b).

0.1::initialInf(X) :- person(X).
0.1::inf(X) :- person(X).
0.1::contact(X,Y) :- person(X), person(Y).

inf(X)      :- initialInf(X).
0.6::inf(X) :- contact(X, Y), inf(Y).

query(inf(_)).