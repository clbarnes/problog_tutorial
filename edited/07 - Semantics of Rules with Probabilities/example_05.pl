0.7::red(X) :- ball(X).
ball(X) :- ball_in_game(X,_).

ball_in_game(a,g1).
ball_in_game(b,g2).
ball_in_game(b,g3).
ball_in_game(c,g4).
ball_in_game(c,g5).
ball_in_game(c,g6).

query(red(_)).

green(X) :- ball(X), \+ red(X).

query(green(_)).

different_color(A,B) :- ball(A), ball(B), A@=<B, red(A), green(B).
different_color(A,B) :- ball(A), ball(B), A@=<B, green(A), red(B).

query(different_color(_,_)).