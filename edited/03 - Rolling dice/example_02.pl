% annotated disjunctions
1/6::one(1); 1/6::two(1); 1/6::three(1); 1/6::four(1); 1/6::five(1); 1/6::six(1).
0.15::one(2); 0.15::two(2); 0.15::three(2); 0.15::four(2); 0.15::five(2); 0.25::six(2).
% properties one, two etc. are defined for objects '1' and '2' (i.e. our two dice)

% Rules:
odd(X) :- one(X).  % object X is odd if it has the property 'one'
odd(X) :- three(X).  % ... or 'three'
odd(X) :- five(X).  % ... or 'five'
even(X) :- \+ odd(X).  % if object X is not even, it's odd

query(odd(1)).
query(even(1)).
query(odd(2)).
query(even(2)).