% s -> 0.3 :: a | 0.3 :: b | 0.4 :: s s
0.3::s_to(N,a); 0.3::s_to(N,b); 0.4::s_to(N,ss).
s([a],s(N,NN)) :-
     s_to(N,a), NN is N+1.
s([b],s(N,NN)) :-
     s_to(N,b), NN is N+1.
s(L,s(N,NN)) :-
     s_to(N,ss),
     NI is N+1,
     split(L,L1,L2),
     s(L1,s(NI,NS)),
     s(L2,s(NS,NN)).

% s is the starting symbol, and we start with the counter for s being 0
word(L) :- s(L,s(0,_)).

% split(+T,-P,-S) splits the list T into two non-empty sublists P(refix) and S(uffix)
% note that T needs to have fixed length for this to terminate
split([A,B|C],[A],[B|C]).
split([A,B|C],[A|D],E) :-
     split([B|C],D,E).

% we need to fix the length of the list to ensure split/3 has a finite number of solutions
query(word([_])).
query(word([_,_])).
query(word([_,_,_])).