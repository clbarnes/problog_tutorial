% parameter N -- note this is converted to binary ranges, e.g., every n between 5 and 8 inclusive samples from {0..7}
n(8).

loop1(G,N,R,T) :-
     G >= N,
     loop2(0,1,NG,NN,T,TT),
     loop1(NG,NN,R,TT).
     loop1(G,N,G,_) :-
     G < N.

loop2(G,N,NG,NN,T,TT) :-
     n(BN),
     N < BN,
     NN2 is 2*N,
     next(G,NG2,T), % carrying around the T(ime) for independent samples here
     NT is T+1,
     loop2(NG2,NN2,NG,NN,NT,TT).
loop2(G,N,G,N,T,T) :-
     n(BN),
     N >= BN.

0.5::next(G,G1,T) ; 0.5::next(G,G2,T) :- G1 is 2*G, G2 is 2*G+1.

uniform(X) :- n(N),loop1(N,N,X,0).

query(uniform(_)).