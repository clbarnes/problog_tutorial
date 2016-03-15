1/6::dice(1,D); 1/6::dice(2,D); 1/6::dice(3,D); 1/6::dice(4,D); 1/6::dice(5,D); 1/6::dice(6,D) :- die(D).

die(die_1).
die(die_2).
die(die_3).

outcome(A,B,C) :- dice(A,die_1), dice(B,die_2), dice(C,die_3).

increasing :- outcome(A,B,C), A<B, B<C.  % increasing is true if, given an outcome, the arithmetic conditions hold

sum(S) :- outcome(A,B,C), S is A+B+C.

query(sum(_)).
evidence(increasing).