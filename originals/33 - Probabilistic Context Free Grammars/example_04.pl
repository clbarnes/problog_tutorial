% S -> 0.4 :: O M | 0.6 :: S S
0.4::s_to(N,om); 0.6::s_to(N,ss).
s(L,s(N,NN),m(M,MM)) :-
     s_to(N,om),
     NI is N+1,
     split(L,L1,L2),
     o(L1,s(NI,NS),m(M,MS)),
     m(L2,s(NS,NN),m(MS,MM)).
s(L,s(N,NN),m(M,MM)) :-
     s_to(N,ss),
     NI is N+1,
     split(L,L1,L2),
     s(L1,s(NI,NS),m(M,MS)),
     s(L2,s(NS,NN),m(MS,MM)).

% O -> a
o([a],s(N,N),m(M,M)).

% M -> 0.7 :: b | 0.3 :: S C
0.7::m_to(N,b); 0.3::m_to(N,sc).
m([b],s(N,N),m(M,MM)) :- m_to(M,b),MM is M+1.
m(L,s(N,NN),m(M,MM)) :-
     m_to(M,sc),
     MI is M+1,
     split(L,L1,L2),
     s(L1,s(N,NS),m(MI,MS)),
     c(L2,s(NS,NN),m(MS,MM)).

% C -> b
c([b],s(N,N),m(M,M)).

% s is the starting symbol, and we start with the counters for both s and m 0
word(L) :- s(L,s(0,_),m(0,_)).

% split(+T,-P,-S) splits the list T into two non-empty sublists P(refix) and S(uffix)
% note that T needs to have fixed length for this to terminate
split([A,B|C],[A],[B|C]).
split([A,B|C],[A|D],E) :-
     split([B|C],D,E).

% we need to fix the length of the list to ensure split/3 has a finite number of solutions
query(word([_,_])).
query(word([_,_,_,_])).
query(word([_,_,_,_,_,_])).