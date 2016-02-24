% parameter n (number of bits)
n(3).
% bits of a
0.5::a(I,1); 0.5::a(I,0) :- n(N), between(1,N,I).
% bits of b
0.5::b(I,1); 0.5::b(I,0) :- n(N), between(1,N,I).

% start comparing at bit 1
compare(Res) :-
     compare(1,Res).
% base cases
compare(I,equal) :-
     n(I), a(I,A), b(I,A).
compare(I,smaller) :-
     n(N), I =< N, a(I,A), b(I,B), A < B.
compare(I,larger) :-
     n(N), I =< N, a(I,A), b(I,B), A > B.
% recursive case
compare(I,Res) :-
     n(N), I < N, a(I,A), b(I,A), II is I+1, compare(II,Res).

query(a(_,1)).
query(b(_,1)).
evidence(compare(smaller)).