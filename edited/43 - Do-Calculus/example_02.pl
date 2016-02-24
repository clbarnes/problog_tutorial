% source: David Poole. Abducing through negation as failure: stable models within the independent choice logic. JLP 2000.
% reformulated with annotated disjunctions

0.7::carrying(key,s(T)) :-
    do(pickup(key),T),
    at(robot,Pos,T),
    at(key,Pos,T).

carrying(key,s(T)) :-
    carrying(key,T),
    \+ do(putdown(key),T),
    \+ do(pickup(key),T),
    \+ drops(key,T).

0.6::drops(key,T) :-
    slippery(key,T).

0.2::drops(key,T) :-
    \+ slippery(key,T).

0.75::slippery(key,s(T)) :-
   slippery(key,T).
0.5::slippery(key,0).

0.9::at(robot,Pos,s(T)); 0.1::at(robot,Pos1,s(T)) :-
   do(goto(Pos),T),
   at(robot,Pos1,T).
at(robot,Pos,s(T)) :-
   \+ goto_action(T),
   at(robot,Pos,T).
at(key,Pos,T) :-
   carrying(key,T),
   at(robot,Pos,T).
at(key,Pos,s(T)) :-
   \+ carrying(key,s(T)),
   at(key,Pos,T).

goto_action(T) :-
   do(goto(Pos),T).

do(goto(loc1),0).
do(pickup(key),s(0)).
do(goto(loc2),s(0)).
at(key,loc1,0).
at(robot,loc0,0).

query(carrying(key,s(s(s(0))))).
query(at(_,_,s(s(s(0))))).