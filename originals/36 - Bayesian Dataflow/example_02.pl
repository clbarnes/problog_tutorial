0.5::c1.
0.5::c2.
outcome(t,t) :- c1, c2.
outcome(t,f) :- c1, \+ c2.
outcome(f,t) :- \+ c1, c2.
outcome(f,f) :- \+ c1, \+ c2.
c1_or_c2 :- c1.
c1_or_c2 :- c2.

query(outcome(_,_)).
evidence(c1_or_c2).