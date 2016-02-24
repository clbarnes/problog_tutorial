% annotated disjunctions
1/6::one1; 1/6::two1; 1/6::three1; 1/6::four1; 1/6::five1; 1/6::six1.
0.15::one2; 0.15::two2; 0.15::three2; 0.15::four2; 0.15::five2; 0.25::six2.

% Rules:
twoSix :- six1, six2.

someSix :- six1.
someSix :- six2.

% Queries:
query(six1).
query(six2).
query(twoSix).
query(someSix).