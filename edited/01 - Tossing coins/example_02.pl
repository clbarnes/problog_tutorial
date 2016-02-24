% Probabilistic facts:
0.5::heads1.
0.6::heads2.

% Rules:
someHeads :- heads1.  % someHeads is true if heads1 is true
someHeads :- heads2.  % someHeads is also true if heads2 is true. So someHeads is the logical disjunction ('or') of heads1 and heads2

% Queries:
query(someHeads).