% model part from the bloodABO.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog

% in contrast to PRISM, ProbLog memoizes random variables, so we need to add an ID to this switch
0.5::msw(gene,ID,a); 0.2::msw(gene,ID,b); 0.3::msw(gene,ID,o).

% ProbLog does not support if-then-else with ->, so we untangle
% clauses 2 and 3 overlap with the first, but unlike PRISM ProbLog does not require them to be mutex
bloodtype(X) :-
     genotype(X,X).
bloodtype(Y) :-
     genotype(o,Y).
bloodtype(X) :-
     genotype(X,o).
bloodtype(ab) :-
     genotype(X,Y),
     X \= Y,
     X \= o,
     Y \= o.

% tell ProbLog not to reuse X as Y by adding different extra arguments
genotype(X,Y) :- msw(gene,1,X),msw(gene,2,Y).

query(bloodtype(_)).