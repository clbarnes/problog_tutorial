% model part from the german.psm example in Sato's PRISM distribution http://rjida.meijo-u.ac.jp/prism/
% adapted to ProbLog

0.2::msw(det,[m,nom,der]); 0.8::msw(det,[f,nom,die]).
0.6::msw(n,[m,nom,mann]); 0.4::msw(n,[f,nom,frau]).

% in contrast to PRISM, ProbLog does not depend on compiling negation away,
% and we therefore can directly use the parsing program to define failure

failure :- not(success).        % failure :- not(exist([X],np(X))).
success :- np(_).

np(L) :- np(L,[]).
np(L1,L3):-
  det(Gen,Case,L1,L2),
  n(Gen,Case,L2,L3).
det(Gen,Case,[Wd|L2],L2):-
  msw(det,R),R = [Gen,Case,Wd].
  n(Gen,Case,[Wd|L3],L3):-
  msw(n,R), R = [Gen,Case,Wd].

query(np(_)).
query(failure).