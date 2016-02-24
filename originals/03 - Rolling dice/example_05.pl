1/6::dice(1,D); 1/6::dice(2,D); 1/6::dice(3,D); 1/6::dice(4,D); 1/6::dice(5,D); 1/6::dice(6,D) :- die(D).

die(1).
die(2).
die(3).

outcome(A,B,C) :- dice(A,1), dice(B,2), dice(C,3).

increasing :- outcome(A,B,C), A<B, B<C.

sum(S) :- outcome(A,B,C), S is A+B+C.

query(sum(_)).
evidence(increasing).