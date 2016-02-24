% Decisions
?::marketed(P) :- person(P).

utility(buys(P), 5) :- person(P).
utility(marketed(P), -2) :- person(P).

% Probabilistic facts
0.2 :: buy_from_marketing(_).
0.3 :: buy_from_trust(_,_).

% Background knowledge
person(bernd).
person(ingo).
person(theo).
person(angelika).
person(guy).
person(martijn).
person(laura).
person(kurt).

trusts(X,Y) :- trusts_directed(X,Y).
trusts(X,Y) :- trusts_directed(Y,X).

trusts_directed(bernd,ingo).
trusts_directed(ingo,theo).
trusts_directed(theo,angelika).
trusts_directed(bernd,martijn).
trusts_directed(ingo,martijn).
trusts_directed(martijn,guy).
trusts_directed(guy,theo).
trusts_directed(guy,angelika).
trusts_directed(laura,ingo).
trusts_directed(laura,theo).
trusts_directed(laura,guy).
trusts_directed(laura,martijn).
trusts_directed(kurt,bernd).

buys(X) :-
     marketed(X),
     buy_from_marketing(X).
buys(X) :-
     trusts(X,Y),
     buy_from_trust(X,Y),
     buys(Y).