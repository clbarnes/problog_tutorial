t(_)::stress(X) :- person(X).
t(_)::influences(X,Y) :- person(X), person(Y).

smokes(X) :- stress(X).
smokes(X) :- friend(X,Y), influences(Y,X), smokes(Y).

person(1).
person(2).
person(3).
person(4).

friend(1,2).
friend(2,1).
friend(2,4).
friend(3,2).
friend(4,2).



evidence(smokes(2),false).
evidence(smokes(4),true).
evidence(influences(1,2),false).
evidence(influences(4,2),false).
evidence(influences(2,3),true).
evidence(stress(1),true).