% Probabilistic facts:
0.5::heads1. % the probability of the event heads1 (i.e. the first coin being heads) is 0.5
0.6::heads2.

% Rules:
twoHeads :- heads1, heads2.  % the event twoHeads is the logical conjunction ('and') of the events heads1 and heads2

% Queries:
query(heads1).  % What is the probability of event heads1?
query(heads2).
query(twoHeads).  % What is the probability of the event twoHeads?