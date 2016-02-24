0.7::red(X); 0.3::green(X) :- ball(X).
0.5::type(X,football) ; 0.3::type(X,basketball); 0.2::type(X,baseball) :- ball(X).

ball(a).
ball(b).
ball(c).

query(red(_)).
query(green(_)).
query(type(_,_)).

different_color(A,B) :- ball(A), ball(B), A@=<B, red(A), green(B).
different_color(A,B) :- ball(A), ball(B), A@=<B, green(A), red(B).

query(different_color(_,_)).