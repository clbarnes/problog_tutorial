0.5::c1. 0.5::c2.

0.3::e1 :- c1.
0.2::\+e1 :- c2.

0.4::e2 :- c2.
0.2::\+e2 :- c1.

e :- e1.
e :- e2.

evidence(c1,true).
evidence(c2,true).

query(e).