0.7::in.
red(X) :- ball(X), in.

ball(a).
ball(b).
ball(c).

query(red(_)).

green(X) :- ball(X), \+ red(X).

query(green(_)).

different_color(A,B) :- ball(A), ball(B), A@=<B, red(A), green(B).
different_color(A,B) :- ball(A), ball(B), A@=<B, green(A), red(B).

query(different_color(_,_)).