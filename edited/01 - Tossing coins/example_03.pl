% Probabilistic facts:
0.6::heads(C) :- coin(C).  % given a particular coin (C), the probability of a heads from that coin is 0.6

% Background information:
coin(c1).  % the coin called c1 exists in our tiny probabilistic world
coin(c2).
coin(c3).
coin(c4).

% Rules:
someHeads :- heads(_).  % '_' passes all of our related information (i.e. the coins which exist) in. This is effectively another disjunction ('or')

% Queries:
query(someHeads).