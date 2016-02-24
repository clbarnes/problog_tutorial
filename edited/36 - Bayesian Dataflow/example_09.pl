% transition matrix
0.9::go(a,a,T); 0.05::go(a,b,T); 0.05::go(a,c,T).
0.7::go(b,a,T); 0.3::go(b,c,T).
0.8::go(c,a,T) ; 0.2::go(c,c,T).

% add initial distribution and define walk
1/3::in(a,0); 1/3::in(b,0); 1/3::in(c,0).
in(X,T) :- T > 0, TT is T-1, in(Y,TT), go(Y,X,TT).

query(in(_,3)).
evidence(in(a,5),false).