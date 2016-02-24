% use typing to restrict to finite set of queries
dom(X) :- between(0,5,X).

% program 3 (all models infinite)
% as program 1, but splitting on 2X / 2X+1

% ProbLog style
r(0,1).
0.5::r(X,X2); 0.5::r(X,X3) :- r(_,X), X2 is 2*X, X3 is X2+1, dom(X).

% closer to delta-notation in paper
s(0,1).
s(Y,DY) :- s(_,Y), delta(Y,DY).
0.5::delta(Y,DY); 0.5::delta(Y,DY1) :- dom(Y), DY is 2*Y, DY1 is DY+1.

query(r(_,_)).
query(s(_,_)).