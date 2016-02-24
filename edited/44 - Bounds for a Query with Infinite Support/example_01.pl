% Sato's spaghetti example (ICLP 2015)
% round table with persons p0 to pN
% initially, plate of spaghetti is in front of person p0
% if person gets plate for first time, and everyone else has had it already, that person gets to eat the spaghetti
% in every other case, the person with the plate randomly passes it to the left or right neighbor
%
% what is the probability that a specific person X gets to eat them?
%
% this is an example of infinite support, where we need to set a finite limit
%

% at time 0, person p0 has the dish, and all others haven't seen it yet
at(0,p0,L) :- findall(X,(right(X,_),X\=p0),L).

% at time >0, if not everyone has seen the dish yet, pass it on randomly and update seing list accordingly
0.5::at(TT,R,RR); 0.5::at(TT,Le,LR) :-
                         TT>0,T is TT-1,
                         at(T,P,L),
                         L\=[],
                         right(P,R),
                         left(P,Le),
                         setmin(L,R,RR),
                         setmin(L,Le,LR).

% 4 persons
right(p0,p1).
right(p1,p2).
right(p2,p3).
right(p3,p0).

left(A,B) :- right(B,A).

setmin([],_,[]).
setmin([A|X],A,X).
setmin([A|X],B,[A|Y]) :-
   A\=B,
   setmin(X,B,Y).

% P gets to eat the spaghetti at time T
person_eats_at(P,T) :- at(T,P,[]).
% P got to eat the spaghetti at time T or before
% for increasing T, this approximates the real query of interest, which would be
% person_eats(P) :- person_eats_at(P,_).
% but cannot be computed as there are infinitely many points in time where the person could eat
person_eats_until(P,T) :- between(0,T,S), person_eats_at(P,S).
% someone got to eat the spaghetti at time T or before
someone_eats_until(T) :- between(0,T,S), person_eats_at(_,S).
% the plate is still being passed around at T
% this is the probability mass left to distribute at that point in time
still_passing(T) :- \+ someone_eats_until(T).
% so a very optimistic upper bound on P getting the spaghetti is
person_eats_until_or_may_eat_in_future(P,T) :- person_eats_until(P,T).
person_eats_until_or_may_eat_in_future(P,T) :- right(P,_),still_passing(T).

% queries need to supply the time to ensure finite support
time(5).
%query(person_eats_at(_,T)) :- time(T).
query(person_eats_until(_,T)) :- time(T).
%query(someone_eats_until(T)) :- time(T).
%query(still_passing(T)) :- time(T).
query(person_eats_until_or_may_eat_in_future(_,T)) :- time(T).