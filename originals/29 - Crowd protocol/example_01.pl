% define parameters c (percentage of collaborators), p (probability of forwarding) and k (maximum number of forwards)
c(0.1).
p(0.7).
k(8).

% the first step forwards for sure, and the probability of interception is c
C::intercepted(1); NC::not_intercepted(1) :- c(C),NC is 1-C.
% in later steps, the message is delivered with 1-p and intercepted with c
X::deliver(_) :- p(P), X is 1-P.
C::intercept_now(_) :- c(C).

% at time M, determine next state based on what happened before
% message was intercepted at some point and gets delivered now
delivered_intercepted(M) :-
    intercepted(M), deliver(M).
% message was not intercepted yet and gets delivered now
delivered_not_intercepted(M) :-
    not_intercepted(M), deliver(M).
% message was intercepted at some point and gets forwarded now
intercepted(M1) :-
    M1>1, M is M1-1,
    intercepted(M), \+deliver(M).
% message was intercepted for the first time and gets forwarded now
intercepted(M1) :-
    M1>1, M is M1-1,
    not_intercepted(M),\+deliver(M), intercept_now(M).
% message was still not intercepted and gets forwarded now
not_intercepted(M1) :-
    M1>1, M is M1-1,
    not_intercepted(M),\+deliver(M),\+intercept_now(M).

% has an intercepted message been delivered within the first K steps?
intercepted_delivery(K) :- between(1,K,N), delivered_intercepted(N).

% has a non-intercepted message been delivered within the first K steps?
not_intercepted_delivery(K) :- between(1,K,N), delivered_not_intercepted(N).

% did we make k steps without having delivered the message?
still_going(K) :- N is K+1, intercepted(N).
still_going(K) :- N is K+1, not_intercepted(N).

% given that we have delivered the message within k steps, was it intercepted or not?
evidence(still_going(K),false) :- k(K).
query(intercepted_delivery(K)) :- k(K).
query(not_intercepted_delivery(K)) :- k(K).