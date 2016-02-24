q1 :- stress(X), influences(X,Y).
q2 :- stress(X), influences(X,Y), male(Y).

0.7::stress(1).
0.4::stress(2).
0.9::stress(3).

0.83::influences(1,2).
0.41::influences(1,3).
0.56::influences(2,1).
0.91::influences(2,3).
0.34::influences(3,1).
0.17::influences(3,2).

0.3::male(1).
0.8::male(2).
0.9::male(3).

query(q1).
query(q2).