weight(skis,6).
weight(boots,4).
weight(helmet,3).
weight(gloves,2).

% intensional probabilistic fact with flexible probability:
P::pack(Item) :- weight(Item,Weight),  P is 1.0/Weight.

excess(Limit) :- excess([skis,boots,helmet,gloves],Limit). % all possible items
excess([],Limit) :- Limit<0.
excess([I|R],Limit) :- pack(I), weight(I,W), L is Limit-W, excess(R,L).
excess([I|R],Limit) :- \+pack(I), excess(R,Limit).
query(excess(8)).