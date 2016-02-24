person(1).
person(2).
person(3).
person(4).

friend(1,2).
friend(2,1).
friend(2,4).
friend(3,4).
friend(4,2).

0.3::stress(X):- person(X).
0.2::influences(X,Y):-person(X), person(Y).

smokes(X) :- stress(X).
smokes(X) :- friend(X,Y), influences(Y,X), smokes(Y).

0.4::asthma(X) :- smokes(X).

query(asthma(_)).
query(smokes(_)).
query(stress(_)).
query(influences(_,_)).