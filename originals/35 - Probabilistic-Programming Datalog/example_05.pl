% use typing to restrict to finite set of queries
dom(X) :- between(0,5,X).

% program 2 (one finite, one infinite model)
% same as program 1, but start with (0,1) or (0,0)

% ProbLog style
0.5::r(0,0); 0.5::r(0,1).
1.0::r(X,X2) :- r(_,X), X2 is 2*X, dom(X).

% closer to delta-notation in paper
s(0,F) :- flip(0.5,F).
s(Y,DY) :- s(_,Y), delta(Y,DY).
1.0::delta(Y,DY) :- dom(Y), DY is 2*Y.
0.5::flip(0.5,0); 0.5::flip(0.5,1).

query(r(_,_)).
query(s(_,_)).