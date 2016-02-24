% model part from the bloodAaBb.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog, with arbitrary probabilities added

0.2::msw(locus1,'A'); 0.8::msw(locus1,a).
0.7::msw(locus2,'B'); 0.3::msw(locus2,b).

% ProbLog does not support if-then-else with ->, so we untangle
bloodtype(o) :-
    genotype(locus1,a,a),
    genotype(locus2,b,b).
bloodtype(a) :-
   genotype(locus1,'A',_Y1),
   genotype(locus2,b,b).
bloodtype(a) :-
   genotype(locus1,_,'A'),
   genotype(locus2,b,b).
bloodtype(b) :-
   genotype(locus1,a,a),
   genotype(locus2,'B',_).
bloodtype(b) :-
   genotype(locus1,a,a),
   genotype(locus2,_,'B').
bloodtype(ab) :-
   \+ bloodtype(o),
   \+ bloodtype(a),
   \+ bloodtype(b).

genotype(L,X,Y) :- msw(L,X),msw(L,Y).

query(bloodtype(_)).