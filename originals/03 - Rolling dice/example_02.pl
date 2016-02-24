% annotated disjunctions
1/6::one(1); 1/6::two(1); 1/6::three(1); 1/6::four(1); 1/6::five(1); 1/6::six(1).
0.15::one(2); 0.15::two(2); 0.15::three(2); 0.15::four(2); 0.15::five(2); 0.25::six(2).

% Rules:
odd(X) :- one(X).
odd(X) :- three(X).
odd(X) :- five(X).
even(X) :- \+ odd(X).

query(odd(1)).
query(even(1)).
query(odd(2)).
query(even(2)).