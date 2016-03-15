% annotated disjunctions
1/6::one(1); 1/6::two(1); 1/6::three(1); 1/6::four(1); 1/6::five(1); 1/6::six(1).
0.15::one(2); 0.15::two(2); 0.15::three(2); 0.15::four(2); 0.15::five(2); 0.25::six(2).

% Rules:
odd(X) :- one(X).
odd(X) :- three(X).
odd(X) :- five(X).
even(X) :- \+ odd(X).

query(odd(_)).  % '_' is an anonymous variable - problog returns the probabilities for all known objects which have that property
query(even(_)).  % beware! even() is only defined as the negation of odd, which doesn't work with non-ground queries