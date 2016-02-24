% import uniform distributions
:- use_module(library(lists)).

%% basic distributions: players a and b both choose a number between 0 and 9
a(X) :-
     select_uniform(a,[0,1,2,3,4,5,6,7,8,9],X,_).
b(X) :-
     select_uniform(b,[0,1,2,3,4,5,6,7,8,9],X,_).

%% running the outer program assigns values to A and B
state(A,B) :-
     a(A),
     subquery(b(B),P,[inner(A)]),  % compute the distribution of the inner rejection query...
     pr(A,B,P).       % ... and draw the value from it
P::pr(A,B,P).

% inner evidence, "observe"-style: run program with observation at end
% player b sees player a's number, but believes they win if the sum of their numbers is greater than 8
inner(A) :-
     b(C),
     A+C > 8.

% outer evidence, "observe"-style: run program with observation at end
% the players win if their numbers sum to 13
win :-
     state(A,B),
     A+B =:= 13.

% which number should a choose to win?
query(a(_)).
evidence(win).