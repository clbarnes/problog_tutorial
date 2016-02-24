0.5::c1. 0.5::c2.

0.3::e :- c1.
0.4::e :- c2.

evidence(c1,true).
evidence(c2,true).

query(e).