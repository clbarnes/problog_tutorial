% use typing to restrict to finite set of queries
dom(X) :- between(0,5,X).

% program 1 (single infinite model)
% r(X,f(X)) :- r(Y,X) with f(X) = 2X with prob 1
% r(0,1)

% ProbLog style
r(0,1).
1.0::r(X,X2) :- r(_,X), X2 is 2*X, dom(X).

% closer to delta-notation in paper
s(0,1).
s(Y,DY) :- s(_,Y), delta(Y,DY).
1.0::delta(Y,DY) :- dom(Y), DY is 2*Y.

query(r(_,_)).
query(s(_,_)).